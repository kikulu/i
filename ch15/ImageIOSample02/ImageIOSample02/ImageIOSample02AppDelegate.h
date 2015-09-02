//
//  ImageIOSample02AppDelegate.h
//  ImageIOSample02
//
//  Created by kikulu on 2011/1/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageIOSample02ViewController;

@interface ImageIOSample02AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImageIOSample02ViewController *viewController;

@end
