//
//  MapSample02ViewController.m
//  MapSample02
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapSample02ViewController.h"

@implementation MapSample02ViewController

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
    mymap.mapType = MKMapTypeStandard;
    mymap.delegate = self;
    
    CLLocationCoordinate2D mapCenter;
	mapCenter.latitude = 25.033308;
	mapCenter.longitude = 121.57509;
	
	MKCoordinateSpan mapSpan;
	mapSpan.latitudeDelta = 0.02;
	mapSpan.longitudeDelta = 0.02;
    
	MKCoordinateRegion mapRegion;
	mapRegion.center = mapCenter;
	mapRegion.span = mapSpan;
	
	mymap.scrollEnabled = NO;
	mymap.zoomEnabled = NO;
	
	[mymap setRegion:mapRegion];
	[mymap regionThatFits:mapRegion];	
    [mymap setShowsUserLocation:NO];
    
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:mapCenter radius:500];
    [mymap addOverlay:circle];
    [self.view insertSubview:mymap atIndex:0];
    
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay{
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:overlay];
    circleView.fillColor = [UIColor redColor];
    circleView.strokeColor = [UIColor blueColor];
    circleView.alpha = 0.3;
    return circleView;
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
