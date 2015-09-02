//
//  Place.m
//  MapSample03
//
//  Created by mac on 2011/4/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Place.h"

@implementation Place

@synthesize myCoordinate, Title, subTitle;

- (CLLocationCoordinate2D)coordinate;
{
    return self.myCoordinate;
}

- (NSString *)title
{
    return self.Title;
}

- (NSString *)subtitle
{
    return self.subTitle;
}


@end
