//
//  AVCapSample01ViewController.h
//  AVCapSample01
//
//  Created by mac on 2011/2/6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AVCapSample01ViewController : UIViewController <AVCaptureFileOutputRecordingDelegate>{
@private
    IBOutlet UIView *myView;
    IBOutlet UIButton *recordBtn;
    IBOutlet UIButton *playBtn;
    
    BOOL isRecord;
    BOOL isPlay;
    NSString *filePath;
    NSURL *fileUrl;
    AVCaptureSession *captureSession;
    AVCaptureMovieFileOutput *captureOutput;
    AVPlayer *player;
}

@property (nonatomic,retain)IBOutlet UIView *myView;
@property (nonatomic,retain)IBOutlet UIButton *recordBtn;
@property (nonatomic,retain)IBOutlet UIButton *playBtn;

-(void)setCaptureConfig;
-(void)checkDevice;
-(void)setPreview;
-(void)outputFile;
-(IBAction)record:(id)sender;
-(IBAction)play:(id)sender;

@end
