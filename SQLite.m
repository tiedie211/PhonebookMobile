//
//  SQLite.m
//  Phonebook Mobile
//
//  Created by Tyler Dahl on 8/29/13.
//  Copyright (c) 2013 TylerD. All rights reserved.
//

#import "SQLite.h"

@implementation SQLite

- (void)createContact :(NSString*)firstName :(NSString*)lastName :(NSString*)cell :(NSString*)email :(NSString*)media
{
    FMDatabase *db = [FMDatabase databaseWithPath:@"/contacts.db"];
    
    if (![db open]) {
        //[db release];
        NSLog(@"ERROR: Could not open Database.");
        return;
    }
    
    NSString *name = [NSString stringWithFormat:@"%@%@", firstName, lastName];
    
    //Create a new table if this contact does not exist yet
    [db executeUpdateWithFormat:@"CREATE TABLE IF NOT EXISTS %@(cell TEXT, email TEXT, media TEXT)", name];
    [db executeUpdateWithFormat:@"INSERT INTO %@ VALUES (%@, %@, %@)", name, cell, email, media];

    
    /*
    FMResultSet *s = [db executeQueryWithFormat:@"SELECT * FROM %@", name];
    while ([s next]) {
        NSString *c = [s stringForColumnIndex:0];
        NSString *e = [s stringForColumnIndex:1];
        NSString *m = [s stringForColumnIndex:2];
        NSLog(@"\nCell: %@\nEmail: %@\nMedia: %@", c, e, m);
    }
    */
    
    
    [db close];
}

- (NSArray*)getContactInfo :(NSString*)firstName :(NSString*)lastName
{
    FMDatabase *db = [FMDatabase databaseWithPath:@"/contacts.db"];
    
    if (![db open]) {
        //[db release];
        NSLog(@"ERROR: Could not open Database.");
        return nil;
    }
    
    
    NSString *name = [NSString stringWithFormat:@"%@%@", firstName, lastName];
    NSArray *contact;
    
    //If the table exists for the contact, then get the contents of it and insert into an array
    if ([db tableExists:name]){
        FMResultSet *s = [db executeQueryWithFormat:@"SELECT * FROM %@", name];
        while ([s next]) {
            NSString *c = [s stringForColumnIndex:0];
            NSString *e = [s stringForColumnIndex:1];
            NSString *m = [s stringForColumnIndex:2];
            NSLog(@"\nCell: %@\nEmail: %@\nMedia: %@", c, e, m);
            contact = [NSArray arrayWithObjects:c, e, m, nil];
        }
    }
    
    
    [db close];
    return contact;
}

- (void)updateContact :(NSString*)firstName :(NSString*)lastName :(NSString*)cell :(NSString*)email :(NSString*)media
{
    FMDatabase *db = [FMDatabase databaseWithPath:@"/contacts.db"];
    
    if (![db open]) {
        //[db release];
        NSLog(@"ERROR: Could not open Database.");
        return;
    }
    
    NSString *name = [NSString stringWithFormat:@"%@%@", firstName, lastName];
    
    //Update table with new info
    if ([db tableExists:name]){
        [db executeUpdateWithFormat:@"UPDATE %@ SET cell = %@, email = %@, media = %@", name, cell, email, media];
    }
    
    [db close];
}

- (void)removeContact :(NSString*)firstName :(NSString*)lastName
{
    FMDatabase *db = [FMDatabase databaseWithPath:@"/contacts.db"];
    
    if (![db open]) {
        //[db release];
        NSLog(@"ERROR: Could not open Database.");
        return;
    }
    
    NSString *name = [NSString stringWithFormat:@"%@%@", firstName, lastName];
    
    //Remove a contact from the database if it exists
    [db executeUpdateWithFormat:@"DROP TABLE IF EXISTS %@", name];
    
    
    [db close];
}



- (NSUInteger)totalContacts
{
    return 0;
}

@end
