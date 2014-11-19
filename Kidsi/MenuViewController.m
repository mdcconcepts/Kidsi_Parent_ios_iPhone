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
#import "healthViewController.h"
#import "performanceViewController.h"
#import "TeacherInfoViewController.h"
#import "MyProfileViewController.h"

@interface MenuViewController ()
{
    UIImageView *imageViewForVehical;
    UIImageView *imageViewForStudent;
}
@end

@implementation MenuViewController
@synthesize imageView;
@synthesize menuDrawerWidth,menuDrawerX,openRecognizer,closeRecognizer,HealthButton;
@synthesize chatButton,performanceButton,liveStreamButton;
@synthesize shadowHeathImageView;
@synthesize indicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        //1)Activity indicator initilization...
         indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
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
    //sattus bar......
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,320, 20)];
    view.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:view];
       
    //background image of loading Screen...
     imageView1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BG 02.png"]];
    imageView1.frame=CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    
    //activity indicator....
    indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.color=[UIColor orangeColor];
    [indicator startAnimating];
    
    
    imageViewForLabel=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading.png"]];
   // imageViewForLabel.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+340 ,imageView1.frame.origin.x+160 ,imageView1.frame.origin.y+25);
    
    imageViewForLabel.frame=CGRectMake(imageView1.frame.origin.x+120,imageView1.frame.origin.y+350 ,imageView1.frame.origin.x+120 ,imageView1.frame.origin.y+30);
    [imageView1 addSubview:imageViewForLabel];
    
    //assign of indicator.....
    indicator.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+265 ,imageView1.frame.origin.x+240 ,imageView1.frame.origin.y+103);
    [imageView1 addSubview:indicator];
    
    
   imageViewForLogo=[[UIImageView alloc]init];
    imageViewForLogo.image=[UIImage imageNamed:@"MDC school.png"];
    imageViewForLogo.frame=CGRectMake(imageView1.frame.origin.x+40,imageView1.frame.origin.y+180 ,imageView1.frame.origin.x+240 ,imageView1.frame.origin.y+30);
    [imageView1 addSubview:imageViewForLogo];
    [[self view] addSubview:imageView1];
    [[self view] bringSubviewToFront:imageView1];
    
    imageViewForVehical=[[UIImageView alloc]initWithFrame:CGRectMake(0, 525, 40, 28)];
    imageViewForVehical.image=[UIImage imageNamed:@"to_school.png"];
    [imageView1 addSubview:imageViewForVehical];
    imageViewForStudent=[[UIImageView alloc]initWithFrame:CGRectMake(180, 533, 40, 20)];
    imageViewForStudent.image=[UIImage imageNamed:@"kids.png"];
    //now fade out splash image...
    [UIView transitionWithView:self.view duration:5.0f options:UIViewAnimationOptionTransitionNone animations:^(void)
     {
        
         [UIView transitionWithView:imageViewForVehical
                           duration:5.0f
                            options:UIViewAnimationOptionLayoutSubviews                   animations:^{
                                
                                imageViewForVehical.frame=CGRectMake(imageViewForVehical.frame.origin.x+130, imageViewForVehical.frame.origin.y, imageViewForVehical.frame.size.width, imageViewForVehical.frame.size.height);
                                // self.imageViewForVehical.alpha=0.4;
                                
                            } completion:^(BOOL finished){
                                
                                sleep(1);
                                 //imageViewForStudent.image=[UIImage imageNamed:@"kids.png"];
                                //sleep(10);
                                // imageViewForStudent.image=[UIImage imageNamed:@"kid.png"];
                              //  [imageView1 addSubview:imageViewForStudent];
                                // HealthButton.alpha=0.0f;
                                // [shadowHeathImageView setAlpha:1.0f];
                                /* [UIView beginAnimations:nil context:nil];
                                 [UIView setAnimationDuration:0.4];
                                 [UIView setAnimationDelay:0.2];
                                 [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                                 imageViewForVehical.frame=CGRectMake(imageViewForVehical.frame.origin.x+300, imageViewForVehical.frame.origin.y, imageViewForVehical.frame.size.width, imageViewForVehical.frame.size.height);
                                 */
                                
                                imageView1.hidden=TRUE;
                               // MenuViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"MenuViewController"];
                                ///[self.navigationController pushViewController:m animated:YES];
                                
                                
                                
                            }];
         //imageView1.alpha=0.0f;
        
         
     } completion:^(BOOL finished)
     {
         sleep(5);
         
        // imageViewForStudent.image=[UIImage imageNamed:@"kids.png"];
         [imageView1 addSubview:imageViewForStudent];
        // imageView1.hidden=TRUE;
        // [imageView1 removeFromSuperview];
         [indicator stopAnimating];
         indicator.hidden=TRUE;
     }];
    
    
    [liveStreamButton setTag:1];
    [liveStreamButton setBackgroundImage:[UIImage imageNamed:@"camera-1.png"] forState:UIControlStateNormal];
    [liveStreamButton setBackgroundImage:[UIImage imageNamed:@"camera down.png"] forState:UIControlStateHighlighted];
    [liveStreamButton addTarget:self action:@selector(camera:) forControlEvents:UIControlEventTouchDown];

    
    [HealthButton setTag:2];
    [HealthButton setBackgroundImage:[UIImage imageNamed:@"health.png"] forState:UIControlStateNormal];
    [HealthButton setBackgroundImage:[UIImage imageNamed:@"health down.png"] forState:UIControlStateHighlighted];
    [HealthButton addTarget:self action:@selector(camera:) forControlEvents:UIControlEventTouchUpInside];
    

    
    [chatButton setTag:3];
    [chatButton setBackgroundImage:[UIImage imageNamed:@"chat.png"] forState:UIControlStateNormal];
    [chatButton setBackgroundImage:[UIImage imageNamed:@"chat down.png"] forState:UIControlStateHighlighted];
    [chatButton addTarget:self action:@selector(camera:) forControlEvents:UIControlEventTouchUpInside];
    


    
    [performanceButton setTag:4];
    [performanceButton setBackgroundImage:[UIImage imageNamed:@"performance.png"] forState:UIControlStateNormal];
    [performanceButton setBackgroundImage:[UIImage imageNamed:@"performance down.png"] forState:UIControlStateHighlighted];
    [performanceButton addTarget:self action:@selector(camera:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{

    
    
}



-(void)viewWillAppear:(BOOL)animated
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
    TeacherInfoViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"TeacherInfoViewController"];
    
    [self.navigationController pushViewController:m animated:YES];
    
}
-(void)menu2
{
    MyProfileViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"MyProfileViewController"];
    
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
    
    switch ([sender tag])
    {
        case 1:
            if([liveStreamButton isHighlighted]==YES)
                [liveStreamButton setHighlighted:NO];
            else
                [liveStreamButton setHighlighted:YES];
                
            break;
            
        case 2:
        {
            if([HealthButton isHighlighted]==YES)
                [HealthButton setHighlighted:NO];
            else
                [HealthButton setHighlighted:YES];
            
            healthViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"healthViewController"];
            [self.navigationController pushViewController:m animated:YES];
        }
            break;

            
        case 3:
        {
            if([chatButton isHighlighted]==YES)
                [chatButton setHighlighted:NO];
            else
                [chatButton setHighlighted:YES];
        
            ParentListCollectionViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"ParentListCollectionViewController"];
            [self.navigationController pushViewController:m animated:YES];
        }

            break;

            
        case 4:
        {
            
            if([performanceButton isHighlighted]==YES)
                [performanceButton setHighlighted:NO];
            else
                [performanceButton setHighlighted:YES];
            
            performanceViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"performanceViewController"];
            [self.navigationController pushViewController:m animated:YES];

        }
            break;
            
            
        default:
            break;
    }
    
    
    //if(liveStreamButton.selected)
    //    liveStreamButton.selected=FALSE;
    /*
    [UIView transitionWithView:liveStreamButton
                      duration:0.3f
                       options:UIViewAnimationOptionTransitionCrossDissolve                   animations:^{
                           
                           liveStreamButton.frame=CGRectMake(liveStreamButton.frame.origin.x, liveStreamButton.frame.origin.y-25, liveStreamButton.frame.size.width, liveStreamButton.frame.size.height);
                           //self.shadowHeathImageView.alpha=0.4;
                           // HealthButton.imageView.image=[UIImage imageNamed:@"health.png"];
                           
                       } completion:^(BOOL finished){
                           // HealthButton.alpha=0.0f;
                           //[self.shadowHeathImageView setAlpha:1.0f];
                           [UIView beginAnimations:nil context:nil];
                           [UIView setAnimationDuration:0.4];
                           [UIView setAnimationDelay:0.2];
                           [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                           liveStreamButton.frame=CGRectMake(liveStreamButton.frame.origin.x, liveStreamButton.frame.origin.y+25, liveStreamButton.frame.size.width, liveStreamButton.frame.size.height);
                           
                           
                       }];
     */

    //imageView.image=[UIImage imageNamed:@"livecamerabigimg.png"];
}

