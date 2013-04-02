//
//  HospitalListViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sqlite3.h>

#import "Constants.h"

#import "ADTLabs_HospitalBLL.h"

#import "ADTLabs_Hospital.h"

#import "HospitalMapViewController.h"

 

@interface HospitalListViewController : UITableViewController <HospitalMapViewControllerDelegate>


@property (nonatomic, strong) NSMutableArray *hospitalList;

@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) ADTLabs_Hospital *selectHospital;

-(void)LoadHospitalListData;

@end
