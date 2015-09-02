//
//  ImageIOSample01ViewController.m
//  ImageIOSample01
//
//  Created by kikulu on 2011/1/14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ImageIOSample01ViewController.h"

@implementation ImageIOSample01ViewController
@synthesize myImageView,myImageInfo;

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
    [myImageInfo release];
    [myImageView release];
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
    [self getImageFromWeb];
    [self showImage];
}

-(void)showImage{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"test.jpg" withExtension:nil];
    CGImageSourceRef myImageSource;
    myImageSource = CGImageSourceCreateWithURL((CFURLRef)modelURL, NULL);
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(myImageSource, 0, NULL);
    CGImageRef image = CGImageSourceCreateImageAtIndex(myImageSource,0, NULL);
    [myImageView setImage:[UIImage imageWithCGImage:image]];
    CFDictionaryRef tiff = CFDictionaryGetValue(imageProperties, kCGImagePropertyTIFFDictionary);
    CFDictionaryRef exif = CFDictionaryGetValue(imageProperties, kCGImagePropertyExifDictionary);
    NSString *model = (NSString *)CFDictionaryGetValue(tiff,kCGImagePropertyTIFFModel);
    NSString *make = (NSString *)CFDictionaryGetValue(tiff,kCGImagePropertyTIFFMake);
    NSString *focallength = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifFocalLength);
    NSString *datetime = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifDateTimeOriginal);
    NSString *aperture = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifApertureValue);
    NSString *shutterspeed = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifShutterSpeedValue);
    NSString *ExposureTime = (NSString *)CFDictionaryGetValue(exif, kCGImagePropertyExifExposureTime);
    
    myImageInfo.text = [NSString stringWithFormat:
                        @"製造商: %@\n設備型號: %@\n焦距: %@\n拍攝時間: %@\n光圈: %@\n快門速度: %@\n曝光時間: %@\n",
                        make,model,focallength,datetime,aperture,shutterspeed,ExposureTime];
    myImageInfo.backgroundColor = [UIColor redColor];
    CFRelease(myImageSource);
    CFRelease(imageProperties);

}

-(void)getImageFromWeb
{
   CFURLRef url;
   url=(CFURLRef)[NSURL URLWithString:@"http://pic.pimg.tw/rita26/ff6b8b83bf6868641013c85a56df783d.jpg"];
   CGImageSourceRef imageSource;
   imageSource = CGImageSourceCreateWithURL(url, NULL);
   CFDictionaryRef imageProperties;
   imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
   NSString *imageWidth = (NSString *)CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
   NSString *imageHeight = (NSString *)CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
    NSLog(@"Image width :%@ ,Image Height : %@",imageWidth,imageHeight);
    CFRelease(imageProperties); 
    CFRelease(imageSource);

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
