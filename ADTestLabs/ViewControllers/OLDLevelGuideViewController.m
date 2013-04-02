//
//  OLDLevelGuideViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "OLDLevelGuideViewController.h"
#import "OLDLevelTestViewController.h"

@interface OLDLevelGuideViewController ()

- (IBAction)Cancel:(id)sender;

- (void)LoadLevelData:(NSBundle *)bundle;

@end

@implementation OLDLevelGuideViewController

@synthesize LevelTests;


#pragma mark - Actions

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)LoadLevelData:(NSBundle *)bundle
{
    NSString *path = [bundle pathForResource:@"Level_QOLD" ofType:@"plist"  inDirectory:@"Level_Q/Level_QOLD"];
    
    //NSLog(@"%@",path);
    
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
    if([[segue identifier] isEqualToString:@"ShowLevelTestView_OLD"])
    {
        OLDLevelTestViewController *oldLevelTestViewController = (OLDLevelTestViewController *)[segue destinationViewController];
        oldLevelTestViewController.LevelTests = LevelTests;
        oldLevelTestViewController.QuestionIndex = 1;
        
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
    NSLog(@"OLDÍLevelGuideViewController viewDidLoad()");    
    
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
