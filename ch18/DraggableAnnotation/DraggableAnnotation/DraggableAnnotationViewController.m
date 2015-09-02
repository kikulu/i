//
//  DraggableAnnotationViewController.m
//  DraggableAnnotation
//

#import "DraggableAnnotationViewController.h"
#import "Place.h"

@implementation DraggableAnnotationViewController
@synthesize locationMgr, currentLocation, mapView;

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{	
    NSLog(@"locationManager:didUpdateToLocation:fromLocation:");
	[locationMgr stopUpdatingLocation];
	
    currentLocation = newLocation;
	
	[mapView setRegion:MKCoordinateRegionMake(currentLocation.coordinate, MKCoordinateSpanMake(0.05f, 0.05f))];	
	[mapView setShowsUserLocation:NO];
	
	Place *annotation = [[[Place alloc] initWithCoordinate:self.currentLocation.coordinate addressDictionary:nil] autorelease];
	annotation.title = @"可拖曳!";
	annotation.subtitle = @"可拖曳至地圖上任意處";
	
	[mapView addAnnotation:annotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)MapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    NSLog(@"mapView:viewForAnnotation:");
	static NSString * const kPinAnnotationIdentifier = @"AnnotationIdentifier";
	
    MKAnnotationView *draggablePinView = [MapView dequeueReusableAnnotationViewWithIdentifier:kPinAnnotationIdentifier];
	
	if (draggablePinView) {
		draggablePinView.annotation = annotation;
	} else {		
		draggablePinView = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kPinAnnotationIdentifier] autorelease];
	}
	draggablePinView.draggable = YES;
    draggablePinView.canShowCallout = YES;
	
    return draggablePinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)annotationView didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState 
{
    NSLog(@"mapView:annotationView:didChangeDragState:fromOldState:");
	if (oldState == MKAnnotationViewDragStateDragging) {
		Place *annotation = (Place *)annotationView.annotation;
		annotation.subtitle = [NSString stringWithFormat:@"%f %f", annotation.coordinate.latitude, annotation.coordinate.longitude];		
	}
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[mapView setMapType:MKMapTypeHybrid];
	[mapView setDelegate:self];
    
	locationMgr = [[CLLocationManager alloc] init];
	[locationMgr setDelegate:self];
	[locationMgr setDesiredAccuracy:kCLLocationAccuracyBest];
	[locationMgr startUpdatingLocation];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
