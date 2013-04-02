//
//  ADTLabs_LevelTestRootViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CardButton.h"
#import "ADTLabs_User.h"
#import "UserListViewController.h"
#import "UserAddViewController.h"

#import "AD8LevelGuideViewController.h"
 


@class ADTLabs_LevelTestRootViewController;

// START:Delegate
@protocol ADTLabs_LevelTestRootViewControllerDelegate <NSObject>

@end
// End:Delegate

@interface ADTLabs_LevelTestRootViewController : UIViewController<UserListViewControllerDelegate,UserAddViewControllerDelegate>

@property (nonatomic, weak) id <ADTLabs_LevelTestRootViewControllerDelegate> delegate;

@end

