//
//  GameNewContactViewController.m
//  Phonebook Mobile
//
//  Created by Tyler Dahl on 8/29/13.
//  Copyright (c) 2013 TylerD. All rights reserved.
//

#import "GameNewContactViewController.h"

@interface GameNewContactViewController ()

@end

@implementation GameNewContactViewController

- (IBAction)hideKeyboard:(id)sender
{
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    [cellField resignFirstResponder];
    [emailField resignFirstResponder];
    [mediaField resignFirstResponder];
}

- (IBAction)dismissModalView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)createContact:(id)sender
{
    [SQLite createContact:firstName.text :lastName.text :cellField.text :emailField.text :mediaField.text];

    [self dismissViewControllerAnimated:NO completion:nil];
    
    //Insert SQLite Code here to create contact
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
