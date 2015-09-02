//
//  ImageIOSample01AppDelegate.h
//  ImageIOSample01
//
//  Created by kikulu on 2011/1/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ImageIOSample01ViewController;

@interface ImageIOSample01AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ImageIOSample01ViewController *viewController;

@end
