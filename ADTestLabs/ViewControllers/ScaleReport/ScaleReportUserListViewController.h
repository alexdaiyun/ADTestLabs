//
//  ScaleReportUserListViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-12.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sqlite3.h>
#import "Constants.h"
 

#import "ADTLabs_DBHelper.h"
#import "ADTLabs_User.h"
#import "ADTLabs_UserBLL.h"

#import "ScaleReportScaleListViewController.h"

@interface ScaleReportUserListViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *userList;
//@property (nonatomic, strong) NSString *userName;

@property (nonatomic) NSUInteger userListCounter;

@property (nonatomic) NSUInteger selectRow;



- (void)LoadUserListData;



@end
