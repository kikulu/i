//
//  AssetSample01AppDelegate.h
//  AssetSample01
//
//  Created by mac on 2011/2/5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AssetSample01AppDelegate : NSObject <UIApplicationDelegate> {
@private

    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
