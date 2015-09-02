//
//  PhoneSampleViewController.h
//  PhoneSample
//
//  Created by kikulu on 2011/1/7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTCall.h>
#import <CoreTelephony/CTCallCenter.h>
@interface PhoneSampleViewController : UIViewController {

    IBOutlet UITextView *phoneinfo;
}

@property (nonatomic,retain) IBOutlet UITextView *phoneinfo;
-(IBAction)getPhone:(id)sender;

@end
