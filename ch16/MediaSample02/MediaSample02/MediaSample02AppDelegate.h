//
//  MediaSample02AppDelegate.h
//  MediaSample02
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MediaSample02ViewController;

@interface MediaSample02AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MediaSample02ViewController *viewController;

@end
