//
//  ADTLabs_UserBLL.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-4.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_UserBLL.h"

@implementation ADTLabs_UserBLL

- (NSMutableArray *)getAllUser
{
    NSString *cmdSQL= @"select UserID,UserName,BirthdayYear,BirthdayMonth,Gender from TBL_User  ";
    
    const char *cmdSQL_stmt = [cmdSQL UTF8String];
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];
    
    NSMutableArray *UserArray = [[NSMutableArray alloc]init];
    
    @try {
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        if (sqlite3_prepare_v2(database, cmdSQL_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        /* reading */
        
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            int _userID = sqlite3_column_int(statement,0);
            NSString *_userName = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            int _birthdayYear = sqlite3_column_int(statement,2);
            int _birthdayMonth = sqlite3_column_int(statement,3);
            NSString *_gender = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
            
            ADTLabs_User *_User = [[ADTLabs_User alloc] init];
            _User.userID = _userID;
            _User.userName = _userName;
            _User.birthdayYear = _birthdayYear;
            _User.birthdayMonth = _birthdayMonth;
            _User.gender = _gender;
            
            
            [UserArray addObject:_User];

            
        }
        
        
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }

        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        return nil;
    }
    
    return UserArray;
    
}


- (int)AddUser:(ADTLabs_User *)newUser
{
    int result = -1;
 
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];
    
    
    //sqlite3 *database;
    
    sqlite3_stmt *statement = nil;
    sqlite3_stmt *statement2 = nil;
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO TBL_User (UserName,BirthdayYear,BirthdayMonth,Gender) VALUES(\"%@\",\"%@\",\"%@\",\"%@\")",newUser.userName, [NSString stringWithFormat:@"%d",newUser.birthdayYear],[NSString stringWithFormat:@"%d",newUser.birthdayMonth],newUser.gender];
    const char *insert_stmt = [insertSQL UTF8String];
    
    
    NSString *querySQL = [NSString stringWithFormat:@"select last_insert_rowid() newid"];
    const char *querSQL_stmt = [querySQL UTF8String];
    
 
    
    @try {
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        
        if (sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        if (sqlite3_step(statement)==SQLITE_DONE) {
   
        }
                
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        
        

        if (sqlite3_prepare_v2(database, querSQL_stmt, -1, &statement2, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        if (sqlite3_step(statement2)==SQLITE_ROW) {
            
            result = sqlite3_column_int(statement2,0);
            
            
        }
        
        
        if (sqlite3_finalize(statement2)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        
        
        
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        
    }
    
    
 
    return (result);
    
}



- (ADTLabs_User *)GetUserByUserID:(int)userID
{
    ADTLabs_User *_User = [[ADTLabs_User alloc] init];
    
    
    NSString *querySQL = [NSString stringWithFormat:@"select UserID,UserName,BirthdayYear,BirthdayMonth,Gender from TBL_User where UserID=%d",userID];
    const char *querSQL_stmt = [querySQL UTF8String];
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];
    
    //NSMutableArray *UserArray = [[NSMutableArray alloc]init];
    
    @try {
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        if (sqlite3_prepare_v2(database, querSQL_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        /* reading */
        
        if (sqlite3_step(statement) == SQLITE_ROW)
        {
            int _userID = sqlite3_column_int(statement,0);
            NSString *_userName = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
            int _birthdayYear = sqlite3_column_int(statement,2);
            int _birthdayMonth = sqlite3_column_int(statement,3);
            NSString *_gender = [[NSString alloc]initWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
            

            _User.userID = _userID;
            _User.userName = _userName;
            _User.birthdayYear = _birthdayYear;
            _User.birthdayMonth = _birthdayMonth;
            _User.gender = _gender;
 
        }
        else
        {
            _User = nil;
        }
        
        
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        return nil;
    }
    
    return (_User);
}


@end
