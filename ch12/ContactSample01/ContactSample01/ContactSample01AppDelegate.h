//
//  ContactSample01AppDelegate.h
//  ContactSample01
//
//  Created by Mac on 2011/3/30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactSample01ViewController;

@interface ContactSample01AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ContactSample01ViewController *viewController;

@end
