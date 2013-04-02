//
//  ADTLabs_UserBLL.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-4.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Constants.h"
#import "ADTLabs_DBHelper.h"
#import "ADTLabs_User.h"

@interface ADTLabs_UserBLL : NSObject
{
    sqlite3 *database;
}

- (NSMutableArray *)getAllUser;

- (int)AddUser:(ADTLabs_User*)newUser;

 


- (ADTLabs_User *)GetUserByUserID:(int)userID;

@end
