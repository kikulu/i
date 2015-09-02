//
//  CoreMotionSample02ViewController.m
//  CoreMotionSample02
//
//  Created by mac on 2011/1/30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CoreMotionSample02ViewController.h"
double gyrodata[3];
@implementation CoreMotionSample02ViewController
@synthesize gyroX,gyroY,gyroZ;
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
    [motionManager release];
    [gyroX release];
    [gyroY release];
    [gyroZ release];
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
    motionManager = [[CMMotionManager alloc] init];
    if(motionManager.gyroAvailable){
        [self startGetGyro];
        NSTimer *aTimer = [[NSTimer alloc] init];
        aTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showGyroData) userInfo:nil repeats:30];
        [self autoGetGyroData];
    }else {
        [motionManager release];
    }  
        
    /*NSOperationQueue *opQ;
    //CMGyroHandler *gyroHandler;
    if (motionManager.gyroAvailable) {
        
        opQ = [[NSOperationQueue currentQueue] retain];
        
        CMGyroHandler *gyroHandler = ^(CMGyroData *gyroData, NSError *error) {
            
            CMRotationRate rotate = gyroData.rotationRate;
            
            // handle rotation-rate data here......
            
        };
        
    } else {
        
        NSLog(@"No gyroscope on device.");
        
        //toggleButton.enabled = NO;
        
        [motionManager release];
        
    }
     */
    
}
-(void)startGetGyro
{
    motionManager.gyroUpdateInterval = 1.0/60.0;
    [motionManager startGyroUpdates];
}
-(void)stopGetGyro
{
    if(motionManager.gyroActive){
        [motionManager stopGyroUpdates];
    }
}
-(void)showGyroData{
    [self getGyroData];
    NSLog(@"%f %f %f",gyrodata[0],gyrodata[1],gyrodata[2]);
    gyroX.text = [NSString stringWithFormat:@"%f",gyrodata[0]];
    gyroY.text = [NSString stringWithFormat:@"%f",gyrodata[1]];
    gyroZ.text = [NSString stringWithFormat:@"%f",gyrodata[2]];
}

-(void)getGyroData
{
    CMGyroData *newgydodata = motionManager.gyroData;
    gyrodata[0] = newgydodata.rotationRate.x;
    gyrodata[1] = newgydodata.rotationRate.y;
    gyrodata[2] = newgydodata.rotationRate.z;
}

-(void)autoGetGyroData{
    [motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                               withHandler: ^(CMGyroData *gyroData, NSError *error)
     {
         CMRotationRate rotation = gyroData.rotationRate;
         NSLog(@"rotationrate:%f, %f, %f", rotation.x, rotation.y, rotation.z);
     }];

}
/*
- (IBAction)toggleGyroUpdates:(id)sender {
    
    if ([[(UIButton *)sender currentTitle] isEqualToString:@"Start"]) {
        
        [motionManager startGyroUpdatesToQueue:opQ withHandler:gyroHandler];
        
    } else {
        
        [motionManager stopGyroUpdates];
        
    }
    
}
 */
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
