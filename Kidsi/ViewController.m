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

- (void)viewDidLoad
{
   
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
    return [textField resignFirstResponder];
}

-(IBAction)login:(id)sender
{
    
    
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

    
    
   
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
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
    
    
    
    return YES;
}
@end
