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

}


@property(readonly,nonatomic)UISwipeGestureRecognizer *openRecognizer,*closeRecognizer;
@property(readonly,nonatomic)int menuDrawerX,menuDrawerWidth;



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
