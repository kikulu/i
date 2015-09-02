//
//  MediaSample01ViewController.h
//  MediaSample01
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface MediaSample01ViewController : UIViewController {
@private
    IBOutlet UIButton *playBtn;
    IBOutlet UIButton *stopBtn;
    AVAudioPlayer *audioPlayer;
}

@property (nonatomic, retain) IBOutlet UIButton *playBtn;
@property (nonatomic, retain) IBOutlet UIButton *stopBtn;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

-(IBAction)play:(id)sender;
-(IBAction)stop:(id)sender;
@end
