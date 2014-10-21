//
//  MenuViewController.m
//  Kidsi
//
//  Created by Ashok on 10/18/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "MenuViewController.h"
#import "ParentListCollectionViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize imageView;

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
    
    UIImageView *imageView1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loadbackground.png"]];
    imageView1.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    UIImageView *imageViewForLabel=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading.png"]];
    imageViewForLabel.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+340 ,imageView1.frame.origin.x+160 ,imageView1.frame.origin.y+25);
    [imageView1 addSubview:imageViewForLabel];
    indicator.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+400 ,imageView1.frame.origin.x+240 ,imageView1.frame.origin.y+103);
    [imageView1 addSubview:indicator];
    
    
    UIImageView *imageViewForLogo=[[UIImageView alloc]init];
    imageViewForLogo.image=[UIImage imageNamed:@"wunderbarlogo.png"];
    imageViewForLogo.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+210 ,imageView1.frame.origin.x+240 ,imageView1.frame.origin.y+103);
    [imageView1 addSubview:imageViewForLogo];
    [[self view] addSubview:imageView1];
    [[self view] bringSubviewToFront:imageView1];
    
   
    
    //now fade out splash image
    [UIView transitionWithView:self.view duration:2.0f options:UIViewAnimationOptionTransitionNone animations:^(void)
    {
        imageView1.alpha=0.0f;
        
    } completion:^(BOOL finished)
    {
        imageView1.hidden=TRUE;
        [imageView1 removeFromSuperview];
        [indicator stopAnimating];
        indicator.hidden=TRUE;
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)camera:(id)sender
{
    imageView.image=[UIImage imageNamed:@"livecamerabigimg.png"];
}

-(IBAction)health:(id)sender
{

    
    imageView.image=[UIImage imageNamed:@"healthbigimg.png"];
    
}

-(IBAction)performance:(id)sender
{
    imageView.image=[UIImage imageNamed:@"performancebigimg.png"];
}

-(IBAction)chat:(id)sender
{
    imageView.image=[UIImage imageNamed:@"chatbigimg.png"];
  //  ParentListCollectionViewController *parentListCollectionViewController=[[ParentListCollectionViewController alloc]init];
   // [self presentViewController:parentListCollectionViewController animated:YES completion:nil];
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
