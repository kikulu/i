//
//  TowerLiteViewController.h
//  TowerLite
//
//  Created by kikulu on 2011/1/17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Tower.h"

@interface TowerLiteViewController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate>{
@private
    MKMapView *mymap;
    CLLocationManager *locationManager;
    NSMutableArray *mapAnnotations;
}
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
-(void)initLocation;
@end
