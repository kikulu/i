//
//  InAppSMSSampleAppDelegate.h
//  InAppSMSSample
//
//  Created by Mac on 2011/3/22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InAppSMSSampleViewController;

@interface InAppSMSSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet InAppSMSSampleViewController *viewController;

@end
