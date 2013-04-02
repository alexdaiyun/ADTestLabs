//
//  ADTLabs_ScaleReportBLL.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-12.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Constants.h"
#import "ADTLabs_DBHelper.h"
#import "ADTLabs_ScaleReportHistory.h"
#import "ADTLabs_ScaleReport.h"
#import "ADTLabs_User.h"


@interface ADTLabs_ScaleReportBLL : NSObject
{
    sqlite3 *database;
}

- (NSMutableArray *) getAllScaleReportHistoryByUserID:(NSUInteger )userID withScaleLevelTag:(ScaleLevelTag)scaleLevelTag;


- (ADTLabs_ScaleReport *) getScaleReportByUserID:(NSUInteger)userID withScaleReportID:(NSUInteger)scaleReportID withScaleLevelTag:(ScaleLevelTag)scaleLevelTag;


- (void)AddScaleReport:(NSUInteger)userID withAnswer:(NSMutableArray *)answers withScore:(NSUInteger)score withScaleReportDesc:(NSString *)desc withScaleLevelTag:(ScaleLevelTag)scaleLevelTag;


@end
