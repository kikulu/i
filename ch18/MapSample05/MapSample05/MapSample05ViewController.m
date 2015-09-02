//
//  MapSample05ViewController.m
//  MapSample05
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapSample05ViewController.h"

@implementation MapSample05ViewController

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
    mymap.mapType = MKMapTypeStandard;
    mymap = [[MKMapView alloc] initWithFrame:self.view.bounds];
    CLLocationCoordinate2D coors[3];
    coors[0] = CLLocationCoordinate2DMake(25.033408, 121.56409);
    coors[1] = CLLocationCoordinate2DMake(25.043308, 121.56409);
    coors[2] = CLLocationCoordinate2DMake(25.040308, 121.60009);
    mymap.delegate = self;
    CLLocationCoordinate2D mapCenter;
	mapCenter.latitude = (coors[0].latitude+coors[1].latitude)/2;
	mapCenter.longitude = (coors[0].longitude+coors[2].longitude)/2;
	
	MKCoordinateSpan mapSpan;
	mapSpan.latitudeDelta = 0.002;
	mapSpan.longitudeDelta = 0.002;
    
    MKCoordinateRegion region = mymap.region;
    region.span.latitudeDelta = 0.05; 
    region.span.longitudeDelta = 0.05;
    
    region.center = mapCenter; 
    MKPolygon *polygon = [MKPolygon polygonWithCoordinates:coors count:3];
    [mymap addOverlay:polygon];
    [mymap setRegion:region animated:YES];
    [self.view insertSubview:mymap atIndex:0];
    
}

#pragma mark MKMapViewDelegate methods
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    MKPolygonView *polygonview = [[[MKPolygonView alloc] initWithOverlay:overlay]autorelease];
    polygonview.strokeColor = [UIColor blueColor];
    polygonview.fillColor = [UIColor greenColor];
    polygonview.alpha = 0.3;
    return polygonview;
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
