//
//  RootViewController.h
//  AssetSample01
//
//  Created by mac on 2011/2/5.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface RootViewController : UITableViewController {
@private

    ALAssetsLibrary *library;
	NSMutableArray *assets;
}

@property (nonatomic,retain) NSMutableArray *assets;


@end
