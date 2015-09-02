//
//  MediaSample02ViewController.m
//  MediaSample02
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MediaSample02ViewController.h"

@implementation MediaSample02ViewController
@synthesize playBtn,finishBtn,stopBtn,status,startBtn;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [playBtn release];
    [finishBtn release];
    [startBtn release];
    [stopBtn release];
    [status release];
    [recorder release];
    [recordedTmpFile release];
    [error release];
    [recordSetting release];
    [player release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	isPlay = NO;
	playBtn.enabled = NO;
    stopBtn.enabled = NO;
    finishBtn.enabled = NO;
    
	AVAudioSession * audioSession = [AVAudioSession sharedInstance];
	[audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: &error];
	[audioSession setActive:YES error: &error];

}

-(void)setRecordConfig{
    recordSetting = [[NSMutableDictionary alloc] init];
    [recordSetting setValue :[NSNumber numberWithInt:kAudioFormatAppleIMA4] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey]; 
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    recordedTmpFile = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent: [NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"caf"]]];

}

-(IBAction)finishRecord:(id)sender{
    status.text = @"錄音完成";
    [recorder stop];
    isPlay = YES;
    playBtn.enabled = YES;

}

-(IBAction)startRecord:(id)sender{
    [self setRecordConfig];
    recorder = [[ AVAudioRecorder alloc] initWithURL:recordedTmpFile settings:recordSetting error:&error];
    [recorder setDelegate:self];
    [recorder prepareToRecord];
    [recorder record];
    playBtn.enabled = NO;
    stopBtn.enabled = NO;
    finishBtn.enabled = YES;
    startBtn.enabled = NO;
    status.text = @"錄音中......";

}

-(IBAction)playTempAudio:(id)sender{
    if(isPlay){
       	player = [[AVAudioPlayer alloc] initWithContentsOfURL:recordedTmpFile error:&error];
        [player prepareToPlay];
        [player play];
        stopBtn.enabled =YES;
        startBtn.enabled = NO;
        finishBtn.enabled = NO;
        status.text = @"試聽錄音檔";
    }
}


-(IBAction)stopPlayTempAudio:(id)sender{
    if(isPlay){
        [player stop];
        stopBtn.enabled=NO;
        startBtn.enabled =YES;
        status.text = @"";
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    NSFileManager * tempfile = [NSFileManager defaultManager];
	[tempfile removeItemAtPath:[recordedTmpFile path] error:&error];
	recorder = nil;
	recordedTmpFile = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
