//
//  MenuViewController.h
//  Kidsi
//
//  Created by Ashok on 10/18/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController<UIGestureRecognizerDelegate,UINavigationBarDelegate>
{
    UIView *menuDrawer;
    UIImageView *imageViewforSchoolInfo;
    UIImageView *imageViewforTeacherInfo;
    UIImageView *imageViewforMyProfile;
    UIImageView *imageView1;
    UIImageView *imageViewForLogo;
    UIImageView *imageViewForLabel;
 
}



@property (weak, nonatomic) IBOutlet UIImageView *shadowHeathImageView;

@property(readonly,nonatomic)UISwipeGestureRecognizer *openRecognizer,*closeRecognizer;
@property(readonly,nonatomic)int menuDrawerX,menuDrawerWidth;

@property (weak, nonatomic) IBOutlet UIButton *HealthButton;

@property (weak, nonatomic) IBOutlet UIButton *liveStreamButton;

@property (weak, nonatomic) IBOutlet UIButton *performanceButton;

@property (weak, nonatomic) IBOutlet UIButton *chatButton;

@property (strong, nonatomic) UIActivityIndicatorView *indicator;

-(id)init;
- (IBAction)MenuButon:(id)sender;
-(void)handleSwipe:(UISwipeGestureRecognizer *)recognizer;
-(void)drawerAnimation;


@property(nonatomic,weak)IBOutlet UIImageView *imageView;
-(IBAction)camera:(id)sender;
-(IBAction)health:(id)sender;
-(IBAction)performance:(id)sender;
-(IBAction)chat:(id)sender;
@end
