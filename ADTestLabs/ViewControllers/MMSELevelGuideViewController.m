//
//  MMSELevelGuideViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-2.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "MMSELevelGuideViewController.h"
#import "MMSELevelTestViewController.h"

@interface MMSELevelGuideViewController ()


- (IBAction)Cancel:(id)sender;

- (void)LoadLevelData:(NSBundle *)bundle;


@end

@implementation MMSELevelGuideViewController

@synthesize LevelTests;

#pragma mark - Actions

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)LoadLevelData:(NSBundle *)bundle
{
    NSString *path = [bundle pathForResource:@"Level_QMMSE" ofType:@"plist" inDirectory:@"Level_Q/Level_QMMSE"];
    NSArray *levelTests = (path !=nil?[NSArray arrayWithContentsOfFile:path]:nil);
    
    
    LevelTests = [NSMutableArray arrayWithCapacity:(levelTests != nil?levelTests.count:0)];
    
    
    for (NSMutableDictionary *levelItem in levelTests)
    {
        
        NSUInteger questionID = [levelTests indexOfObject:levelItem];
        
        if (questionID >0)
        {
            
            NSString *questionTitle = [levelItem objectForKey:@"QuestionTitle"];
            NSLog(@"%d %@",questionID, questionTitle);
            
            [LevelTests addObject: levelItem];
        }
        
    }
    
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ShowLevelTestView_MMSE"])
    {
        MMSELevelTestViewController *testViewController = (MMSELevelTestViewController *)[segue destinationViewController];
        testViewController.LevelTests = LevelTests;
        testViewController.QuestionIndex = 1;
        
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
