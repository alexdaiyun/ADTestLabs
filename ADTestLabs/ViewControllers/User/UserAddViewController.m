//
//  UserAddViewController.m
//  ADTestLabs
//
//  Created by dai yun on 12-11-10.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "UserAddViewController.h"

@interface UserAddViewController ()


@end

@implementation UserAddViewController

@synthesize UIControl_gender, UIControl_UserName, UIControl_BirthDay;
@synthesize DatePickerVC, DatePickerPopoverController;
@synthesize delegate;
@synthesize birthdayMonth, birthdayYear;

#pragma mark - Actions


- (IBAction)Cancel:(id)sender {
   // [self dismissViewControllerAnimated:YES completion:nil];
    
    [delegate userAddViewControllerDidCancel:self];
}


- (IBAction)btnAddUser:(id)sender {
    
    if (UIControl_UserName.text.length == 0)
    {
        return;
        
    }
    
    if (birthdayMonth == 0)
    {
        return;
    }
    
    if (birthdayYear == 0)
    {
        return;
    }
    
    
    [self AddUser];
    
 
    
    
    /*
    sqlite3 *database;
    
    sqlite3_stmt *statement = nil;
    
    NSString *DBPath = [ADTLabs_DBHelper getDBPath];
    
    NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO TBL_User (UserName,BirthdayYear,BirthdayMonth,Gender) VALUES(\"%@\",\"%@\",\"%@\",\"%@\")",UIControl_UserName.text,@"1960",@"6",@"M"];
    const char *insert_stmt = [insertSQL UTF8String];
    
    @try {
        if (!(sqlite3_open([DBPath UTF8String], &database) == SQLITE_OK))
        {
            NSLog(@"error opening database. ");
        }
        
        
        if (sqlite3_prepare_v2(database, insert_stmt, -1, &statement, NULL) != SQLITE_OK)
        {
            NSLog(@"Error, failed to prepare statement");
        }
        
        if (sqlite3_step(statement)==SQLITE_DONE) {
            
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
        
        
        if (sqlite3_finalize(statement)!= SQLITE_OK) {
            NSLog(@"Failed to finalize data statement.");
        }
        if (sqlite3_close(database) != SQLITE_OK) {
            NSLog(@"Failed closed.");
        }
        
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"an exception occurred: %@", [ exception reason]);
        
    }
    
    */
    
    
    
    
}

#pragma mark - Add User

- (void)AddUser
{
    NSLog(@"AddUser");
    
    BOOL success;
    NSError *error;
   
    //FMDatabase *fmdb;
    


    ADTLabs_User *newUser = [[ADTLabs_User alloc]init];
    
    newUser.userName = [UIControl_UserName.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    switch ([UIControl_gender selectedSegmentIndex]) {
        case 0:
            newUser.gender = @"M";
            break;
        case 1:
            newUser.gender = @"F";
            break;
        default:
            newUser.gender = @"M";
            break;
    }
    
    newUser.birthdayYear = birthdayYear;
    newUser.birthdayMonth = birthdayMonth;
    
    
    
    ADTLabs_UserBLL *_userBLL = [[ADTLabs_UserBLL alloc] init];
    
  
   int newUserID =  [_userBLL AddUser:newUser];

    
    ADTLabs_User *getUser = [[ADTLabs_User alloc]init];
    getUser = [_userBLL GetUserByUserID:newUserID];
    
    [delegate userAddViewController:self didAddUser:getUser];
    
    
    
    //NSLog(getUser.userName);
    
    /*
    fmdb = [ FMDatabase databaseWithPath:DBPath];
    
    
    if ([fmdb open])
    {
        [fmdb setShouldCacheStatements:YES];
        
        [fmdb executeQuery:@"INSERT INTO TBL_User (UserName,BirthdayYear,BirthdayMonth,Gender) VALUES(?,?,?,?)",
         newUser.userName,
         [NSNumber numberWithInt:2001],
         [NSNumber numberWithInt:10],
        // newUser.gender
          @"F"
         ];
        
         if ([fmdb hadError])
         {
             NSLog(@"Err %d: %@", [fmdb lastErrorCode], [fmdb lastErrorMessage]);
         }
        [fmdb close];
        
    }
    else
    {
        success = NO;
    }
    
    */
    
    
}



#pragma mark - UserBirthDayDatePickerViewControllerDelegate
- (void) userBirthDayDatePickerViewController:(UserBirthDayDatePickerViewController *)viewController didSelectValue:(NSDate *)value
{
    
    NSString *userBirthdayTitle = [[NSString alloc]init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy年MM月"];
    
    userBirthdayTitle = [dateFormatter stringFromDate:value];
    
    NSLog(@"%@", userBirthdayTitle);
    
    UIControl_BirthDay.text = userBirthdayTitle;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit) fromDate:value];
    
   
   
    birthdayYear = [dayComponents year];
    birthdayMonth = [dayComponents month];
    
     NSLog(@"%u  %u",birthdayYear, birthdayMonth);
    
    //userBirthdayTitle = [NSString stringWithFormat:@"",value];
    
}


#pragma mark - UITextFieldDelegate Functions

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    NSLog(@"textFieldDidBeginEditing");
    
    
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

    NSLog(@"textFieldShouldBeginEditing");

    if (textField == UIControl_BirthDay)
    {
        
        
        
        //Assign DatePicker to Birthday TextField
        //build our custom popover view
        UserBirthDayDatePickerViewController* popoverContent = [[UserBirthDayDatePickerViewController alloc] init];
        
        popoverContent =[[UIStoryboard storyboardWithName:@"MainStoryboard"
                                                   bundle:nil]
                         instantiateViewControllerWithIdentifier:@"UserBirthDayDatePickerVC"];
        //resize the popover view shown
        //in the current view to the view's size
        popoverContent.contentSizeForViewInPopover = CGSizeMake(320, 216);
        
        popoverContent.delegate = self;
        
        
        // dismiss existing popover
        if (self.DatePickerPopoverController)
        {
            [self.DatePickerPopoverController dismissPopoverAnimated:NO];
            self.DatePickerPopoverController = nil;
        }
        
        //create a popover controller with my DatePickerViewController init
        UIPopoverController *popoverControllerForDate = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
        //Set the delegate to self to receive the data of the Datepicker in the popover
        popoverControllerForDate.delegate = self;
        //Adjust the popover Frame to appear where I want
        CGRect myFrame =textField.frame;
        myFrame.origin.x = 260;
        myFrame.origin.y = 320;
        
        //Present the popover
        [popoverControllerForDate presentPopoverFromRect:myFrame
                                                  inView:self.view
                                permittedArrowDirections:UIPopoverArrowDirectionDown
                                                animated:YES];
        self.DatePickerPopoverController = popoverControllerForDate;
        
        return NO;// tells the textfield not to start its own editing process (ie show the keyboard)
        
    }
    
    return YES;
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
    
    
    //此处是为了响应UITextFieldDelegate
    UIControl_UserName.delegate = self;
    UIControl_BirthDay.delegate = self;
    //UIControl_BirthDay.inputView = [[UIDatePicker alloc]init];// DatePicker;
    
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
