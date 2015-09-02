//
//  MovieSample01AppDelegate.h
//  MovieSample01
//
//  Created by mac on 2011/2/6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MovieSample01ViewController;

@interface MovieSample01AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MovieSample01ViewController *viewController;

@end
