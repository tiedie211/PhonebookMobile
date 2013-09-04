//
//  SQLite.h
//  Phonebook Mobile
//
//  Created by Tyler Dahl on 8/29/13.
//  Copyright (c) 2013 TylerD. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
#import <FMDB/FMDatabase.h>
#import <FMDB/FMDatabaseAdditions.h>
#import <FMDB/FMDatabasePool.h>
#import <FMDB/FMDatabaseQueue.h>
#import <FMDB/FMResultSet.h>

@interface SQLite : NSObject


//Create new contact
//Get contact info
//Update contact
//Delete contact

- (void)createContact :(NSString*)firstName :(NSString*)lastName :(NSString*)cell :(NSString*)email :(NSString*)media;

- (NSArray*)getContactInfo :(NSString*)firstName :(NSString*)lastName;

- (void)updateContact :(NSString*)firstName :(NSString*)lastName :(NSString*)cell :(NSString*)email :(NSString*)media;

- (void)removeContact :(NSString*)firstName :(NSString*)lastName;


//OPTIONAL:
//  get the total number of contacts

- (NSUInteger)totalContacts;

@end
