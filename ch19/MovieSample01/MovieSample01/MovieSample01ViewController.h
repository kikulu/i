//
//  MovieSample01ViewController.h
//  MovieSample01
//
//  Created by mac on 2011/2/6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MovieSample01ViewController : UIViewController {
@private
    IBOutlet UIButton *playBtn;
    IBOutlet UIView *myView;
    AVAsset *movieAsset;
    AVPlayer *player;
    NSString *filePath;
    BOOL isPlay;
}
@property (nonatomic,retain) IBOutlet UIButton *playBtn;
@property (nonatomic,retain) IBOutlet UIView *myView;

-(IBAction)play:(id)sender;
-(void)setVideoFile;
@end
