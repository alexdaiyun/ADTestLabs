//
//  AD8LevelFinishViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ADTLabs_AppDelegate.h"

#import <sqlite3.h>
#import "ADTLabs_ScaleReportBLL.h"

#import "HospitalLocationMapViewController.h"

@interface AD8LevelFinishViewController : UIViewController
<HospitalLocationMapViewControllerDelegate>

@property (nonatomic, retain)NSMutableArray *LevelTests;

@property (nonatomic, strong) ADTLabs_User *user;


@end
