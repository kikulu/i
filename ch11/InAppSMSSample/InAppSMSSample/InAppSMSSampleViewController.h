//
//  InAppSMSSampleViewController.h
//  InAppSMSSample
//
//  Created by Mac on 2011/3/22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface InAppSMSSampleViewController : UIViewController <MFMessageComposeViewControllerDelegate>{
    
}

-(IBAction)sendSMS:(id)sender;
-(void)showSMS;
@end
