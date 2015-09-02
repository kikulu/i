//
//  MapSample03ViewController.h
//  MapSample03
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Place.h"

@interface MapSample03ViewController : UIViewController <MKMapViewDelegate,MKReverseGeocoderDelegate>{
    MKMapView *mymap;
    
}



@end