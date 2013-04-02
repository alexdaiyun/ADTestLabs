//
//  HospitalLocationMapViewController.h
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

#import "ADTLabs_HospitalBLL.h"

@class HospitalLocationMapViewController;

//Start:Delegate
@protocol HospitalLocationMapViewControllerDelegate <NSObject>

-(void)hospitalLocationMapViewControllerDidCancel:(HospitalLocationMapViewController *)viewController;

@end

@interface HospitalLocationMapViewController : UIViewController
<MKMapViewDelegate, CLLocationManagerDelegate>
@property (nonatomic) id <HospitalLocationMapViewControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@property (nonatomic) CLLocationManager *locationManager;

@property (nonatomic, strong) NSMutableArray *hospitalList;

@property (nonatomic, strong) NSMutableArray *hospitalPins;

@property (nonatomic) CLLocationCoordinate2D myCoordinate;

@end
