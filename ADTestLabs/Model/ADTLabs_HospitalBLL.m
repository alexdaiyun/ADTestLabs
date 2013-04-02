//
//  ADTLabs_HospitalBLL.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-13.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_HospitalBLL.h"

@implementation ADTLabs_HospitalBLL

- (NSMutableArray *)getAllCity
{
    NSString *cmdSQL;
    
    cmdSQL = @"select  City  from Hospitals group by City  order by City Asc ";
    const char *cmdSQL_stmt = [ cmdSQL UTF8String];
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath_ADHospital];
    
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
            
            
            
            char* row_iDate = (char*)sqlite3_column_text(statement, 0);
            
            NSString *city   = [  NSString stringWithCString:row_iDate encoding:NSUTF8StringEncoding];
            
            
            
            [DataArray addObject:city];
            
            
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

- (NSMutableArray *)getAllHospital
{
    return [self getAllHospitalByCity:@""];
}

- (NSMutableArray *)getAllHospitalByCity:(NSString *)city
{
    
    
    NSString *cmdSQL;
    
    NSString *Filter;
    
    city = [city stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ((city != nil) && (city != @""))
    {
        Filter = [NSString stringWithFormat:@"and city = \"%@\" ", city];
        
    }
    else
    {
        Filter = @"";
    }
    
    
    cmdSQL = [NSString stringWithFormat:@"select id,region, City, hospitalName,Address,HospLevel, Subject, Professor, ProfLevel, Contacter, HospType,Longitude, Latitude  from vwHospitals  where 1=1 %@ order by id Asc", Filter ];
    
    const char *cmdSQL_stmt = [ cmdSQL UTF8String];
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath_ADHospital];
    
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
            ADTLabs_Hospital *_hospital = [[ADTLabs_Hospital alloc] init];
            
            
            // char* row_Date; = (char*)sqlite3_column_text(statement, 1);
            
            //_hospital.city  = [  NSString stringWithCString:row_iDate encoding:NSUTF8StringEncoding];
            
            char *row_iData;
            
            _hospital.hospitalID = sqlite3_column_int(statement,0);
            
            row_iData = (char *)sqlite3_column_text(statement, 1);
            if (row_iData)
            {
                _hospital.region =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            row_iData = (char *)sqlite3_column_text(statement, 2);
            if (row_iData)
            {
                _hospital.city =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            row_iData = (char *)sqlite3_column_text(statement, 3);
            if (row_iData)
            {
                _hospital.hospitalName =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            row_iData = (char *)sqlite3_column_text(statement, 4);
            if (row_iData)
            {
                _hospital.address =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            
            row_iData = (char *)sqlite3_column_text(statement, 5);
            if (row_iData)
            {
                _hospital.hospitalLevel =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            
            row_iData = (char *)sqlite3_column_text(statement, 6);
            if (row_iData)
            {
                _hospital.subject =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            
            row_iData = (char *)sqlite3_column_text(statement, 7);
            if (row_iData)
            {
                _hospital.professor =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            
            row_iData = (char *)sqlite3_column_text(statement, 8);
            if (row_iData)
            {
                _hospital.profLevel =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            row_iData = (char *)sqlite3_column_text(statement, 9);
            if (row_iData)
            {
                _hospital.contacter =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            row_iData = (char *)sqlite3_column_text(statement, 10);
            if (row_iData)
            {
                _hospital.hospitalType
                =  [  NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding];
            }
            
            row_iData = (char *)sqlite3_column_text(statement, 11);
            if (row_iData)
            {
                _hospital.longitude = [[NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding] doubleValue];
            }

            row_iData = (char *)sqlite3_column_text(statement, 12);
            if (row_iData)
            {
                _hospital.latitude = [[NSString stringWithCString:row_iData encoding:NSUTF8StringEncoding] doubleValue];
            }
            
            
            
            [DataArray addObject:_hospital];
            
            
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

@end
