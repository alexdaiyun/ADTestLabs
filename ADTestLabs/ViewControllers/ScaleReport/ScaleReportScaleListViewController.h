//
//  ScaleReportScaleListViewController.h
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

#import "ScaleReportScaleHistoryListViewController.h"

@interface ScaleReportScaleListViewController : UITableViewController

@property (nonatomic,strong) ADTLabs_User *user;



@end
