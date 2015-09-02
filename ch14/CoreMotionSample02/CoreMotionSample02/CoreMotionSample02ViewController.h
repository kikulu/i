//
//  CoreMotionSample02ViewController.h
//  CoreMotionSample02
//
//  Created by mac on 2011/1/30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
@interface CoreMotionSample02ViewController : UIViewController {
@private
    CMMotionManager *motionManager;
    IBOutlet UILabel *gyroX;
    IBOutlet UILabel *gyroY;
    IBOutlet UILabel *gyroZ;
}

@property (nonatomic,retain) IBOutlet UILabel *gyroX;
@property (nonatomic,retain) IBOutlet UILabel *gyroY;
@property (nonatomic,retain) IBOutlet UILabel *gyroZ;

-(void)startGetGyro;
-(void)stopGetGyro;
-(void)getGyroData;
-(void)showGyroData;
-(void)autoGetGyroData;
@end
