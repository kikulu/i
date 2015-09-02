//
//  InAppMailSample01ViewController.h
//  InAppMailSample01
//
//  Created by Mac on 2011/3/15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InAppMailSample01ViewController : UIViewController <UITextViewDelegate,UITextFieldDelegate> {
    IBOutlet UITextField *receiver;
    IBOutlet UITextField *subject;
    IBOutlet UITextView *mailbody;
    
}

@property (nonatomic,retain) IBOutlet UITextField *receiver;
@property (nonatomic,retain) IBOutlet UITextField *subject;
@property (nonatomic,retain) IBOutlet UITextView *mailbody;
-(IBAction)sendMail:(id)sender;
-(NSString *)composeMail;


@end
