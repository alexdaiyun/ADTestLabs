//
//  UserAddViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-10.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
//#import "FMDatabase.h"
//#import "FMDatabaseAdditions.h"

#import "Constants.h"
#import "ADTLabs_DBHelper.h"
#import "ADTLabs_User.h"
#import "ADTLabs_UserBLL.h"
#import "UserBirthDayDatePickerViewController.h"

#define User_Table_Name @"TBL_User"

@class UserAddViewController;

//Start:Delegate
@protocol UserAddViewControllerDelegate <NSObject>

- (void)userAddViewControllerDidCancel:(UserAddViewController *)viewController;
- (void)userAddViewController:(UserAddViewController *)viewController didAddUser:(ADTLabs_User *)User;

@end
//End:Delegate

@interface UserAddViewController : UIViewController<UIPopoverControllerDelegate, UITextFieldDelegate, UserBirthDayDatePickerViewControllerDelegate>

@property (nonatomic,weak) id<UserAddViewControllerDelegate> delegate;

@property (nonatomic,strong) UserBirthDayDatePickerViewController *DatePickerVC;
@property (nonatomic,strong) UIPopoverController *DatePickerPopoverController;

@property (nonatomic,weak) IBOutlet UITextField *UIControl_UserName;
@property (nonatomic,weak) IBOutlet UISegmentedControl *UIControl_gender;
@property (nonatomic,weak) IBOutlet UITextField *UIControl_BirthDay;

@property(nonatomic) NSUInteger birthdayYear;
@property(nonatomic) NSUInteger birthdayMonth;

- (void)AddUser;



@end
