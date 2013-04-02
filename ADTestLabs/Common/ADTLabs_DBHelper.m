//
//  ADTLabs_DBHelper.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-4.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_DBHelper.h"

@implementation ADTLabs_DBHelper


+ (NSString*) getDBPath
{
    //在pack中的路径
    //NSString *dbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:AppDBName];

    //在文件系统Documents目录中

    /* Documents */
    NSString *homePath = NSHomeDirectory();
    NSString *documentsDirectory = [homePath stringByAppendingFormat:@"/Documents"];
    
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    
    /*数据库文件及路径*/
    NSString *dbPath = [documentsDirectory stringByAppendingPathComponent:AppDBName];
    
    return dbPath;
    
}

+ (NSString *)getDBPath_ADHospital
{
    //在pack中的路径
    //NSString *dbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:AppDBName];
    
 
    
    /*数据库文件及路径*/
    NSString *dbPath =  [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:AppDBName_ADHospital];
    return dbPath;
}

@end