-(IBAction)health:(id)sender
{
    /*
    if(HealthButton.selected)
        HealthButton.selected=FALSE;
    
    [UIView transitionWithView:HealthButton
                      duration:0.3f
                       options:UIViewAnimationOptionLayoutSubviews                   animations:^{
                        
                        HealthButton.frame=CGRectMake(HealthButton.frame.origin.x, HealthButton.frame.origin.y+25, HealthButton.frame.size.width, HealthButton.frame.size.height);
                           self.shadowHeathImageView.alpha=0.4;
                       
                    } completion:^(BOOL finished){
                       // HealthButton.alpha=0.0f;
                        [self.shadowHeathImageView setAlpha:1.0f];
                        [UIView beginAnimations:nil context:nil];
                        [UIView setAnimationDuration:0.4];
                        [UIView setAnimationDelay:0.2];
                        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                        HealthButton.frame=CGRectMake(HealthButton.frame.origin.x, HealthButton.frame.origin.y-25, HealthButton.frame.size.width, HealthButton.frame.size.height);
                     
                        
                        
                    
                    }];
    
   // imageView.image=[UIImage imageNamed:@"healthbigimg.png"];
     */
    
}

-(IBAction)performance:(id)sender
{
    
    /*if(performanceButton.selected)
        performanceButton.selected=FALSE;
    
    [UIView transitionWithView:performanceButton
                      duration:0.3f
                       options:UIViewAnimationOptionTransitionCrossDissolve                   animations:^{
                           
                           performanceButton.frame=CGRectMake(performanceButton.frame.origin.x, performanceButton.frame.origin.y-25, performanceButton.frame.size.width, performanceButton.frame.size.height);
                           //self.shadowHeathImageView.alpha=0.4;
                           // HealthButton.imageView.image=[UIImage imageNamed:@"health.png"];
                           
                       } completion:^(BOOL finished){
                           // HealthButton.alpha=0.0f;
                           //[self.shadowHeathImageView setAlpha:1.0f];
                           [UIView beginAnimations:nil context:nil];
                           [UIView setAnimationDuration:0.4];
                           [UIView setAnimationDelay:0.2];
                           [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                           performanceButton.frame=CGRectMake(performanceButton.frame.origin.x, performanceButton.frame.origin.y+25, performanceButton.frame.size.width, performanceButton.frame.size.height);
                           
                           
                           }];*/

    // imageView.image=[UIImage imageNamed:@"performancebigimg.png"];
}

