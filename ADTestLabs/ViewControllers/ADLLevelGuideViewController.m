//
//  ADLLevelGuideViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADLLevelGuideViewController.h"
#import "ADLLevelTestViewController.h"

@interface ADLLevelGuideViewController ()

- (IBAction)Cancel:(id)sender;

- (void)LoadLevelData:(NSBundle *)bundle;



@end

@implementation ADLLevelGuideViewController

@synthesize LevelTests;


#pragma mark - Actions

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)LoadLevelData:(NSBundle *)bundle
{
    NSString *path = [bundle pathForResource:@"Level_QADL" ofType:@"plist" inDirectory:@"Level_Q/Level_QADL"];
    NSArray *levelTests = (path !=nil?[NSArray arrayWithContentsOfFile:path]:nil);
    
    LevelTests = [NSMutableArray arrayWithCapacity:(levelTests != nil?levelTests.count:0)];
    
    NSString *questionTitle = [[NSString alloc]init];
    
    
    for (NSMutableDictionary *levelItem in levelTests)
    {
        
        questionTitle = [levelItem objectForKey:@"QuestionTitle"];
        NSUInteger questionID = [levelTests indexOfObject:levelItem];
        
       // NSLog(@"%d %@",questionID, questionTitle);
        
        [LevelTests addObject: levelItem];
    }
    
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ShowLevelTestView_ADL"])
    {
        ADLLevelTestViewController *adlLevelTestViewController = (ADLLevelTestViewController *)[segue destinationViewController];
        adlLevelTestViewController.LevelTests = LevelTests;
        adlLevelTestViewController.QuestionIndex = 1;
        
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
    [self LoadLevelData:[NSBundle mainBundle]];
    self.title = @"评测说明";

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
