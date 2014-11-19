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
@synthesize navigationItem;
@synthesize star1;
@synthesize star2,star3,star4,star5;
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
    
    [star1 setTag:1];
    [star1 setBackgroundImage:[UIImage imageNamed:@"star12.png"] forState:UIControlStateNormal];
    [star1 setBackgroundImage:[UIImage imageNamed:@"star22.png"] forState:UIControlStateSelected];
    [star1 addTarget:self action:@selector(star1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [star2 setTag:2];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star12.png"] forState:UIControlStateNormal];
    [star2 setBackgroundImage:[UIImage imageNamed:@"star22.png"] forState:UIControlStateSelected];
    [star2 addTarget:self action:@selector(star1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [star3 setTag:3];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star12.png"] forState:UIControlStateNormal];
    [star3 setBackgroundImage:[UIImage imageNamed:@"star22.png"] forState:UIControlStateSelected];
    [star3 addTarget:self action:@selector(star1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [star4 setTag:4];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star12.png"] forState:UIControlStateNormal];
    [star4 setBackgroundImage:[UIImage imageNamed:@"star22.png"] forState:UIControlStateSelected];
    [star4 addTarget:self action:@selector(star1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    [star5 setTag:5];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star12.png"] forState:UIControlStateNormal];
    [star5 setBackgroundImage:[UIImage imageNamed:@"star22.png"] forState:UIControlStateSelected];
    [star5 addTarget:self action:@selector(star1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    
    
    
    
    
    
//
   
//    radiobutton2 = [[UIButton alloc] initWithFrame:CGRectMake(80, 80, 75, 75)];
//    [radiobutton2 setTag:1];
//    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"RBOff.png"] forState:UIControlStateNormal];
//    [radiobutton2 setBackgroundImage:[UIImage imageNamed:@"RBOn.png"] forState:UIControlStateSelected];
//    [radiobutton2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    [self.view addSubview:radiobutton1];
    [self.view addSubview:star1];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)star1Click:(id)sender
{
    switch ([sender tag]) {
        case 1:
            if([star1 isSelected]==YES)
            {
                [star1 setSelected:NO];
                [star2 setSelected:NO];
                [star3 setSelected:NO];
                [star4 setSelected:NO];
                [star5 setSelected:NO];

                
            }
            else
            {
                [star1 setSelected:YES];
                [star2 setSelected:NO];
                [star3 setSelected:NO];
                [star4 setSelected:NO];
                [star5 setSelected:NO];
                
            }
            
            break;
        case 2:
            if([star2 isSelected]==YES)
            {
                [star2 setSelected:NO];
                [star3 setSelected:NO];
                [star4 setSelected:NO];
                [star5 setSelected:NO];
            }
            else{
                [star2 setSelected:YES];
                [star3 setSelected:NO];
                [star4 setSelected:NO];
                [star5 setSelected:NO];

            }
            
            break;
            
        case 3:
            if([star3 isSelected]==YES)
            {
                
                [star3 setSelected:NO];
                [star4 setSelected:NO];
                [star5 setSelected:NO];
            }
            else{
                [star3 setSelected:YES];
                [star4 setSelected:NO];
                [star5 setSelected:NO];
                
            }
            
            break;
            
        case 4:
            if([star4 isSelected]==YES)
            {
                [star4 setSelected:NO];
                [star5 setSelected:NO];
            }
            else{
                [star4 setSelected:YES];
                [star5 setSelected:NO];

                
            }
            
            break;
        case 5:
            if([star5 isSelected]==YES)
            {
                [star5 setSelected:NO];
            }
            else{
                
                [star5 setSelected:YES];
                
            }
            
            break;
        default:
            break;
    }
   // self.star1.imageView.image=[UIImage imageNamed:@"star2.png"];
    
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
