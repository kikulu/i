//
//  MediaSample01ViewController.m
//  MediaSample01
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MediaSample01ViewController.h"

@implementation MediaSample01ViewController
@synthesize playBtn,stopBtn,audioPlayer;
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
    [stopBtn release];
    [audioPlayer release];
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
    // Get the file path to the song to play.
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"rainbow"
                                                         ofType:@"mp3"];
    
    // Convert the file path to a URL.
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    
    //Initialize the AVAudioPlayer.
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:fileURL error:nil];
    
    // Preloads the buffer and prepares the audio for playing.
    [self.audioPlayer prepareToPlay];
    
    [filePath release];
    [fileURL release];
}

-(IBAction)play:(id)sender{
    
    // Make sure the audio is at the start of the stream.
    self.audioPlayer.currentTime = 0;
    
    [self.audioPlayer play];
    
}

-(IBAction)stop:(id)sender {
    
    [self.audioPlayer stop];
    
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
