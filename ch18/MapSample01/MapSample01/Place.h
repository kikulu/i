//
//  Place.h
//  MapSample01
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Place : NSObject <MKAnnotation> {
    CLLocationCoordinate2D myCoordinate;
    NSString *Title;
    NSString *subTitle;
}

@property(assign, nonatomic) CLLocationCoordinate2D myCoordinate;
@property(retain, nonatomic) NSString *Title;
@property(retain, nonatomic) NSString *subTitle;

@end


