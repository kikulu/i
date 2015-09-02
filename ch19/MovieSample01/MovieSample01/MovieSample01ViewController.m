//
//  MovieSample01ViewController.m
//  MovieSample01
//
//  Created by mac on 2011/2/6.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MovieSample01ViewController.h"

@implementation MovieSample01ViewController
@synthesize myView,playBtn;
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
    [playBtn release];
    [player release];
    [movieAsset release];
    [filePath release];
    
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
    [self setVideoFile];
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
	player = [[AVPlayer playerWithPlayerItem:playerItem] retain];
	
	AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
	[myView.layer addSublayer:playerLayer];
	playerLayer.frame = myView.layer.bounds;
	playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    isPlay = NO;
}

-(void)setVideoFile{
    filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"MOV"];
    NSLog (@"影片位於 %@", filePath);
    NSURL *sourceMovieURL = [NSURL fileURLWithPath:filePath];
    movieAsset	= [[AVURLAsset URLAssetWithURL:sourceMovieURL options:nil] retain];
}


-(IBAction)play:(id)sender {
    if(!isPlay){
        [player play];
        isPlay = YES;
    }else{
        [player pause];
        isPlay = NO;
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
