//
//  ScaleReportDetailViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-13.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ScaleReportDetailViewController.h"

@interface ScaleReportDetailViewController ()

@end

@implementation ScaleReportDetailViewController

@synthesize scaleReportID;
@synthesize scaleLevleTag;
@synthesize scaleReportObj;
@synthesize user;

@synthesize UIControl_ScaleTitle;
@synthesize UIControl_Score;
@synthesize UIControl_ReportDate;
@synthesize UIControl_ReportDesc;

#pragma mark - Actions


- (void) LoadScaleReportData
{
    ADTLabs_ScaleReportBLL *_scaleReportBLL = [[ADTLabs_ScaleReportBLL alloc] init];
    
    scaleReportObj = [_scaleReportBLL getScaleReportByUserID:user.userID withScaleReportID:scaleReportID withScaleLevelTag:scaleLevleTag];
    
    
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //UIControl_ReportDate.text = [inputFormatter stringFromDate:scaleReportObj.reportDate];
    
    UIControl_ReportDate.text = scaleReportObj.historyDate;
    
    UIControl_Score.text = [NSString stringWithFormat:@"%d", scaleReportObj.score];
    
    UIControl_ReportDesc.numberOfLines = 0;
    UIControl_ReportDesc.text = scaleReportObj.scaleReportDesc;
    
    switch (scaleLevleTag) {
        case ScaleLevelAD8:
            UIControl_ScaleTitle.text = ScaleLevelAD8_Title;
            break;
        case ScaleLevelADL:
            UIControl_ScaleTitle.text = ScaleLevelADL_Title;
            break;
        case ScaleLevelOLD:
            UIControl_ScaleTitle.text = ScaleLevelOLD_Title;
            break;
        case ScaleLevelMMSE:
            UIControl_ScaleTitle.text = ScaleLevelMMSE_Title;
            break;
        case ScaleLevelMOCA:
            UIControl_ScaleTitle.text = ScaleLevelMOCA_Title;
            break;
        case ScaleLevelHIS:
            UIControl_ScaleTitle.text = ScaleLevelHIS_Title;
            break;
        case ScaleLevelHAMND:
            UIControl_ScaleTitle.text = ScaleLevelHAMND_Title;
            break;
        default:
            break;
    }
    
    
    
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
    
    [self LoadScaleReportData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"viewWillDisappear");
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
     
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSLog(@"viewDidDisappear");
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}


@end
