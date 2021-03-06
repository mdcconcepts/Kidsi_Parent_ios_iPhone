//
//  ViewController.m
//  Kidsi
//
//  Created by Ashok on 10/18/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageViewForVehical,imageViewForStudent;
- (void)viewDidLoad
{
   
   [UIApplication sharedApplication].statusBarHidden=TRUE;
    
    
    
    
    [self.userNameTextField setLeftViewMode:UITextFieldViewModeAlways];
    self.userNameTextField.leftView= [[UIView alloc] initWithFrame:CGRectMake(0, 0,30, 30)];
    UIImageView *username=[[UIImageView alloc]initWithFrame:CGRectMake(3, 3,24, 24)];
    username.image=[UIImage imageNamed:@"username.png"];
    
   // self.userNameTextField.leftView.frame=CGRectMake(0, 0,30, 30);
    self.userNameTextField.borderStyle=UITextBorderStyleNone;
    self.userNameTextField.layer.cornerRadius=16.0f;
    self.userNameTextField.layer.borderColor=[UIColor whiteColor].CGColor;
    self.userNameTextField.layer.borderWidth=0.2f;
    [self.userNameTextField.leftView addSubview:username];
    
    
    
    [self.passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    self.passwordTextField.leftView= [[UIView alloc] init];
    UIImageView *password=[[UIImageView alloc]initWithFrame:CGRectMake(3, 3,24, 24)];
    password.image=[UIImage imageNamed:@"passward.png"];
    
    self.passwordTextField.leftView.frame=CGRectMake(0, 0,30, 30);
    //self.userNameTextField.borderStyle=UITextBorderStyleLine;
    self.passwordTextField.layer.cornerRadius=16.0f;
    self.passwordTextField.layer.borderColor=[UIColor whiteColor].CGColor;
    self.passwordTextField.layer.borderWidth=0.2f;
    
    
    [self.passwordTextField.leftView addSubview:password];
    
   // self.passwordTextField.leftView= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"passward.png"]];
   // self.passwordTextField.leftView.frame=CGRectMake(0, 0,26, 30);
    //self.userNameTextField.borderStyle=UITextBorderStyleLine;
   
   
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==self.userNameTextField)
        return [self.passwordTextField becomeFirstResponder];
    else
        return [textField resignFirstResponder];
}

-(IBAction)login:(id)sender
{
    /*
    
    if(![self.userNameTextField.text isEqualToString:@""] && ![self.passwordTextField.text isEqualToString:@""] && [self.userNameTextField.text isEqualToString:@"ashok"] && [self.passwordTextField.text isEqualToString:@"ashok"])
    {
        self.userNameTextField.text=@"";
        self.passwordTextField.text=@"";
        MenuViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
        [self.navigationController pushViewController:m animated:YES];
        // UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Login" message:@"Login Sucessfully..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        // [a show];
        
    }
    else if([self.userNameTextField.text length]==0 && [self.passwordTextField.text length]==0)
    {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Login Failed..." message:@"Please Enter both Username and Password..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
    }
    
    else
    {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Login Failed..." message:@"Please Enter Correct Username and Password..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
        
        
    }

    */
    
    
    
    NSString *content=[NSString stringWithFormat:@"username=%@&password=%@",self.userNameTextField.text,self.passwordTextField.text];
   
   // NSString *content = @"selfusernameTextField.text&field2=Hello";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://swapnil.mdcconcepts.com/gcm_server_files/checklogin.php"]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[content dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"%@",request);
    // generates an autoreleased NSURLConnection
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    NSError *error;
    NSURLResponse *response;
    NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSInteger successUser=0;
    NSInteger successPass=0;
    NSString *data=[[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
    NSDictionary *jsonData = [NSJSONSerialization
                              JSONObjectWithData:urlData
                              options:NSJSONReadingMutableContainers
                              error:&error];
    
    successUser = [jsonData[@"userexist"]integerValue];
    successPass = [jsonData[@"code"]integerValue];
    
    data = [data stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"%@",data);
    
    if([self.userNameTextField.text isEqualToString:@""] && [self.passwordTextField.text isEqualToString:@""])
    {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Login Failed..." message:@"Please Enter  Username and Password..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];

    }
    else
    
    if(successUser==1 && successPass==0)
    {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Login Failed..." message:@"Please Enter Correct Password..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];
        
    }

    else
    if(successUser==1 && successPass==1)
    {
        self.userNameTextField.text=@"";
        self.passwordTextField.text=@"";
       
        [UIView transitionWithView:imageViewForVehical
                          duration:5.0f
                           options:UIViewAnimationOptionLayoutSubviews                   animations:^{
                               
                               self.imageForStudentLogo.hidden=TRUE;
                               imageViewForVehical.frame=CGRectMake(imageViewForVehical.frame.origin.x+250, imageViewForVehical.frame.origin.y, imageViewForVehical.frame.size.width, imageViewForVehical.frame.size.height);
                              // self.imageViewForVehical.alpha=0.4;
                               
                           } completion:^(BOOL finished){
                               // HealthButton.alpha=0.0f;
                              // [shadowHeathImageView setAlpha:1.0f];
                              /* [UIView beginAnimations:nil context:nil];
                               [UIView setAnimationDuration:0.4];
                               [UIView setAnimationDelay:0.2];
                               [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                               imageViewForVehical.frame=CGRectMake(imageViewForVehical.frame.origin.x+300, imageViewForVehical.frame.origin.y, imageViewForVehical.frame.size.width, imageViewForVehical.frame.size.height);
                               */
                               
                               
                               MenuViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
                               [self.navigationController pushViewController:m animated:YES];
                               

                               }];
    }
    else
    {
        UIAlertView *a=[[UIAlertView alloc]initWithTitle:@"Login Failed..." message:@"Please Enter Correct Username and Password..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [a show];

    }
    
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    /*
    if (textField == self.userNameTextField) { // SSN is an outlet
        NSString *regEx = @"[a-zA-Z]{1}[a-zA-Z0-9]";
        NSRange r = [textField.text rangeOfString:regEx options:NSRegularExpressionSearch];
        if (r.location == NSNotFound)
        {
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Invalid Input..."
                                                          message:@"Please enter the correct Username"
                                                         delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [av show];
            return NO;
        }
    }
    
    
    
    if(textField==self.passwordTextField)
    {
        if([self.passwordTextField.text length]<6)
        {
            UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Invalid Pasword" message:@"Please enter atleast 6 digit Password..." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [error show];
        
        }
    
    }
    
    */
    
    return YES;
}
@end
