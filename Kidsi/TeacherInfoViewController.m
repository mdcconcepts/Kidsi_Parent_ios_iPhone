//
//  TeacherInfoViewController.m
//  Kidsi
//
//  Created by Ashok on 11/5/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "TeacherInfoViewController.h"

@interface TeacherInfoViewController ()

@end

@implementation TeacherInfoViewController
@synthesize navigationItem,scrollView;
@synthesize star1,star2,star3,star4,star5;
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

    //Teacher's Ratting......
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
    
    
    
    //Back or home button on navigation bar with image...
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 80, 44)];
    [btn setTitle:@"Home" forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btnBack setTintColor:[UIColor whiteColor]];
    [navigationItem setLeftBarButtonItem:btnBack];
    

    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
    view.backgroundColor=[UIColor darkGrayColor];
    self.teacherInfoView.layer.cornerRadius=5.0f;
    self.contactView.layer.cornerRadius=5.0f;
    [self.view setBackgroundColor:[UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:1.0f]];
    [self.view addSubview:view];
    self.scrollView.scrollEnabled=TRUE;
    [self.scrollView addSubview:self.teacherInfoView];
    [self.scrollView addSubview:self.contactView];
    self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height+50);
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
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




-(void)backButton
{
    /////Share this app through ....facebook,mail,twitter...
    /*
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObjects:@"1",@"2", nil] applicationActivities:nil];
    
    // Removed un-needed activities
    activityVC.excludedActivityTypes = [[NSArray alloc] initWithObjects:
                                       // UIActivityTypeCopyToPasteboard,
                                        UIActivityTypePostToWeibo,
                                      //  UIActivityTypePostToFacebook,
                                      //  UIActivityTypeSaveToCameraRoll,
                                       // UIActivityTypeCopyToPasteboard,
                                       // UIActivityTypeMail,
                                      //  UIActivityTypeMessage,
                                        UIActivityTypeAssignToContact,
                                        nil];
    
    [self presentViewController:activityVC animated:YES completion:^{
        
    }];
     
     */
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
