//
//  ADTLabs_MainRootViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-8.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_MainRootViewController.h"

@interface ADTLabs_MainRootViewController ()

@end

@implementation ADTLabs_MainRootViewController

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	//return YES;
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
