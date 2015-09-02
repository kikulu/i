//
//  CoreMotionSample01ViewController.m
//  CoreMotionSample01
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CoreMotionSample01ViewController.h"

@implementation CoreMotionSample01ViewController
double accelerationData[3];
@synthesize accelerationx,accelerationy,accelerationz;
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
    [accelerationx release];
    [accelerationy release];
    [accelerationz release];
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
    if(motionManager.accelerometerAvailable){
        memset(accelerationData, 0, sizeof(accelerationData));
        NSTimer *aTimer = [[NSTimer alloc] init];
        aTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showAcceleration) userInfo:nil repeats:NO];
        [self autoGetAcceleration];
    }else{
        NSLog(@"Dont't support accelerometer");
        [motionManager release];
    }
}
-(void)startGetAcceleration{
        motionManager.accelerometerUpdateInterval = 0.01;
        [motionManager startAccelerometerUpdates];
}

-(void)showAcceleration{
    [self getAcceleration];
    accelerationx.text = [NSString stringWithFormat:@"%f",accelerationData[0]];
    accelerationy.text = [NSString stringWithFormat:@"%f",accelerationData[1]];
    accelerationz.text = [NSString stringWithFormat:@"%f",accelerationData[2]];
    
}

-(void)getAcceleration{
    CMAccelerometerData *newestAccel = motionManager.accelerometerData;
    accelerationData[0] = newestAccel.acceleration.x;
    accelerationData[1] = newestAccel.acceleration.y;
    accelerationData[2] = newestAccel.acceleration.z;
}

-(void)stopGetAcceleration{
    if(motionManager.accelerometerActive){
        [motionManager stopAccelerometerUpdates];    
    }
    
}

-(void)autoGetAcceleration{
    [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                               withHandler: ^(CMAccelerometerData *acceleData, NSError *error)
     {
         CMAcceleration accel = acceleData.acceleration;
         NSLog(@"rotationrate:%f, %f, %f", accel.x, accel.y, accel.z);

     }]; 
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
