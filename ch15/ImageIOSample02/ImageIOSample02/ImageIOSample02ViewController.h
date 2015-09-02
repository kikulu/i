//
//  ImageIOSample02ViewController.h
//  ImageIOSample02
//
//  Created by kikulu on 2011/1/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
@interface ImageIOSample02ViewController : UIViewController {
@private
    IBOutlet UIImageView *myImageView;
    IBOutlet UIImageView *myThumbnailView;
}

@property (nonatomic,retain) IBOutlet UIImageView *myImageView;
@property (nonatomic,retain) IBOutlet UIImageView *myThumbnailView;

-(void)showImages;
@end
