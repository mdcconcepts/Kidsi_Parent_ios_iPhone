//
//  MenuViewController.m
//  Kidsi
//
//  Created by Ashok on 10/18/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "MenuViewController.h"
#import "ParentListCollectionViewController.h"
#import "SchoolInfoViewController.h"
#import "TecherInfoViewController.h"
#import "ParentProfileViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize imageView;
@synthesize menuDrawerWidth,menuDrawerX,openRecognizer,closeRecognizer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    return self;

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
    view.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:view];
       
    
    UIImageView *imageView1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG 02.png"]];
    imageView1.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.color=[UIColor orangeColor];
    [indicator startAnimating];
    UIImageView *imageViewForLabel=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading.png"]];
   // imageViewForLabel.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+340 ,imageView1.frame.origin.x+160 ,imageView1.frame.origin.y+25);
    imageViewForLabel.frame=CGRectMake(imageView1.frame.origin.x+120,imageView1.frame.origin.y+400 ,imageView1.frame.origin.x+100 ,imageView1.frame.origin.y+30);
    [imageView1 addSubview:imageViewForLabel];
    indicator.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+315 ,imageView1.frame.origin.x+240 ,imageView1.frame.origin.y+103);
    [imageView1 addSubview:indicator];
    
    
    UIImageView *imageViewForLogo=[[UIImageView alloc]init];
    imageViewForLogo.image=[UIImage imageNamed:@"MDC school.png"];
    imageViewForLogo.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+230 ,imageView1.frame.origin.x+240 ,imageView1.frame.origin.y+35);
    [imageView1 addSubview:imageViewForLogo];
    [[self view] addSubview:imageView1];
    [[self view] bringSubviewToFront:imageView1];
    
    
    
    //now fade out splash image
    [UIView transitionWithView:self.view duration:25.0f options:UIViewAnimationOptionTransitionNone animations:^(void)
     {
         //imageView1.alpha=0.0f;
        
         
     } completion:^(BOOL finished)
     {
          sleep(3);
         imageView1.hidden=TRUE;
         [imageView1 removeFromSuperview];
         [indicator stopAnimating];
         indicator.hidden=TRUE;
     }];
    
    

    
    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    int statusBarHeight=[UIApplication sharedApplication].statusBarFrame.size.height;
    
    int navigationBarHeight=44;
    statusBarHeight=statusBarHeight+navigationBarHeight;
    menuDrawerWidth=self.view.frame.size.width*0.25;
    menuDrawerX=self.view.frame.origin.x-menuDrawerWidth;
    menuDrawer=[[UIView alloc]initWithFrame:CGRectMake(menuDrawerX,self.view.frame.origin.y+statusBarHeight , menuDrawerWidth, self.view.frame.size.height-statusBarHeight)];
    
    
    menuDrawer.backgroundColor=[UIColor colorWithRed:0.15f green:0.25f blue:0.6f alpha:0.8f];
    
    closeRecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    openRecognizer=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipe:)];
    
    closeRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
    openRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:openRecognizer];
    [self.view addGestureRecognizer:closeRecognizer];
    
    
    [self.view addSubview:menuDrawer];
}

-(void)handleSwipe:(UISwipeGestureRecognizer *)recognizer
{
    [self drawerAnimation];
}

-(void)drawerAnimation
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:-5];

    CGFloat new_X=0;
    if(menuDrawer.frame.origin.x<self.view.frame.origin.x)
    {
        new_X=menuDrawer.frame.origin.x+menuDrawerWidth;
    }
    else
    {
        
        new_X=menuDrawer.frame.origin.x-menuDrawerWidth;
    }
    menuDrawer.frame=CGRectMake(new_X, menuDrawer.frame.origin.y, menuDrawer.frame.size.width, menuDrawer.frame.size.height);
    if(new_X>=0)
    {
        
        //school info...
        UIImageView *imageView2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"school info.png"]];
        imageView2.frame=CGRectMake(((new_X+menuDrawerWidth)/2)-25, menuDrawer.frame.origin.y+10, 50, 80);

         //UILabel *schoolInfo=[[UILabel alloc]initWithFrame:CGRectMake(((new_X+menuDrawerWidth)/2)-45, menuDrawer.frame.origin.y+75, 100, 30)];
        //schoolInfo.font=[UIFont systemFontOfSize:12];
        //schoolInfo.text=@"SCHOOL INFO.";
        //schoolInfo.textAlignment=NSTextAlignmentCenter;
        //schoolInfo.textColor=[UIColor whiteColor];
        //[menuDrawer addSubview:schoolInfo];
        
        UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(menu)];
        tapGesture.delegate=self;
        imageView2.userInteractionEnabled=TRUE;
        [imageView2 addGestureRecognizer:tapGesture];
        
        
        
        //Teacher info....
        UIImageView *imageView3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"teacher info.png"]];
        imageView3.frame=CGRectMake(((new_X+menuDrawerWidth)/2)-25, menuDrawer.frame.origin.y+110, 50, 80);
