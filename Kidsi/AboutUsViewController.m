//
//  AboutUsViewController.m
//  Kidsi
//
//  Created by Ashok on 12/3/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController
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
    [super viewDidLoad];
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0, 0,1024, 20)];
    view1.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:view1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 80, 44)];
    [btn setTitle:@"Home" forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btnBack setTintColor:[UIColor whiteColor]];
    [navigationItem setLeftBarButtonItem:btnBack];
    

    // Do any additional setup after loading the view.
}


-(IBAction)backButton:(id)sender;
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
