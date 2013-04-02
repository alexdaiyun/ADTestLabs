//
//  ADTLabs_LevelTestRootViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-8-5.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "ADTLabs_LevelTestRootViewController.h"


@interface ADTLabs_LevelTestRootViewController ()

@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelAD8;
@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelOLD;
@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelADL;
@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelMMSE;
@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelHIS;
@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelHAMD;
@property (nonatomic, weak) IBOutlet CardButton *cardButton_LevelMOCA;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *barButtonItem_currentUserName;

@property (copy,nonatomic) ADTLabs_User *currentUser;



- (void)initUser;
- (void)DisplayLevelBtn;



@end

@implementation ADTLabs_LevelTestRootViewController

@synthesize cardButton_LevelAD8;
@synthesize cardButton_LevelADL;
@synthesize cardButton_LevelOLD;
@synthesize cardButton_LevelHAMD;
@synthesize cardButton_LevelHIS;
@synthesize cardButton_LevelMMSE;
@synthesize cardButton_LevelMOCA;
@synthesize barButtonItem_currentUserName;
@synthesize currentUser;

@synthesize delegate;

#pragma mark - Actions

- (void)initUser
{
    if (currentUser == nil)
    {
        NSLog(@"nil");
        [self barButtonItem_currentUserName].title =  @"当前用户姓名: (未选择)";
    }
    
    
}

