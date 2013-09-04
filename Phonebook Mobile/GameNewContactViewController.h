//
//  GameNewContactViewController.h
//  Phonebook Mobile
//
//  Created by Tyler Dahl on 8/29/13.
//  Copyright (c) 2013 TylerD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLite.h"

@interface GameNewContactViewController : UIViewController
{
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *cellField;
    IBOutlet UITextField *emailField;
    IBOutlet UITextField *mediaField;
    IBOutlet UIBarButtonItem *cancel;
    IBOutlet UIBarButtonItem *done;
    SQLite *db;
}

- (IBAction)hideKeyboard:(id)sender;
- (IBAction)dismissModalView:(id)sender;
- (IBAction)createContact:(id)sender;
@end
