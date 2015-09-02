//
//  Tower.h
//  TowerLite
//
//  Created by kikulu on 2011/1/17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Tower : NSObject <MKAnnotation>{
@private
    CLLocationCoordinate2D myCoordinate;
    NSString *Title;
    NSString *subTitle;
}

@property(readwrite,assign, nonatomic) CLLocationCoordinate2D myCoordinate;
@property(retain, nonatomic) NSString *Title;
@property(retain, nonatomic) NSString *subTitle;

@end
