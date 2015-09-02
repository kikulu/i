//
//  Tower.m
//  TowerLite
//
//  Created by kikulu on 2011/1/17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Tower.h"


@implementation Tower
@synthesize myCoordinate, Title, subTitle;
- (id)init {
    if ((self = [super init])) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc {
    // Clean-up code here.
    
    [super dealloc];
}

- (CLLocationCoordinate2D)coordinate;{
    return self.myCoordinate;
}
- (NSString *)title{
    return self.Title;
}
- (NSString *)subtitle{
    return self.subTitle;
}
@end
