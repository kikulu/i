//
//  MapSample03ViewController.m
//  MapSample03
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapSample03ViewController.h"

@implementation MapSample03ViewController

- (void)dealloc
{
    [super dealloc];
    [mymap release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad {
 [super viewDidLoad];
 mymap = [[MKMapView alloc] initWithFrame:self.view.bounds];
 mymap.showsUserLocation = TRUE;
 mymap.mapType = MKMapTypeStandard;
 mymap.delegate = self;
 
 MKCoordinateRegion mapRegion;
 
 CLLocationCoordinate2D mapCenter;
 mapCenter.latitude = 25.033408;
 mapCenter.longitude = 121.564099;
 
 MKCoordinateSpan mapSpan;
 mapSpan.latitudeDelta = 0.02;
 mapSpan.longitudeDelta = 0.02;
 
 mapRegion.center = mapCenter;
 mapRegion.span = mapSpan;
 
 mymap.scrollEnabled = NO;
 mymap.zoomEnabled = NO;
 
 [mymap setRegion:mapRegion];
 [mymap regionThatFits:mapRegion];
 MKReverseGeocoder *reverseGeocoder = [[MKReverseGeocoder alloc] initWithCoordinate:mapCenter];
 reverseGeocoder.delegate = self;
 [reverseGeocoder start];
 
 [self.view insertSubview:mymap atIndex:0];
 }
 
 
 
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
 {
 NSString *errorMessage = [error localizedDescription];
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Get Address Fail"
 message:errorMessage
 delegate:nil
 cancelButtonTitle:@"OK"
 otherButtonTitles:nil];
 [alertView show];
 [alertView release];
 }
 - (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
 NSString *address = [NSString stringWithFormat:@"%@ %@ %@ %@ %@%@",
 //placemark.country,
 placemark.administrativeArea,
 placemark.locality,
 placemark.subLocality,
 //placemark.thoroughfare,
 //placemark.postalCode,
 //placemark.countryCode,
 placemark.subThoroughfare];
 Place *mplace = [[Place alloc] init];
 CLLocationCoordinate2D mapCenter;
 mapCenter.latitude = 25.033408;
 mapCenter.longitude = 121.564099;
 mplace.myCoordinate = mapCenter;
 mplace.Title =@"Taipei 101";
 mplace.subTitle = address;
 [mymap addAnnotation:mplace];
 geocoder = nil;
 }
 
 - (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation {
 MKPinAnnotationView * pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
 pinView.pinColor=MKPinAnnotationColorPurple;
 pinView.animatesDrop=TRUE;
 pinView.canShowCallout=YES;
 return pinView;
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
