//
//  CoreMotionSample01ViewController.h
//  CoreMotionSample01
//
//  Created by mac on 2011/2/2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CoreMotionSample01ViewController : UIViewController {
@private
    CMMotionManager *motionManager;
    IBOutlet UILabel *accelerationx;
    IBOutlet UILabel *accelerationy;
    IBOutlet UILabel *accelerationz;
    
}
@property (nonatomic,retain) IBOutlet UILabel *accelerationx;
@property (nonatomic,retain) IBOutlet UILabel *accelerationy;
@property (nonatomic,retain) IBOutlet UILabel *accelerationz;

-(void)startGetAcceleration;
-(void)stopGetAcceleration;
-(void)getAcceleration;
-(void)showAcceleration;
-(void)autoGetAcceleration;
@end
