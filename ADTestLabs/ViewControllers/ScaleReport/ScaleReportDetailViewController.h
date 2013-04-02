//
//  ScaleReportDetailViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-13.
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
#import "ADTLabs_ScaleReport.h"

@interface ScaleReportDetailViewController : UIViewController

@property (nonatomic) NSUInteger scaleReportID;
@property (nonatomic) ScaleLevelTag scaleLevleTag; //量表标识符
@property (nonatomic, strong) ADTLabs_ScaleReport *scaleReportObj; //量表详细记录
@property (nonatomic, strong) ADTLabs_User *user;

@property (nonatomic, weak) IBOutlet UILabel *UIControl_ScaleTitle;
@property (nonatomic, weak) IBOutlet UILabel *UIControl_Score;
@property (nonatomic, weak) IBOutlet UILabel *UIControl_ReportDate;
@property (nonatomic, weak) IBOutlet UILabel *UIControl_ReportDesc;

- (void)LoadScaleReportData;


@end
