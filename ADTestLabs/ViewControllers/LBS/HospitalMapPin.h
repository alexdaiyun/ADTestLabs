//
//  HospitalMapPin.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface HospitalMapPin : NSObject<MKAnnotation>

@property(nonatomic) float latitude;
@property(nonatomic) float longitude;

@property(nonatomic, strong) NSString *hospitalName;
@property(nonatomic, strong) NSString *hospitalAddress;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end
