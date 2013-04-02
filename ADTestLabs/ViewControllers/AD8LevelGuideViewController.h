//
//  AD8LevelGuideViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ADTLabs_User.h" 

#import "AD8LevelTestViewController.h"


@interface AD8LevelGuideViewController : UIViewController

@property (nonatomic,strong)NSMutableArray *LevelTests;
@property (nonatomic, strong) ADTLabs_User *user;



@end
