//
//  ADTLabs_User.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-4.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADTLabs_User : NSObject

@property(nonatomic) NSUInteger userID;
@property(nonatomic, strong) NSString *userName;
@property(nonatomic) NSUInteger birthdayYear;
@property(nonatomic) NSUInteger birthdayMonth;
@property(nonatomic,strong) NSString *gender;
@property(nonatomic,strong) NSDate *dateCreated;

@end
