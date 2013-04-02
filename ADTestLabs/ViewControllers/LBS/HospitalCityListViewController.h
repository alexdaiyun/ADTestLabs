//
//  HospitalCityListViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-13.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Constants.h"

#import "ADTLabs_HospitalBLL.h"
#import "HospitalListViewController.h"

#import "HospitalLocationMapViewController.h"

@interface HospitalCityListViewController : UITableViewController<HospitalLocationMapViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *cityList;

@property (nonatomic, strong) NSString *selectCity;

- (void)LoadCityListData;

@end
