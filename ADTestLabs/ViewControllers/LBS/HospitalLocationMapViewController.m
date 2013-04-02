//
//  HospitalLocationMapViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HospitalLocationMapViewController.h"

 
@interface HospitalLocationMapViewController ()

@end

@implementation HospitalLocationMapViewController

@synthesize mapView;
@synthesize locationManager;
@synthesize delegate;
@synthesize hospitalList;
@synthesize hospitalPins;
@synthesize myCoordinate;

#pragma mark - Actions

 

- (void)DoHospitalLocationMap
{

    hospitalPins = [[NSMutableArray alloc] init];
    
    [self GetAllHospitalData];
    
    [self CheckLocationServices];
    
    [self GoToLocation];
    
    
    
}


- (void)GetAllHospitalData
{
    ADTLabs_HospitalBLL *hospitalBLL = [[ADTLabs_HospitalBLL alloc]init];
    
    [hospitalList removeAllObjects];
    
    hospitalList = [hospitalBLL getAllHospital];
    
    NSLog(@"%u", hospitalList.count);
    
}

- (IBAction)FindMe:(id)sender
{
    mapView.showsUserLocation = YES;
    
}

- (void)FindHospitalNearby:(CLLocation *)userLocation
{
    mapView.showsUserLocation = NO;
    
    float FilterRange = 30; //半径范围 公里
    
    CLLocationCoordinate2D coords_User = userLocation.coordinate;
    

    
    
    CLLocation *cllocation_UserLocation;
    
    CLLocation *cllocation_HospitalLocation;
    
    //cllocation_Hospital=[[CLLocation alloc] initWithLatitude:loaf longitude:logf];
    
    [hospitalPins removeAllObjects];
    
 
    
    
    cllocation_UserLocation = [[CLLocation alloc] initWithLatitude:coords_User.latitude longitude:coords_User.longitude];
    
    //NSLog(@"user %f %f", cllocation_UserLocation.coordinate.latitude, cllocation_UserLocation.coordinate.longitude);
    
    for (ADTLabs_Hospital *hospitalObject in hospitalList) {
        
        cllocation_HospitalLocation = [[CLLocation alloc] initWithLatitude:hospitalObject.latitude longitude:hospitalObject.longitude];
        
        
        CLLocationDistance distance = [cllocation_UserLocation distanceFromLocation:cllocation_HospitalLocation];
        
        //NSLog(@"%u %@  ",hospitalObject.hospitalID, hospitalObject.hospitalName);
        
        //NSLog(@" %f %f", cllocation_HospitalLocation.coordinate.latitude, cllocation_HospitalLocation.coordinate.longitude);
        //NSLog(@"%f",distance/1000); //米->公里
        
        if ((distance/1000)<=FilterRange)
        {
            
            HospitalMapPin *hospitalMapPin = [[HospitalMapPin alloc] init];
            
            hospitalMapPin.latitude = cllocation_HospitalLocation.coordinate.latitude;
            hospitalMapPin.longitude = cllocation_HospitalLocation.coordinate.longitude;
            hospitalMapPin.hospitalName = hospitalObject.hospitalName;
            hospitalMapPin.hospitalAddress = hospitalObject.address;
            
            
            
            [hospitalPins addObject:hospitalMapPin];
            
            NSLog(@"%u %@  ",hospitalObject.hospitalID, hospitalObject.hospitalName);
            
            NSLog(@" %f %f", cllocation_HospitalLocation.coordinate.latitude, cllocation_HospitalLocation.coordinate.longitude);
            NSLog(@"%f",distance/1000); //米->公里
            
            
        }
    }
    NSLog(@"%u", hospitalPins.count);
    
    [mapView removeAnnotations:mapView.annotations];
    
    [mapView addAnnotations:hospitalPins];
    
    //[self.mapView setRegion:userRegion animated:YES];
       
  
    /*
     
     MKCoordinateRegion mapRegion;
     
    mapRegion.center.latitude = coords_User.latitude;
    mapRegion.center.longitude = coords_User.longitude;
    mapRegion.span.latitudeDelta = 0.1;//0.112872;
    mapRegion.span.longitudeDelta = 0.1;//0.109863;
    */
    /*    
    if (hospitalPins.count >0)
    {
        

    
        HospitalMapPin *firstPin = [hospitalPins objectAtIndex:0];
        CLLocationDegrees latitudeMax = firstPin.latitude;
        CLLocationDegrees latitudeMin = firstPin.latitude;
        CLLocationDegrees longitudeMax = firstPin.longitude;
        CLLocationDegrees longitudeMin = firstPin.longitude;
       
        for (HospitalMapPin *Pin in hospitalPins)
        {
            if (Pin.latitude >latitudeMax)
            {
                latitudeMax = Pin.latitude;
            }
            
            if (Pin.latitude < latitudeMin)
            {
                latitudeMin = Pin.latitude;
            }
            
            if (Pin.longitude > longitudeMax)
            {
                longitudeMax = Pin.longitude;
            }
            
            if (Pin.longitude < longitudeMin)
            {
                longitudeMin = Pin.longitude;
            }
            
            [mapView selectAnnotation:firstPin animated:NO];

        }
       
        mapRegion.span.latitudeDelta = (latitudeMax - latitudeMin) * 1.2;
        
        if (mapRegion.span.latitudeDelta == 0)
        {
           mapRegion.span.latitudeDelta = 0.1;
        }
        
        mapRegion.span.longitudeDelta = (longitudeMax - longitudeMin) * 1.2;
 
        if (mapRegion.span.longitudeDelta == 0)
        {
            mapRegion.span.longitudeDelta = 0.1;
        }
        
        mapRegion.span.longitudeDelta = 30;
        mapRegion.span.latitudeDelta = 30;
        
       // mapRegion.center.latitude = ((latitudeMax - latitudeMin) /2 ) + latitudeMin;// firstPin.latitude;
       // mapRegion.center.longitude = ((longitudeMax - longitudeMin) /2) + longitudeMin; //firstPin.longitude;

               
    }
        */ 
 
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
 
    for(HospitalMapPin * annotation in mapView.annotations)
    {
        [mapView selectAnnotation:annotation animated:YES];

        
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
    
    region = [mapView regionThatFits:region];
    
    [mapView setRegion:region animated:YES];
    
    //[self.mapView setRegion:mapRegion animated:YES];
    
 
    
}




- (void)GoToLocation
{
    //mapView.showsUserLocation = YES;
    // mapView.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    
    mapView.mapType = MKMapTypeStandard;
    

    
    if (!locationManager)
        locationManager = [[CLLocationManager alloc]init];
    
    [locationManager setDelegate:self];
    
    //[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
    
    //设备移动2米，则通知更新
    [locationManager setDistanceFilter:2.0f];
    
    [locationManager setPurpose:@"访问控制"];
    
    [locationManager startUpdatingLocation];
    
 
    
    
    
}

- (void)CheckLocationServices
{
    NSString *msgText = @"";
    BOOL b_ShowMsg = YES;
    
    if ( [CLLocationManager locationServicesEnabled])
    {
        NSLog(@"Location Services is Enabled");
        
        switch ( [CLLocationManager authorizationStatus])
        { case kCLAuthorizationStatusAuthorized:
                msgText = @"";
                b_ShowMsg = NO;
                break;
            case kCLAuthorizationStatusDenied:
                msgText = @"请在系统设置中允许本程序访问定位服务";
                break;
            case kCLAuthorizationStatusNotDetermined:
                msgText = @"定位服务受限";
                break;
            case kCLAuthorizationStatusRestricted:
                msgText = @"定位功能未开启，请开启定位服务";
                break;
        }
        
    }
    else
    {
        msgText = @"定位功能未开启，请开启定位服务";
    }
    
    if (b_ShowMsg)
    {
        UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"提示信息" message:msgText delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        [alterview show];
    }
}

- (IBAction)Cancel:(id)sender {
    // [self dismissViewControllerAnimated:YES completion:nil];
    
    [delegate hospitalLocationMapViewControllerDidCancel:self];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    NSLog(@"didUpdateHeading %@",[newHeading description]);
    
}

 

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
     NSLog(@"didUpdateToLocation");
    
    
    [mapView setCenterCoordinate:newLocation.coordinate animated:YES];
    
    // [textView setText:[NSString stringWithFormat:@"%@\n%@",[newLocation description],textView.text]];
    
    CLLocationDegrees latitude = newLocation.coordinate.latitude;
    CLLocationDegrees longitude = newLocation.coordinate.longitude;
    
    NSLog(@"current: %f , %f",latitude,longitude);

    
    [locationManager stopUpdatingLocation];
    
    [self FindHospitalNearby:newLocation];

    
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    NSLog(@"Entered Region");
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    NSLog(@"Exited Region");
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region{
    NSLog(@"region monitoring started\n%@",[region description]);
}

- (void)locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error{
    NSLog(@"error");
    NSLog(@"%@",[error localizedDescription]);
    
    [locationManager stopUpdatingLocation];
}


- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager{//遇到电磁干扰时，是否弹出按8字形摆动iPhone校准指南针的界面。
	return YES;
}

#pragma mark - MKMapViewDelegate

 

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
   // NSLog(@"User Moved");

    
    
}


-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"didAddAnnotationViews %u", views.count);
    
   // for (HospitalMapPin *pin in hospitalPins) {
   //     [mapView selectAnnotation:pin animated:NO];
  //  }
    
    //[mapView selectedAnnotations];
    
    
}

 
- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
  
    
    if ([annotation isKindOfClass:[HospitalMapPin class]])
    {
        MKPinAnnotationView *pinView = nil;
        
        pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:HospitalAnnotationIdentifier];
        if (pinView == nil) {
            
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:HospitalAnnotationIdentifier] ;
            pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.pinColor = MKPinAnnotationColorRed; // MKPinAnnotationColorPurple;
            pinView.canShowCallout = YES;
            pinView.animatesDrop = YES;
            pinView.draggable = YES;
            pinView.selected = YES;
            
            
        }
        
        return pinView;
    }
 
    return nil;
}


#pragma mark - View lifecyle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self DoHospitalLocationMap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
