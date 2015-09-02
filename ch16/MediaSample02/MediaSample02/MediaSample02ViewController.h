//
//  MediaSample02ViewController.h
//  MediaSample02
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface MediaSample02ViewController : UIViewController <AVAudioRecorderDelegate>{
@private
    IBOutlet UIButton * startBtn;
	IBOutlet UIButton * playBtn;
    IBOutlet UIButton * stopBtn;
	IBOutlet UIButton * finishBtn;
    IBOutlet UILabel *status;
	BOOL isPlay;
	
	NSURL * recordedTmpFile;
	AVAudioRecorder *recorder;
    AVAudioPlayer *player;
	NSError * error;
    NSMutableDictionary* recordSetting;
	
}
@property (nonatomic,retain)IBOutlet UILabel *status;
@property (nonatomic,retain)IBOutlet UIButton * startBtn;
@property (nonatomic,retain)IBOutlet UIButton * playBtn;
@property (nonatomic,retain)IBOutlet UIButton * stopBtn;
@property (nonatomic,retain)IBOutlet UIButton * finishBtn;

-(IBAction) startRecord:(id)sender;
-(IBAction) finishRecord:(id)sender;
-(IBAction) playTempAudio:(id)sender;
-(IBAction) stopPlayTempAudio:(id)sender;
-(void)setRecordConfig;

@end
