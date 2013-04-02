//
//  ADTLabs_WebLinkViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_WebLinkViewController.h"

@interface ADTLabs_WebLinkViewController ()

@property(nonatomic,strong)    UIActivityIndicatorView *activityIndicatorView;


@property (weak, nonatomic) IBOutlet UIBarButtonItem *GoBack;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Reload;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *GoForward;
- (IBAction)BtnGoBack:(id)sender;
- (IBAction)BtnReload:(id)sender;
- (IBAction)BtnGoForward:(id)sender;






@end

@implementation ADTLabs_WebLinkViewController

@synthesize webView;
@synthesize activityIndicatorView;
@synthesize GoBack, GoForward, Reload;


- (void)LoadUrl
{
    

    NSURL *url =[NSURL URLWithString:@"http://www.ad921.com"];
     
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicatorView startAnimating] ;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicatorView stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    if (error.code == NSURLErrorCancelled) return; // this is Error -999
    // error handling for "real" errors here
    
    
    UIAlertView *alterview = [[UIAlertView alloc] initWithTitle:@"提示信息" message:[error localizedDescription]  delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alterview show];
    
}

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
    
    
    webView.scalesPageToFit = YES;
    
    webView.delegate = self;
    
    
    
    activityIndicatorView = [[UIActivityIndicatorView alloc]
                             initWithFrame : CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)] ;
    [activityIndicatorView setCenter: self.view.center] ;
    [activityIndicatorView setActivityIndicatorViewStyle: UIActivityIndicatorViewStyleWhite] ;
    [self.view addSubview : activityIndicatorView] ;
    
    [self LoadUrl];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self LoadUrl];;
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
- (void)viewDidUnload {
    [self setGoBack:nil];
    [self setGoForward:nil];
    [self setReload:nil];
    [super viewDidUnload];
}
- (IBAction)BtnGoBack:(id)sender {
    [webView goBack];
}

- (IBAction)BtnReload:(id)sender {
    [webView reload];
}

- (IBAction)BtnGoForward:(id)sender {
    [webView goForward];
}
 
@end
