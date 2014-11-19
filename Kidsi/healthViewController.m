//
//  healthViewController.m
//  Kidsi
//
//  Created by Ashok on 11/5/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "healthViewController.h"

@interface healthViewController ()

@end

@implementation healthViewController
@synthesize navigationItem;
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
    
    //status bar....
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
    view.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:view];
    //self.navigationController.navigationBarHidden=FALSE;
    // self.navigationController.toolbarHidden=FALSE;
    self.navigationController.navigationBar.barTintColor=[UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    
    
    //navigation bar back button....
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 80, 44)];
    [btn setTitle:@"Home" forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btnBack setTintColor:[UIColor whiteColor]];
    [navigationItem setLeftBarButtonItem:btnBack];
    

    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=TRUE;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=TRUE;
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
