//
//  HAMNDLevelGuideViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-1.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "HAMNDLevelGuideViewController.h"
#import "HAMNDLevelTestViewController.h"

@interface HAMNDLevelGuideViewController ()

- (IBAction)Cancel:(id)sender;

- (void)LoadLevelData:(NSBundle *)bundle;

@end

@implementation HAMNDLevelGuideViewController

@synthesize LevelTests;

#pragma mark - Actions

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)LoadLevelData:(NSBundle *)bundle
{
    NSString *path = [bundle pathForResource:@"Level_QHAMND" ofType:@"plist" inDirectory:@"Level_Q/Level_QHAMND"];
    NSArray *levelTests = (path !=nil?[NSArray arrayWithContentsOfFile:path]:nil);
    
    
    LevelTests = [NSMutableArray arrayWithCapacity:(levelTests != nil?levelTests.count:0)];
    
        
    for (NSMutableDictionary *levelItem in levelTests)
    {
        
        NSUInteger questionID = [levelTests indexOfObject:levelItem];
        
        if (questionID >0)
        {
            
            NSString *questionTitle = [levelItem objectForKey:@"QuestionTitle"];
            
            NSString *questionDesc = [levelItem objectForKey:@"QuestionDesc"];
            
            NSString *questionImage = [levelItem objectForKey:@"QuestionImage"];
            
            NSString *questionRank = [levelItem objectForKey:@"QuestionRank"];
            

            
            NSLog(@"questionID: %d",questionID);
            NSLog(@"questionTitle: %@",questionTitle);
            NSLog(@"questionDesc: %@",questionDesc);
            NSLog(@"questionImage: %@", questionImage);
            NSLog(@"questionRank: %@ ",questionRank);
            
            NSMutableDictionary *questionRankDesc = [levelItem objectForKey:@"QuestionRankDesc"];            
            
            NSLog(@"questionRank count: %d ",questionRankDesc.count);
            
            
            for (NSUInteger itemIndex = 0 ; itemIndex < questionRankDesc.count ; itemIndex ++) {
                 
                
               NSString *rankDescItemTitle  = [ questionRankDesc objectForKey:[NSString stringWithFormat: @"%d", itemIndex]];
               
                NSLog(@"questionRank index: %d", itemIndex);
                NSLog(@"questionRankDesc : %@", rankDescItemTitle);
                
                                 
            }
            
            
            [LevelTests addObject: levelItem];
        }
        
    }
    
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ShowLevelTestView_HAMND"])
    {
        HAMNDLevelTestViewController *testViewController = (HAMNDLevelTestViewController *)[segue destinationViewController];
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
