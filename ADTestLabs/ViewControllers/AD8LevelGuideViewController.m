//
//  AD8LevelGuideViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "AD8LevelGuideViewController.h"


@interface AD8LevelGuideViewController ()

- (IBAction)Cancel:(id)sender;

- (void)LoadLeveData:(NSBundle *)bundle;

@end

@implementation AD8LevelGuideViewController

@synthesize LevelTests;
@synthesize user;

#pragma mark - Actions

- (IBAction)Cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)LoadLevelData:(NSBundle *)bundle
{
    NSString *path = [bundle pathForResource:@"Level_QAD8" ofType:@"plist"  inDirectory:@"Level_Q/Level_QAD8"];
    NSArray *levelTests = (path !=nil?[NSArray arrayWithContentsOfFile:path]:nil);
    
    LevelTests = [NSMutableArray arrayWithCapacity:(levelTests != nil?levelTests.count:0)];

    //NSString *questionTitle = [[NSString alloc]init];
 
    
    for (NSMutableDictionary *levelItem in levelTests)
    {
        NSUInteger questionID = [levelTests indexOfObject:levelItem];
        
        if (questionID >0)
        {
            //questionTitle = [levelItem objectForKey:@"QuestionTitle"];
            
            NSString *questionTitle = [levelItem objectForKey:@"QuestionTitle"];
            NSString *questionImage = [levelItem objectForKey:@"QuestionImage"];
            NSLog(@"%d %@",questionID, questionTitle);
            NSLog(@"%@", questionImage);
            
            [LevelTests addObject: levelItem];
        }
    }
    
    
    
    
}


#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"ShowLevelTestView_AD8"])
    {
        AD8LevelTestViewController *ad8LevelTestViewController = (AD8LevelTestViewController *)[segue destinationViewController];
        ad8LevelTestViewController.LevelTests = LevelTests;
        ad8LevelTestViewController.QuestionIndex = 1;
        ad8LevelTestViewController.user = user;
        
    }
}



#pragma mark - View lifecycle
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
    
    NSLog(@"AD8LevelGuideViewController viewDidLoad()");
    
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
	return  (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);;
}
 
@end
