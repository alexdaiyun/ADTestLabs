//
//  MMSELevelFinishViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-2.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ADTLabs_AppDelegate.h"

#import <sqlite3.h>
#import "ADTLabs_ScaleReportBLL.h"

#import "HospitalLocationMapViewController.h"

@interface MMSELevelFinishViewController : UIViewController
<HospitalLocationMapViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *LevelTests;



@end
