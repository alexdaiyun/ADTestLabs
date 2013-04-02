//
//  AD8LevelTestViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ADTLabs_User.h"

@interface AD8LevelTestViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *LevelTests;
@property (nonatomic) NSUInteger QuestionIndex;

@property (nonatomic, strong) ADTLabs_User *user;

@end
