//
//  SchoolInfoViewController.m
//  Kidsi
//
//  Created by Ashok on 10/29/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "SchoolInfoViewController.h"

@interface SchoolInfoViewController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property (weak, nonatomic) IBOutlet UINavigationItem *sNavigationItem;
@end

@implementation SchoolInfoViewController
@synthesize backButtonItem,navigationBar,sNavigationItem;
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
    //Status bar...
    
    
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
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
    [sNavigationItem setLeftBarButtonItem:btnBack];


    
    /*
    //Navigation item....
    UIImage *image = [UIImage imageNamed:@"icon.png"];
    UIImage *backgroundSelected = [UIImage imageNamed:@"icon_selected.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(backButton:)forControlEvents:UIControlEventAllEvents]; //adding action
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundSelected forState:UIControlStateSelected];
    button.frame = CGRectMake(0 ,0,35,35);
   // backButtonItem= [[UIBarButtonItem alloc]initWithCustomView:viewww];
    //self.navigationItem.leftBarButtonItem = backButtonItem;
        */
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)backButton:(id)sender
{
    //self.navigationController.navigationItem.leftBarButtonItem.customView.frame=CGRectMake(0, 0, 100, 30);
       [self.navigationController popViewControllerAnimated:YES];
}
@end
