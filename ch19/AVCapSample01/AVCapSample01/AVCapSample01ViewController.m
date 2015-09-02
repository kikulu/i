//
//  AVCapSample01ViewController.m
//  AVCapSample01
//
//  Created by mac on 2011/2/6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AVCapSample01ViewController.h"

@implementation AVCapSample01ViewController
@synthesize myView,recordBtn,playBtn;
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
	[myView release];
	[recordBtn release];
    [playBtn release];
	[fileUrl release];
	[filePath release];
    [player release];
    [captureOutput release];
    [captureSession release];
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
    [self setCaptureConfig];
    [self outputFile];
    playBtn.enabled=NO;
}

-(void)setCaptureConfig{
    captureSession = [[AVCaptureSession alloc] init];
    [self checkDevice];
    [self setPreview];
	isRecord = NO;
    isPlay = NO;

}
-(void)outputFile{
	
	captureOutput = [[AVCaptureMovieFileOutput alloc] init];
    
	if (! fileUrl) {
        NSArray *dirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        filePath = [[dirs objectAtIndex:0] stringByAppendingPathComponent:@"test.mov"];
		fileUrl = [[NSURL alloc] initFileURLWithPath:filePath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
        }    
	}
    NSLog(@"recording to %@",fileUrl);
     
	[captureSession addOutput:captureOutput];

}

-(void)checkDevice{
    NSError *error = nil;
    AVCaptureDevice *muxedDevice = [AVCaptureDevice defaultDeviceWithMediaType: AVMediaTypeMuxed];
	if (muxedDevice) {
		AVCaptureDeviceInput *muxedInput = [AVCaptureDeviceInput deviceInputWithDevice:muxedDevice																 error:&error];
		if (muxedInput) {
			[captureSession addInput:muxedInput];
		}
	} else {
		AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithMediaType: AVMediaTypeVideo];
		if (videoDevice) {
			AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:videoDevice
                                                                                  error:&error];
			if (videoInput) {
				[captureSession addInput: videoInput];
			}
		}
		AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType: AVMediaTypeAudio];
		if (audioDevice) {
			AVCaptureDeviceInput *audioInput = [AVCaptureDeviceInput deviceInputWithDevice:audioDevice
																					 error:&error];
			if (audioInput) {
				[captureSession addInput: audioInput];
			}
		}
	}
}

-(void)setPreview{
    AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:captureSession];
	previewLayer.frame = myView.layer.bounds;
	previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	[myView.layer addSublayer:previewLayer];
}

-(IBAction) record:(id)sender{
    NSLog(@"press record");
    if(!isRecord){
        NSLog(@"not record");
        [captureSession startRunning];
        recordBtn.enabled = YES;
		[captureOutput startRecordingToOutputFileURL:fileUrl
                                     recordingDelegate:self];
        isRecord = YES;
        
    }else{
        NSLog(@"recording");
        playBtn.enabled =NO;
        [captureSession stopRunning];
        recordBtn.enabled =NO;
        [captureOutput stopRecording];
        isRecord = NO;
        isPlay=YES;
        playBtn.enabled = YES;
    }
}

-(IBAction)play:(id)sender{
    if(!isPlay){
        NSLog(@"無法播放");
    }else{
        if (!player) {
            AVURLAsset *movieAsset	= [[AVURLAsset URLAssetWithURL:fileUrl options:nil] retain];
            AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
            player = [[AVPlayer playerWithPlayerItem:playerItem] retain];
            AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
            playerLayer.frame = myView.layer.bounds;
            playerLayer.videoGravity = AVLayerVideoGravityResize;
            [myView.layer addSublayer:playerLayer];
        
            [player play];
            isRecord = YES;
        }
 
    }
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput
didStartRecordingToOutputFileAtURL:(NSURL *)fileURL
      fromConnections:(NSArray *)connections {
	NSLog (@"開始寫入影片至 %@", fileURL);
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput
didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL
      fromConnections:(NSArray *)connections error:(NSError *)error {
	if (error) { 
		NSLog (@"錄影失敗: %@", error);
	} else {
		NSLog (@"錄製影片至 %@", outputFileURL);
	}
	
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
