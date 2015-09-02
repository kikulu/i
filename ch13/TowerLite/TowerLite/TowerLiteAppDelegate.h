//
//  TowerLiteAppDelegate.h
//  TowerLite
//
//  Created by kikulu on 2011/1/17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TowerLiteViewController;

@interface TowerLiteAppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TowerLiteViewController *viewController;

@end
