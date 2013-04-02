//
//  HospitalMapPin.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HospitalMapPin.h"

@implementation HospitalMapPin

@synthesize latitude,longitude;
@synthesize hospitalName,hospitalAddress;

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D coord = {
        self.latitude,self.longitude
        
    };
    return coord;
}

- (NSString *)title
{
    
    return hospitalName;
}

- (NSString *)subtitle
{
    return hospitalAddress;
}

@end