-(IBAction)chat:(id)sender
{
    //[[UINavigationBar  appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                      //                                     [UIColor whiteColor], NSForegroundColorAttributeName,nil]];
    /*
    
    if(chatButton.selected)
        chatButton.selected=FALSE;
    
    [UIView transitionWithView:chatButton
                      duration:0.3f
                       options:UIViewAnimationOptionLayoutSubviews                   animations:^{
                           
                           chatButton.frame=CGRectMake(chatButton.frame.origin.x, chatButton.frame.origin.y-25, chatButton.frame.size.width, chatButton.frame.size.height);
                          // self.shadowHeathImageView.alpha=0.4;
                           // HealthButton.imageView.image=[UIImage imageNamed:@"health.png"];
                           
                       } completion:^(BOOL finished){
                           // HealthButton.alpha=0.0f;
                          // [self.shadowHeathImageView setAlpha:1.0f];
                           [UIView beginAnimations:nil context:nil];
                           [UIView setAnimationDuration:0.4];
                           [UIView setAnimationDelay:0.2];
                           [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
                           chatButton.frame=CGRectMake(chatButton.frame.origin.x, chatButton.frame.origin.y+25, chatButton.frame.size.width, chatButton.frame.size.height);
                           
                           ParentListCollectionViewController *m=[self.storyboard instantiateViewControllerWithIdentifier:@"ParentListCollectionViewController"];
                           [self.navigationController pushViewController:m animated:YES];

                           
                       }];
   
    
    */
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


-(void)dealloc
{
    [UIView setAnimationsEnabled:FALSE];
}

@end
