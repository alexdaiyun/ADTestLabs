//
//  HospitalMapViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-14.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HospitalMapViewController.h"


 
@interface HospitalMapViewController ()

@end

@implementation HospitalMapViewController

@synthesize hospitalObject;
@synthesize mapView;
@synthesize UIControl_hospitalTitle;
@synthesize delegate;
@synthesize hospitalMapPin;


#pragma mark - Actions

- (void) DisplayHospital
{
    UIControl_hospitalTitle.title =  hospitalObject.hospitalName;
    
    
    
    // set the coordinate
	CLLocationCoordinate2D coordinate;
	coordinate.latitude = hospitalObject.latitude;
	coordinate.longitude = hospitalObject.longitude;
    
    
 
    
    
    //mapView.mapType = MKMapTypeStandard;
 
    mapView.mapType = MKMapTypeStandard;
    
    MKCoordinateRegion hospitalRegion;
    hospitalRegion.center.latitude = hospitalObject.latitude;
    hospitalRegion.center.longitude = hospitalObject.longitude;
    hospitalRegion.span.latitudeDelta = 0.05;//0.112872;
    hospitalRegion.span.longitudeDelta = 0.05;//0.109863;
    
 
    //mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000);
    
    [self.mapView setRegion:hospitalRegion animated:YES];
    
    
    //HospitalMapPin *hospitalPin = [[HospitalMapPin alloc]init];
    
    hospitalMapPin = [[HospitalMapPin alloc] init];
    
    hospitalMapPin.latitude = coordinate.latitude;
    hospitalMapPin.longitude = coordinate.longitude;
    hospitalMapPin.hospitalName = hospitalObject.hospitalName;
    hospitalMapPin.hospitalAddress = hospitalObject.address;
    
    
    [mapView addAnnotation:hospitalMapPin
     ];
    
}


- (MKPinAnnotationView *)getPinView
{
    MKPinAnnotationView *pinView = nil;

    
    
    
    return pinView;
    
}

- (IBAction)Cancel:(id)sender {
    // [self dismissViewControllerAnimated:YES completion:nil];
    
    [delegate hospitalMapViewControllerDidCancel:self];
}

#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    NSLog(@"didAddAnnotationViews %u", views.count
          );
    [mapView selectAnnotation:hospitalMapPin animated:YES];

    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = nil;
 
    pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:HospitalAnnotationIdentifier];
    if (pinView == nil) {


        
       
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:HospitalAnnotationIdentifier] ;
        pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.pinColor = MKPinAnnotationColorPurple;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
        pinView.draggable = YES;
        pinView.selected = YES;
        
        
    }
    
    return pinView;
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
    
    [self DisplayHospital];
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
