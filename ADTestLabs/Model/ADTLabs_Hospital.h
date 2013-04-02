//
//  ADTLabs_Hospital.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-13.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADTLabs_Hospital : NSObject


@property (nonatomic) NSUInteger hospitalID;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *hospitalName;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *hospitalLevel;
@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *professor;
@property (nonatomic, strong) NSString *profLevel;
@property (nonatomic, strong) NSString *contacter;
@property (nonatomic, strong) NSString *hospitalType;
@property (nonatomic) double longitude; //经度
@property (nonatomic) double latitude; //纬度

@end
