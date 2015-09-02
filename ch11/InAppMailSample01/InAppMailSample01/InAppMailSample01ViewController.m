//
//  InAppMailSample01ViewController.m
//  InAppMailSample01
//
//  Created by Mac on 2011/3/15.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "InAppMailSample01ViewController.h"

@implementation InAppMailSample01ViewController
@synthesize receiver,subject,mailbody;
- (void)dealloc
{
    [super dealloc];
    [receiver release];
    [subject release];
    [mailbody release];
}
-(NSString *)composeMail{
    NSString *to = receiver.text;
    NSString *mailsubject = subject.text;
    NSString *body = mailbody.text;
    NSString *maildata = [NSString stringWithFormat:@"mailto:%@?subject=%@&body=%@", to, mailsubject,body];
    return maildata;
}

-(IBAction)sendMail:(id)sender{
    NSString *maildata = [self composeMail];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:maildata]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)TextField
{
    [receiver resignFirstResponder];
    [subject resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
{
    if ( [ text isEqualToString: @"\n" ] ) {
        [mailbody resignFirstResponder];
        return NO;
    }else{
        return YES;   
    }
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
