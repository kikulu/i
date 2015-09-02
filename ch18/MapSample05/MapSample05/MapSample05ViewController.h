//
//  MapSample05ViewController.h
//  MapSample05
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapSample05ViewController : UIViewController <MKMapViewDelegate>{
    MKMapView *mymap;
}

@end