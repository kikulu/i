//
//  ImageIOSample01ViewController.h
//  ImageIOSample01
//
//  Created by kikulu on 2011/1/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
@interface ImageIOSample01ViewController : UIViewController {
@private
    IBOutlet UIImageView *myImageView;
    IBOutlet UITextView *myImageInfo;
}

@property (nonatomic,retain) IBOutlet UIImageView *myImageView;
@property (nonatomic,retain) IBOutlet UITextView *myImageInfo;

-(void)getImageFromWeb;
-(void)showImage;

@end