- (void)DisplayLevelBtn
{
    
    /* 1 cardButton_LevelAD8 */
    //cardButton_LevelAD8.titleLabel.text = @"";
    [cardButton_LevelAD8 setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelAD8.cardTitleText= @"AD8记忆障碍自评量表";
    cardButton_LevelAD8.cardSubTitleText = @"AD8 Dementia Screening Interview";
    cardButton_LevelAD8.scopeText = @"普通";
    cardButton_LevelAD8.itemTotalText= @"8";
    cardButton_LevelAD8.cardType = 0;
    
    /* 2 cardButton_LevelOLD */
    //cardButton_LevelOLD.titleLabel.text = @"";
    [cardButton_LevelOLD setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelOLD.cardTitleText = @"痴呆初期征兆的观察列表";
    cardButton_LevelOLD.cardSubTitleText = @"Observation List for early signs of Dementia\n(OLD)";
    cardButton_LevelOLD.scopeText = @"专业";
    cardButton_LevelOLD.itemTotalText= @"12";
    cardButton_LevelOLD.cardType = 1;
    
    
    /* 3 cardButton_LevelADL */
    //cardButton_LevelADL.titleLabel.text = @"";
    [cardButton_LevelADL setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelADL.cardTitleText = @"日常生活能力量表";
    cardButton_LevelADL.cardSubTitleText = @"Activity of Daily Living\n(ADL)";
    cardButton_LevelADL.scopeText = @"专业";
    cardButton_LevelADL.itemTotalText= @"20";
    cardButton_LevelADL.cardType = 1;
    
    /* 4 cardButton_LevelHAMD */
    //cardButton_LevelHAMD.titleLabel.text = @"";
    [cardButton_LevelHAMD setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelHAMD.cardTitleText = @"汉密尔顿抑郁量表";
    cardButton_LevelHAMD.cardSubTitleText = @"Hamilton Depression Scale\n(HAMND)";
    cardButton_LevelHAMD.scopeText = @"专业";
    cardButton_LevelHAMD.itemTotalText= @"17";
    cardButton_LevelHAMD.cardType = 1;

    
    /* 5 cardButton_LevelHIS */
    //cardButton_LevelHIS.titleLabel.text = @"";
    [cardButton_LevelHIS setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelHIS.cardTitleText = @"哈金斯基缺血量表";
    cardButton_LevelHIS.cardSubTitleText = @"Hachinski Ischemic Scale\n(HIS)";
    cardButton_LevelHIS.scopeText = @"专业";
    cardButton_LevelHIS.itemTotalText= @"13";
    cardButton_LevelHIS.cardType = 1;
    


    /* 6 cardButton_LevelMMSE */
    //cardButton_LevelMMSE.titleLabel.text = @"";
    [cardButton_LevelMMSE setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelMMSE.cardTitleText = @"MMSE量表";
    cardButton_LevelMMSE.cardSubTitleText = @"Mini Mental State Examination\n(MMSE)";
    cardButton_LevelMMSE.scopeText = @"专业";
    cardButton_LevelMMSE.itemTotalText= @"12";
    cardButton_LevelMMSE.cardType = 1;
    
    /* 7 cardButton_LevelMOCA */
    //cardButton_LevelMOCA.titleLabel.text = @"";
    [cardButton_LevelMOCA setTitle:@"" forState:UIControlStateNormal];
    cardButton_LevelMOCA.cardTitleText = @"蒙特利尔认知评估量表";
    cardButton_LevelMOCA.cardSubTitleText = @"Montreal Cognitive Assessment\n(MoCA)";
    cardButton_LevelMOCA.scopeText = @"专业";
    cardButton_LevelMOCA.itemTotalText= @"15";
    cardButton_LevelMOCA.cardType = 1;

 
    
    
    
    /* 
    
     
    
    
    
    btnLevelADL.titleLabel.text = @"ADL日常生活能力量表\nActivity of Daily Living\n专业医师使用";
    btnLevelADL.titleLabel.textAlignment = UITextAlignmentCenter;  
    btnLevelADL.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    btnLevelOLD.titleLabel.text = @"OLD痴呆初期征兆列表";
    btnLevelOLD.titleLabel.textAlignment = UITextAlignmentCenter;
  
    btnLevelOLD.titleLabel.lineBreakMode = UILineBreakModeWordWrap;
    
    */
    
    
    /* 手动定义 CardButton  
    CardButton *_cardButton = [[CardButton alloc] init ];
    _cardButton.frame = CGRectMake(600,11,198,220);
    _cardButton.cardTitleText = @"AD8记忆障碍自评表\nActivity of Daily Living";
    _cardButton.scopeText = @"适用：普通人群";
    _cardButton.itemTotalText = @"8项";
    [self.view addSubview:_cardButton];
    */
    
 

    
    NSLog(@"DisplayLevelBtn");
    
    
 
    
    
    
}

#pragma mark - currentUser setValue
-(void)setCurrentUser:(ADTLabs_User *)userObject
{
    NSLog(@"setCurrentUser()");
    if ( ![userObject isEqual:currentUser])
    {
        currentUser = userObject;
        NSLog(@"当前选择 %@ ",[currentUser userName]);
        //self title = [currentUser userName];
        [self barButtonItem_currentUserName].title = [NSString stringWithFormat:@"当前用户姓名: %@", currentUser.userName];
        
        
        ADTLabs_AppDelegate *_appDelegate = [ UIApplication sharedApplication].delegate;
        _appDelegate.user = currentUser;
        
    }
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue");
    
    if ( [[segue identifier] isEqualToString:@"ShowUserListView"])
    {
        
        //获得目标场景中的ViewController对象
        UINavigationController *destination_NavigationController = segue.destinationViewController;
        
        //由于实际的ViewController是从属于Navigationcontroller中，所以需要从其中获得
        UserListViewController *destination_userListViewController = [[destination_NavigationController viewControllers] objectAtIndex:0];
        
        //将目标窗体的委托对象userListViewControllerDelegate设定为当前viewController
        destination_userListViewController.delegate = self;
        
        
        
    }
    
    if ([[segue identifier] isEqualToString:@"ShowUserAddView"])
    {
        //获得目标场景中的ViewController对象
        UINavigationController *destination_NavigationController = segue.destinationViewController;
        
        //由于实际的ViewController是从属于Navigationcontroller中，所以需要从其中获得
        UserAddViewController *destination_userAddViewController = [[destination_NavigationController viewControllers] objectAtIndex:0];
        
        //将目标窗体的委托对象userAddViewControllerDelegate设定为当前viewController
        destination_userAddViewController.delegate = self;
        
    }
    
    
    if ([[segue identifier] isEqualToString:@"DashBoard_ShowViewController_AD8"])
    {
        
        
    }
 
    
}

#pragma mark - UserListViewControllerDelegate
/* 实现此协议中的所有方法 */

- (void)userListViewController:(UserListViewController *)viewController didSelectUser:(ADTLabs_User *)user
{
 
    self.currentUser = user;
 
    
}

#pragma mark - UserAddViewControllerDelegate

- (void)userAddViewControllerDidCancel:(UserAddViewController *)viewController
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)userAddViewController:(UserAddViewController *)viewController didAddUser:(ADTLabs_User *)User
{
    
    self.currentUser = User;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - View lifecyle


- (void)awakeFromNib
{
    NSLog(@"awakeFromNib");

    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mainBoar-Landscape~ipad.png"]];
    
   // UIImage *image = [UIImage imageNamed:@"mainBoar-Landscape~ipad.png"];
   // self.view.layer.contents = (id) image.CGImage;
   // self.view.layer
    
       
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    NSLog(@"initWithNibName");

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
    
    [self initUser];
    
    [self DisplayLevelBtn];
    
    
    
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
    
    NSLog(@"current: %@",currentUser.userName);
    
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
