//
//  PhoneSampleAppDelegate.h
//  PhoneSample
//
//  Created by kikulu on 2011/1/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhoneSampleViewController;

@interface PhoneSampleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PhoneSampleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PhoneSampleViewController *viewController;

@end
