//
//  ADTLabs_ScaleReportHistory.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-12.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADTLabs_ScaleReportHistory : NSObject


@property(nonatomic) NSUInteger userID;
@property(nonatomic) NSUInteger scaleReportID;
@property(nonatomic, strong) NSString *historyDate;
@property(nonatomic,strong) NSDate *reportDate;



@end
