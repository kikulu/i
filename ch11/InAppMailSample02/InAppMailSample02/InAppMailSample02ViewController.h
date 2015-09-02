//
//  InAppMailSample02ViewController.h
//  InAppMailSample02
//
//  Created by Mac on 2011/3/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface InAppMailSample02ViewController : UIViewController <MFMailComposeViewControllerDelegate>{
    
}

-(void)showMail;
-(IBAction)sendMail:(id)sender;

@end
