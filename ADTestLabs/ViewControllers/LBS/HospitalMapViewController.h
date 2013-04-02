//
//  HospitalMapViewController.h
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "Constants.h"
#import "ADTLabs_Hospital.h"
#import "HospitalMapPin.h"

@class HospitalMapViewController;

//Start:Delegate
@protocol HospitalMapViewControllerDelegate <NSObject>

-(void)hospitalMapViewControllerDidCancel:(HospitalMapViewController *)viewController;

@end

@interface HospitalMapViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic) id <HospitalMapViewControllerDelegate> delegate;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *UIControl_hospitalTitle;


@property (nonatomic, strong) ADTLabs_Hospital *hospitalObject;

@property (nonatomic) HospitalMapPin *hospitalMapPin;

- (void) DisplayHospital;

@end
