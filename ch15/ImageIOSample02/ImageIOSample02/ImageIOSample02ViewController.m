//
//  ImageIOSample02ViewController.m
//  ImageIOSample02
//
//  Created by kikulu on 2011/1/20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageIOSample02ViewController.h"

@implementation ImageIOSample02ViewController
@synthesize myImageView,myThumbnailView;
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
    [myImageView release];
    [myThumbnailView release];
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
    [self showImages];
}

-(void)showImages{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"test.jpg" withExtension:nil];
    CGImageSourceRef myImageSource;
    myImageSource = CGImageSourceCreateWithURL((CFURLRef)modelURL, NULL);
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(myImageSource, 0, NULL);
    int imageSize = 240;
    CFNumberRef thumbnailSize = CFNumberCreate(NULL, kCFNumberIntType, &imageSize);
    CFTypeRef isCreateThumbnail = kCFBooleanTrue;
    NSString *createThumbnailFromImage = (NSString *)kCGImageSourceCreateThumbnailFromImageIfAbsent;
    NSString *ThumbnailMaxSize = (NSString *)kCGImageSourceThumbnailMaxPixelSize;
    NSDictionary *options = 
    [[NSDictionary alloc] initWithObjectsAndKeys:(void *)isCreateThumbnail,(void *)createThumbnailFromImage,(void *)thumbnailSize, (void *)ThumbnailMaxSize,nil];
    CGImageRef image = CGImageSourceCreateImageAtIndex(myImageSource,0, NULL);
    CGImageRef thumbnailimage = CGImageSourceCreateThumbnailAtIndex(myImageSource, 0,(CFDictionaryRef)options);
    [myImageView setImage:[UIImage imageWithCGImage:image]];
    [myThumbnailView setImage:[UIImage imageWithCGImage:thumbnailimage]];
    CFRelease(myImageSource);
    CFRelease(imageProperties); 
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
