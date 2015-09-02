//
//  CoreMotionSample02AppDelegate.h
//  CoreMotionSample02
//
//  Created by mac on 2011/1/30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoreMotionSample02ViewController;

@interface CoreMotionSample02AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CoreMotionSample02ViewController *viewController;

@end
