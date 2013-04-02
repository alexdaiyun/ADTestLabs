//
//  ScaleReportScaleHistoryListViewController.h
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
#import "ADTLabs_ScaleReportHistory.h"
#import "ADTLabs_ScaleReportBLL.h"

#import "ScaleReportDetailViewController.h"

@interface ScaleReportScaleHistoryListViewController : UITableViewController

@property (nonatomic) ScaleLevelTag scaleLevleTag; //量表标识符
@property (nonatomic, strong) NSMutableArray *scaleHistoryList; //量表历史记录
@property (nonatomic, strong) ADTLabs_User *user;

- (void)LoadScaleHistoryData;

@end
