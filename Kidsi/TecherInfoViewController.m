//
//  TecherInfoViewController.m
//  Kidsi
//
//  Created by Ashok on 10/30/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "TecherInfoViewController.h"

@interface TecherInfoViewController ()

@end

@implementation TecherInfoViewController

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
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
    view.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:view];
    

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
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