//        UILabel *teacherInfo=[[UILabel alloc]initWithFrame:CGRectMake(((new_X+menuDrawerWidth)/2)-45, menuDrawer.frame.origin.y+195, 100, 30)];
//        teacherInfo.textColor=[UIColor whiteColor];
//        teacherInfo.text=@"TEACHER INFO.";
//        teacherInfo.font=[UIFont systemFontOfSize:12];
//        teacherInfo.textAlignment=NSTextAlignmentCenter;
//        
//        [menuDrawer addSubview:teacherInfo];
        
        UITapGestureRecognizer *tapGesture1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(menu1)];
        tapGesture1.delegate=self;
        imageView3.userInteractionEnabled=TRUE;
        [imageView3 addGestureRecognizer:tapGesture1];
        
        
        //Parent info...
        
        UIImageView *imageView4=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"parent info.png"]];
        imageView4.frame=CGRectMake(((new_X+menuDrawerWidth)/2)-25, menuDrawer.frame.origin.y+210, 50, 80);
        
//        UILabel *management=[[UILabel alloc]initWithFrame:CGRectMake(((new_X+menuDrawerWidth)/2)-45, menuDrawer.frame.origin.y+315, 130, 30)];
//        management.textColor=[UIColor whiteColor];
//        management.text=@"PARENT PROFILE";
//        management.font=[UIFont systemFontOfSize:12];
//        management.textAlignment=NSTextAlignmentJustified;
//        [menuDrawer addSubview:management];
        UITapGestureRecognizer *tapGesture2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(menu2)];
        tapGesture2.delegate=self;
        imageView4.userInteractionEnabled=TRUE;
        [imageView4 addGestureRecognizer:tapGesture2];
        

        
        [menuDrawer addSubview:imageView2];
        [menuDrawer addSubview:imageView3];
        [menuDrawer addSubview:imageView4];
    }
    [UIView commitAnimations];
}

-(void)menu
{
    SchoolInfoViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"SchoolInfoViewController"];
   
    [self.navigationController pushViewController:m animated:YES];

}

-(void)menu1
{
    TecherInfoViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"TecherInfoViewController"];
    
    [self.navigationController pushViewController:m animated:YES];
    
}
-(void)menu2
{
    ParentProfileViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"ParentProfileViewController"];
    
    [self.navigationController pushViewController:m animated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidDisappear:(BOOL)animated
{
     [menuDrawer removeFromSuperview];
    [menuDrawer setHidden:TRUE];

}
-(IBAction)camera:(id)sender
{
    //imageView.image=[UIImage imageNamed:@"livecamerabigimg.png"];
}

-(IBAction)health:(id)sender
{

    
   // imageView.image=[UIImage imageNamed:@"healthbigimg.png"];
    
}

-(IBAction)performance:(id)sender
{
   // imageView.image=[UIImage imageNamed:@"performancebigimg.png"];
}

-(IBAction)chat:(id)sender
{
    //[[UINavigationBar  appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                      //                                     [UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObjectsAndKeys:
                                                                 [UIColor whiteColor], NSForegroundColorAttributeName,nil];
    //imageView.image=[UIImage imageNamed:@"chatbigimg.png"];
  //  ParentListCollectionViewController *parentListCollectionViewController=[[ParentListCollectionViewController alloc]init];
   // [self presentViewController:parentListCollectionViewController animated:YES completion:nil];
}


-(IBAction)MenuButon:(id)sender
{

    [self drawerAnimation];
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
