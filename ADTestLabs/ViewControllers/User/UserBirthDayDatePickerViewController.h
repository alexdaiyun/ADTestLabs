//
//  UserBirthDayDatePickerViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-11.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserBirthDayDatePickerViewController;

//Start:Delegate
@protocol UserBirthDayDatePickerViewControllerDelegate <NSObject>

- (void)userBirthDayDatePickerViewController:(UserBirthDayDatePickerViewController *)viewController didSelectValue:(NSDate *)value;
@end
//End:Delegate

@interface UserBirthDayDatePickerViewController : UIViewController

@property (nonatomic, weak) id <UserBirthDayDatePickerViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, strong) NSDate *transDate;

@end
