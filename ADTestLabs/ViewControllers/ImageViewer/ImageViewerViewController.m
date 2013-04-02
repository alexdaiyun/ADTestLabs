//
//  ImageViewerViewController.m
//  ADTestLabs
//
//  Created by dai yun on 13-2-25.
//  Copyright (c) 2013年 alexday. All rights reserved.
//

#import "ImageViewerViewController.h"

@interface ImageViewerViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *showImageView;


- (IBAction)CloseImageViewer:(id)sender;

@end

@implementation ImageViewerViewController

@synthesize showImage;
@synthesize showImageView;


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
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    showImageView.image = showImage;
    
    
    
}

 

- (void)viewDidUnload
{
    NSLog(@"viewDidUnLoad");
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    
    [super viewWillAppear:YES];
 
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (IBAction)CloseImageViewer:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
