//
//  UserListViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Constants.h"
#import "ADTLabs_AppDelegate.h"//;

#import "ADTLabs_DBHelper.h"//;
#import "ADTLabs_User.h"//;
#import "ADTLabs_UserBLL.h"//;

@class UserListViewController;

//Start:Delegate
@protocol UserListViewControllerDelegate <NSObject>

- (void)userListViewController:(UserListViewController *)viewController didSelectUser:(ADTLabs_User *)user;

@end
//End:Delegate


@interface UserListViewController : UITableViewController



@property (nonatomic, strong) NSMutableArray *userList;
//@property (nonatomic, strong) NSString *userName;

@property (nonatomic) NSUInteger userListCounter;


@property (nonatomic,weak) id <UserListViewControllerDelegate> delegate;

//- (id)initWithTitle:(NSString *)title withNavigationTitle:(NSString *)navTitle;

- (void)LoadUserListData;


@end
