//
//  ADTLabs_AppDelegate.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_AppDelegate.h"
#import "ADTLabs_DBHelper.h"

@implementation ADTLabs_AppDelegate

@synthesize user;



#pragma mark - Startup

- (void)Startup
{
    //开始
    [self CheckAndCreateDatabase];
}


/* 检查并创建数据库文件 */
- (void)CheckAndCreateDatabase
{
    //Create a FileManager object, we will use this to check the status
    // of the database and to copy it over if required
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // Check if the SQL database has already been saved to the users phone, if not then copy it over
    BOOL success;
    
    NSError *error;
    
    
    /*数据库文件及路径*/
    NSString *dbFilePath =  [ADTLabs_DBHelper getDBPath];
    
    //NSLog(dbFilePath);
    
    success = [fileManager fileExistsAtPath:dbFilePath];
    
    if (success) return;
    
    //文件不存在，则从pack中复制数据库文件到Documents中
    
    /* 原始数据库文件及路径 */
    NSString *source_dbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:AppDBName];
    
    //NSLog(source_dbPath);
     
    //从pack中复制数据库文件到Documents中
    BOOL  success_file = [fileManager copyItemAtPath:source_dbPath toPath:dbFilePath error:&error];
    
    if (!success_file)
    {
        NSLog(@"Copy file to Documnets error ");
    }
    
    /*
    if ([fileManager fileExistsAtPath:dbFilePath] == NO)
    {
        NSLog(@"not Exists");
    }
    else
    {
        NSLog(@"yes Exists");
    }
    
    */

    
}



#pragma mark - View lifecyle
- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    NSLog(@"applicationDidFinishLaunching");
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"applicationdidFinishLaunchingWithOptions");
    
    [self Startup];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}

@end
