//
//  MOCALevelGuideViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-2.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ADTLabs_User.h"

#import "MOCALevelTestViewController.h"


@interface MOCALevelGuideViewController : UIViewController


@property (nonatomic,strong)NSMutableArray *LevelTests;
@property (nonatomic, strong) ADTLabs_User *user;


@end
