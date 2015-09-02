//
//  PhoneSample02AppDelegate.h
//  PhoneSample02
//
//  Created by Fang Ho on 2011/4/8.
//  Copyright 2011年 National Tsing Hua University. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PhoneSample02ViewController;

@interface PhoneSample02AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PhoneSample02ViewController *viewController;

@end
