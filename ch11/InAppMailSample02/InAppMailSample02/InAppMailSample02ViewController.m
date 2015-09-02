//
//  InAppMailSample02ViewController.m
//  InAppMailSample02
//
//  Created by Mac on 2011/3/16.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "InAppMailSample02ViewController.h"

@implementation InAppMailSample02ViewController

- (void)dealloc
{
    [super dealloc];
}
-(void)showMail{
    MFMailComposeViewController *compose = [[MFMailComposeViewController alloc] init];
    compose.mailComposeDelegate = self;
    [compose setSubject:@"Test Mail!"];
    NSArray *toRecipients = [NSArray arrayWithObjects:@"test@test.com",nil];
    [compose setToRecipients:toRecipients];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TextEdit-icon"
                                                     ofType:@"png"];
    NSData *myData = [NSData dataWithContentsOfFile:path];
    [compose addAttachmentData:myData mimeType:@"image/png"fileName:@"Text-icon"];
    NSString *emailBody = @"Just Test inAppMail!";
    [compose setMessageBody:emailBody isHTML:NO];
    [self presentModalViewController:compose animated:YES];
    [compose release];
}
-(IBAction)sendMail:(id)sender{
    if([MFMailComposeViewController canSendMail]){
        NSLog(@"can send mail");
        [self showMail];
    }else{
        NSLog(@"can send no mail");
    }
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	NSString *message;
	switch (result)
	{
		case MFMailComposeResultCancelled:
			message = @"Result: Cencell Sent";
            NSLog(@"%@",message);
			break;
		case MFMailComposeResultSaved:
			message = @"Result: Mail Saved";
            NSLog(@"%@",message);
			break;
		case MFMailComposeResultSent:
			message = @"Result: Sent";
            NSLog(@"%@",message);
			break;
		case MFMailComposeResultFailed:
            message = @"Result: failed";;
			NSLog(@"%@",message);
			break;
		default:
			message = @"Result: not sent";
            NSLog(@"%@",message);
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
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
