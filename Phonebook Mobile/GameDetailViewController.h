//
//  GameDetailViewController.h
//  Phonebook Mobile
//
//  Created by Tyler Dahl on 8/12/13.
//  Copyright (c) 2013 TylerD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
