//
//  HISLevelFinishViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-2.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HISLevelFinishViewController.h"

@interface HISLevelFinishViewController ()

@property (nonatomic,weak) IBOutlet UIButton *btnShowAroundInfo;
@property (nonatomic,weak) IBOutlet UITextView *textViewReport;


- (IBAction)Cancel:(id)sender;

- (IBAction)ShowAroundInfo:(id)sender;


- (void)CompleteQuestionScore;


@end

@implementation HISLevelFinishViewController

@synthesize LevelTests, btnShowAroundInfo, textViewReport;

#pragma mark - Actions

- (void)CompleteQuestionScore
{
    NSUInteger score = 0;
    NSString *reportText = @"";
    
    
    //计算分数值
    for (NSMutableDictionary *Item in LevelTests)
    {
        NSUInteger questionAnswer = [[Item objectForKey:@"Answer"] integerValue];
        score =  questionAnswer + score;
        
    }
    
    if ((score >4) && (score <7))
    {
        //正常
        reportText = @"恭喜您，本次测试结果显示您（或您的家属）目前正常!";

    }
    else
    {
        if (score<=4)
        {
            //AD
            reportText = @"本次测试结果提示您（或您的家属）倾向于AD，建议您（或您的家属）尽快去医生处就诊咨询！";
        }
        
        if (score>=7)
        {
            //vaD
            reportText = @"本次测试结果提示您（或您的家属）倾向于VaD，建议您（或您的家属）尽快去医生处就诊咨询！";
        }
    }
    
    
    
     
    
    textViewReport.text = reportText;
    

    
    
    
    ADTLabs_ScaleReportBLL *_scaleReportBLL = [[ADTLabs_ScaleReportBLL alloc]init];
    
    
    ADTLabs_AppDelegate *_appDelegate = [ UIApplication sharedApplication].delegate;
    
    
    
    if (_appDelegate.user != nil)
    {
        [_scaleReportBLL AddScaleReport:_appDelegate.user
         .userID withAnswer:nil withScore:score withScaleReportDesc:reportText withScaleLevelTag:ScaleLevelHIS];
    }
    
}

- (IBAction)ShowAroundInfo:(id)sender
{
    
    
    
    UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:@"消息提示"];
	[alert setMessage:@"此功能正在开发中，敬请期待！"];
	[alert setDelegate:self];
	[alert addButtonWithTitle:@"确定"];
	//[alert addButtonWithTitle:@"No"];
	[alert show];
    
    
    
    
}

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - HospitalLocationMapViewControllerDelegate

-(void)hospitalLocationMapViewControllerDidCancel:(HospitalLocationMapViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    if ([[segue identifier] isEqualToString:@"HISLevelToShowHospitalLocationMapView"])
    {
        HospitalLocationMapViewController *destination_Controller = segue.destinationViewController;
        
        destination_Controller.delegate = self;
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
    
    [self CompleteQuestionScore];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
