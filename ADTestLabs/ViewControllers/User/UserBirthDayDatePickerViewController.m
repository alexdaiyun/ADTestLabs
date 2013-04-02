//
//  UserBirthDayDatePickerViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-11.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "UserBirthDayDatePickerViewController.h"

@interface UserBirthDayDatePickerViewController ()

@end

@implementation UserBirthDayDatePickerViewController

@synthesize delegate;
@synthesize datePicker;
@synthesize transDate;


/*
- (IBAction)datePickerValueChanged:(id)sender {
    

    
}
*/

- (IBAction)datePickerValueChanged:(id)sender {
    transDate = [sender date];
    NSLog(@"valuechanged: %@",transDate);
    
    //根据协议，传递数据
    [delegate userBirthDayDatePickerViewController:self didSelectValue:transDate];
    
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
    
    NSDate *now = [[NSDate alloc] init];
    [datePicker setDate:now animated:NO];
    transDate = now;
    
    //NSLog(@"%@",transDate);
    
    
    
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
