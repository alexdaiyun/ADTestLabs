//
//  ADTLabs_ScaleReportBLL.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-12.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_ScaleReportBLL.h"


@implementation ADTLabs_ScaleReportBLL


#pragma mark - ScaleReportHistory


- (NSMutableArray *) getAllScaleReportHistoryByUserID:(NSUInteger )userID withScaleLevelTag:(ScaleLevelTag)scaleLevelTag;
{
    
    NSString *cmdSQL;
    
    NSString *_tableName = @"";
    
    switch (scaleLevelTag) {
        case ScaleLevelAD8:
            _tableName = @"TBL_ScaleReport_AD8";
            break;
        case ScaleLevelADL:
            _tableName = @"TBL_ScaleReport_ADL";
            break;
        case ScaleLevelOLD:
            _tableName = @"TBL_ScaleReport_OLD";
            break;
        case ScaleLevelMMSE:
            _tableName = @"TBL_ScaleReport_MMSE";
            break;
        case ScaleLevelHAMND:
            _tableName = @"TBL_ScaleReport_HAMND";
            break;
        case ScaleLevelMOCA:
            _tableName = @"TBL_ScaleReport_MOCA";
            break;
        case ScaleLevelHIS:
            _tableName = @"TBL_ScaleReport_HIS";
            break;
           
            
        default:
            break;
    }
    
    cmdSQL= [NSString stringWithFormat: @"select TID,UID,DateTime(TestDateTime) from %@   where UID=%u order by datetime(TestDateTime) desc ", _tableName, userID];
 
 
    const char *cmdSQL_stmt = [cmdSQL UTF8String];
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];
    
    NSMutableArray *DataArray = [[NSMutableArray alloc]init];
    
    @try {
        
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        if (sqlite3_prepare_v2(database, cmdSQL_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        /* reading */
        
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            
            
            ADTLabs_ScaleReportHistory *_ScaleReportHistory = [[ADTLabs_ScaleReportHistory alloc] init];
            
            
            _ScaleReportHistory.scaleReportID = sqlite3_column_int(statement,0);
            
            _ScaleReportHistory.userID = sqlite3_column_int(statement, 1);
            
            char* row_iDate = (char*)sqlite3_column_text(statement, 2);
            if (row_iDate)
            {
                _ScaleReportHistory.historyDate =[  NSString stringWithCString:row_iDate encoding:NSUTF8StringEncoding];
            }
            
            //_ScaleReportHistory.reportDate = [NSDate dateWithTimeIntervalSince1970:(sqlite3_column_double(statement, 2))];
            //NSTimeInterval _t = sqlite3_column_double(statement, 2);
            
            //NSDate *_reportDate = [NSDate dateWithTimeIntervalSince1970:_t];
            NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
            
            [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            
            _ScaleReportHistory.reportDate= [inputFormatter dateFromString: _ScaleReportHistory.historyDate];
            
            
            
            [DataArray addObject:_ScaleReportHistory];
            
            
        }
        
        
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        return nil;
    }
    
    return DataArray;
    
}

- (ADTLabs_ScaleReport *) getScaleReportByUserID:(NSUInteger)userID  withScaleReportID:(NSUInteger)scaleReportID withScaleLevelTag:(ScaleLevelTag)scaleLevelTag
{

    ADTLabs_ScaleReport * _scaleReport = [[ADTLabs_ScaleReport alloc] init];
    
    
    NSString *cmdSQL;
    
    NSString *_staticField = @"TID,UID,DateTime(TestDateTime),Score,ReportDesc";
    
    //NSString *_staticItemFields;
    
    
    switch (scaleLevelTag) {
        case ScaleLevelAD8:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_AD8  where TID=%u",_staticField,[self ItemFieldWithAppendByCount:8],scaleReportID];
            
            break;
        case ScaleLevelOLD:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_OLD  where TID=%u",_staticField,[self ItemFieldWithAppendByCount:12],scaleReportID];
            
            break;
        
        case ScaleLevelMMSE:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_MMSE where TID=%u",_staticField,[self ItemFieldWithAppendByCount:12],scaleReportID];
            
            break;
            
        case ScaleLevelMOCA:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_MOCA  where TID=%u",_staticField,[self ItemFieldWithAppendByCount:17],scaleReportID];
            
            break;
        case ScaleLevelADL:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_ADL  where TID=%u",_staticField,[self ItemFieldWithAppendByCount:20],scaleReportID];
            
            break;
        case ScaleLevelHAMND:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_HAMND  where TID=%u",_staticField,[self ItemFieldWithAppendByCount:17],scaleReportID];
            
            break;
        case ScaleLevelHIS:
            
            
            cmdSQL= [NSString stringWithFormat: @"select %@, %@ from TBL_ScaleReport_HIS  where TID=%u",_staticField,[self ItemFieldWithAppendByCount:13],scaleReportID];
            
            break;
            
            
            
            
        default:
            break;
    }
    
    NSLog(@"%@",cmdSQL);
    
    const char *cmdSQL_stmt = [cmdSQL UTF8String];
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];

    
    @try {
        
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        if (sqlite3_prepare_v2(database, cmdSQL_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        /* reading */
        
        while (sqlite3_step(statement) == SQLITE_ROW)
        {
            
            
            
            
            _scaleReport.scaleReportID = sqlite3_column_int(statement,0);
            
            _scaleReport.userID = sqlite3_column_int(statement, 1);
            
            char* row_iDate = (char*)sqlite3_column_text(statement, 2);
            
            
            
            if (row_iDate)
            {
                _scaleReport.historyDate  =[  NSString stringWithCString:row_iDate encoding:NSUTF8StringEncoding];
                
                
                NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
                
                [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
                
                _scaleReport.reportDate= [inputFormatter dateFromString: _scaleReport.historyDate];
                
                
            }
            
            _scaleReport.score =  sqlite3_column_int(statement,3 );
            
            char* row_scaleReportDesc = (char*)(char *)sqlite3_column_text(statement, 4);
            
            if (row_scaleReportDesc)
            {
                _scaleReport.scaleReportDesc = [NSString stringWithCString:row_scaleReportDesc encoding:NSUTF8StringEncoding];
            }
            
            
        }
        
        
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        return nil;
    }
    
    
    
    return (_scaleReport);

}

- (void)AddScaleReport:(NSUInteger)userID withAnswer:(NSMutableArray *)answers withScore:(NSUInteger)score withScaleReportDesc:(NSString *)desc withScaleLevelTag:(ScaleLevelTag)scaleLevelTag;
{
    
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];
    
    
    //sqlite3 *database;
    
    sqlite3_stmt *statement = nil;
    
   // NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO TBL_User (UserName,BirthdayYear,BirthdayMonth,Gender) VALUES(\"%@\",\"%@\",\"%@\",\"%@\")",newUser.userName, [NSString stringWithFormat:@"%d",newUser.birthdayYear],[NSString stringWithFormat:@"%d",newUser.birthdayMonth],newUser.gender];
    
    //获得当前时间
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentDate =[ inputFormatter stringFromDate:[NSDate date]];
    
    
    NSString *_staticSQL_1 = [NSString stringWithFormat:@"INSERT INTO %@ ",[self getTableNameByScaleLevelTag:scaleLevelTag]];
    
    NSString *_staticFields = @"(UID,TestDateTime,Score,ReportDesc)";
    NSString *_staticValues = [NSString stringWithFormat:@" values(\"%u\",\"%@\",\"%u\",\"%@\")",userID,currentDate,score,desc];
    
    //NSMutableString *_itemFields = [[NSMutableString alloc] initWithString:@""];
    
    
    
    
    NSString *cmdSQL = [NSString stringWithFormat:@"%@ %@ %@",_staticSQL_1, _staticFields,_staticValues];
    
    
    
    const char *cmdSQL_stmt = [cmdSQL UTF8String];
    
  
    
    
    @try {
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        
        if (sqlite3_prepare_v2(database, cmdSQL_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        if (sqlite3_step(statement)==SQLITE_DONE) {
            
        }
        
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        
         
        
        
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        
    }
    
    
    
    
    
    
}



- (NSString *)getTableNameByScaleLevelTag:(ScaleLevelTag)scaleLevelTag
{
    NSString *_tableName ;
    
    switch (scaleLevelTag) {
        case ScaleLevelAD8:
            _tableName = @"TBL_ScaleReport_AD8";
            break;
        case ScaleLevelADL:
            _tableName = @"TBL_ScaleReport_ADL";
            break;
        case ScaleLevelOLD:
            _tableName = @"TBL_ScaleReport_OLD";
            break;
        case ScaleLevelMMSE:
            _tableName = @"TBL_ScaleReport_MMSE";
            break;
        case ScaleLevelHAMND:
            _tableName = @"TBL_ScaleReport_HAMND";
            break;
        case ScaleLevelMOCA:
            _tableName = @"TBL_ScaleReport_MOCA";
            break;
        case ScaleLevelHIS:
            _tableName = @"TBL_ScaleReport_HIS";
            break;
            
            
        default:
            break;
    }

    return _tableName;
}


- (NSString *)ItemFieldWithAppendByCount:(NSUInteger)count
{
    
    NSMutableString *_itemField = [[NSMutableString alloc] initWithString:@""];
    
    int i;
    
    if (count >0)
    {
        
        for (i = 1; i <= count; i++) {
            
            if (i == count)
            {
                [_itemField appendFormat:@"Item%u",i];
                
            }
            else
            {
                [_itemField appendFormat:@"Item%u,",i];
            }
        }
        
    }

    return _itemField;
}


@end
