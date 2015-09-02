//
//  CoreMotionSample01AppDelegate.h
//  CoreMotionSample01
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreMotionSample01ViewController;

@interface CoreMotionSample01AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CoreMotionSample01ViewController *viewController;

@end
