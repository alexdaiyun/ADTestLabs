//
//  ADTLabs_AppDelegate.h
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

#import "ADTLabs_User.h"

@interface ADTLabs_AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ADTLabs_User *user;

- (void)Startup;
- (void)CheckAndCreateDatabase;


@end
