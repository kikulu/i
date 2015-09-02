//
//  ContactSample01ViewController.h
//  ContactSample01
//
//  Created by Mac on 2011/3/30.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>

@interface ContactSample01ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,ABNewPersonViewControllerDelegate>{
    
}

-(IBAction)getcontacts:(id)sender;
-(IBAction)addcontact:(id)sender;

@end
