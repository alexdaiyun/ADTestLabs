//
//  ADTLabs_HospitalBLL.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-13.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

#import "Constants.h"
#import "ADTLabs_DBHelper.h"
#import "ADTLabs_Hospital.h"


@interface ADTLabs_HospitalBLL : NSObject
{
    sqlite3 *database;
    
}

- (NSMutableArray *)getAllCity;

- (NSMutableArray *)getAllHospitalByCity:(NSString *)city;

- (NSMutableArray *)getAllHospital;

@end
