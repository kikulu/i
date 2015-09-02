//
//  TowerLiteViewController.m
//  TowerLite
//
//  Created by kikulu on 2011/1/17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TowerLiteViewController.h"

@implementation TowerLiteViewController
@synthesize mapAnnotations;

int occupyTimes=0;
BOOL occupied=NO;
CLLocationCoordinate2D location;
NSTimer *timer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [locationManager release];
    [mymap release];
    [mapAnnotations release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [super viewDidLoad];
    [self initLocation];
    timer = [NSTimer scheduledTimerWithTimeInterval:10  target:self selector:@selector(startOccupy) userInfo:nil repeats:YES];

}

-(void) initTower
{
    mymap =[[MKMapView alloc] initWithFrame:self.view.bounds];
    mymap.showsUserLocation=TRUE;
	mymap.mapType=MKMapTypeHybrid;
	mymap.delegate=self;
	MKCoordinateRegion mapRegion;
	MKCoordinateSpan mapSpan;
	mapSpan.latitudeDelta=0.002;
	mapSpan.longitudeDelta=0.002;
	CLLocationCoordinate2D mapCenter = location;
	mapRegion.span=mapSpan;
	mapRegion.center=mapCenter;
	mymap.scrollEnabled=NO;
	mymap.zoomEnabled=NO;
    [mymap setCenterCoordinate:location];
	[mymap setRegion:mapRegion];
	[mymap regionThatFits:mapRegion];
    
    Tower *tower = [[Tower alloc] init];
    NSString *latitudeString=[[NSString alloc] initWithFormat:@"%g",location.latitude];
	NSString *longitudeString=[[NSString alloc] initWithFormat:@"%g",location.longitude];
    NSLog(@"Location: %@ ,%@",latitudeString,longitudeString);
    tower.myCoordinate = location;
    tower.Title =@"Tower";
    tower.subTitle = @"";
    NSLog(@"Times : %i",occupyTimes);    
    if(occupyTimes >4){
        tower.subTitle = @"Occupy Successed";
    }else{   
        tower.subTitle = @"No Occupy"; 
    }
    NSLog(@"subTitle %@ ",tower.subTitle);
    
    self.mapAnnotations = [[NSMutableArray alloc] initWithCapacity:1];
    [self.mapAnnotations insertObject:tower atIndex:0];
    [mymap addAnnotations:mapAnnotations];
    
}

-(void) initLocation
{
    locationManager = [[CLLocationManager alloc] init];
	locationManager.delegate=self;
	locationManager.desiredAccuracy=kCLLocationAccuracyBest;
	[locationManager startUpdatingLocation];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    MKAnnotationView *annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"test"] autorelease];
    annotationView.canShowCallout = YES;
    UIImage *castleimg ;
    
    if(!occupied){
        castleimg = [UIImage imageNamed:@"castle01.png"];
    }else{
        castleimg = [UIImage imageNamed:@"castle02.png"];
    }
    CGRect resizeRect;
    resizeRect.size = castleimg.size;
    if (resizeRect.size.width > 32)
        resizeRect.size = CGSizeMake(32, resizeRect.size.height / resizeRect.size.width * 32);
    if (resizeRect.size.height >32)
        resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * 32, 32);
    resizeRect.origin = (CGPoint){0.0f, 0.0f};
    UIGraphicsBeginImageContext(resizeRect.size);
    [castleimg drawInRect:resizeRect];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    annotationView.image = resizedImage;
    annotationView.opaque = NO;
    return annotationView;
}

-(void)startOccupy{
    if(occupyTimes > 4){
        occupied = YES;
        [timer invalidate];
        [mymap removeAnnotations:mapAnnotations];
        [mymap addAnnotations:mapAnnotations];
        NSString *msg = @"Here had Occupied";
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Occupy Success"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
    }else{
        occupyTimes++;
        
    }
    
}


- (void)locationManager:(CLLocationManager *)manager 
	didUpdateToLocation:(CLLocation *)newLocation 
		   fromLocation:(CLLocation *)oldLocation
{
	CLLocationCoordinate2D loc= [newLocation coordinate];
	[locationManager stopUpdatingLocation];
    location = loc;
    [self initTower];
    [self.view insertSubview:mymap atIndex:0];
    
    
}

- (void)locationManager:(CLLocationManager *)manager 
	   didFailWithError:(NSError *)error
{
	NSString *errorType = (error.code == kCLErrorDenied) ? 
    @"Access Denied" : @"Unknown Error";
    NSLog(@"Error getting Location : %@",errorType); 
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
