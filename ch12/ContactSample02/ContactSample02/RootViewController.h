//
//  RootViewController.h
//  ContactSample02
//
//  Created by kikulu on 2011/1/17.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface RootViewController : UITableViewController <ABNewPersonViewControllerDelegate,ABPersonViewControllerDelegate>{
@private
    ABAddressBookRef addressBook;
    NSMutableArray   *friends;
    NSMutableArray *contactid;
    NSMutableArray *uname;
    NSMutableArray *cdates;
    NSMutableArray *images;
}
-(void)addContact;
-(void)getContacts;
-(void)addTable;

@end
