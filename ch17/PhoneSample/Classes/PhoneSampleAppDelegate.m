//
//  PhoneSampleAppDelegate.m
//  PhoneSample
//
//  Created by kikulu on 2011/1/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "PhoneSampleAppDelegate.h"

#import "PhoneSampleViewController.h"

@implementation PhoneSampleAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
     
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [viewController release];
    [super dealloc];
}

@end
