//
//  InAppSMSSampleViewController.m
//  InAppSMSSample
//
//  Created by Mac on 2011/3/22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "InAppSMSSampleViewController.h"

@implementation InAppSMSSampleViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(IBAction)sendSMS:(id)sender{
    
    Class smsClass = (NSClassFromString(@"MFMessageComposeViewController"));
    if([smsClass canSendText]){
        [self showSMS];
    }else{
        NSLog(@"Can't send sms");
    }
    
}

-(void)showSMS{
    MFMessageComposeViewController *smsPicker = [[MFMessageComposeViewController alloc] init];
	smsPicker.messageComposeDelegate = self;
	[self presentModalViewController:smsPicker animated:YES];
	[smsPicker release];
}


- (void)messageComposeViewController:(MFMessageComposeViewController *)controller 
                 didFinishWithResult:(MessageComposeResult)result {
	
	NSString * message;
	switch (result)
	{
		case MessageComposeResultCancelled:
			message = @"取消發送簡訊";
			break;
		case MessageComposeResultSent:
			message = @"發送簡訊.....";
			break;
		case MessageComposeResultFailed:
			message = @"簡訊發送失敗";
			break;
		default:
			message = @"簡訊尚未發送";
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
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
