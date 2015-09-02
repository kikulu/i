//
//  MapSample04ViewController.m
//  MapSample04
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MapSample04ViewController.h"

@implementation MapSample04ViewController

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
    CLLocationCoordinate2D coors[5];
    coors[0] = CLLocationCoordinate2DMake(25.033408, 121.56409);
    coors[1] = CLLocationCoordinate2DMake(25.033308, 121.57509);
    coors[2] = CLLocationCoordinate2DMake(25.033308, 121.58609);
    coors[3] = CLLocationCoordinate2DMake(25.033458, 121.59759);
    coors[4] = CLLocationCoordinate2DMake(25.033358, 121.59859);     
    MKPolyline *polyline = [MKPolyline polylineWithCoordinates:coors count:5];
    [mymap addOverlay:polyline];
    
    MKCoordinateRegion region = mymap.region;
    region.span.latitudeDelta = 0.03; 
    region.span.longitudeDelta = 0.03;
    region.center = coors[1];
    [mymap setRegion:region animated:YES];
    [self.view insertSubview:mymap atIndex:0];
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    MKPolylineView *polylineview = [[[MKPolylineView alloc] initWithOverlay:overlay]autorelease];
    polylineview.strokeColor = [UIColor blueColor];
    polylineview.lineWidth = 5.0;
    return polylineview;
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
