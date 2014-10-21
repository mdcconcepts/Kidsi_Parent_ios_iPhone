//
//  MenuViewController.h
//  Kidsi
//
//  Created by Ashok on 10/18/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController


@property(nonatomic,weak)IBOutlet UIImageView *imageView;
-(IBAction)camera:(id)sender;
-(IBAction)health:(id)sender;
-(IBAction)performance:(id)sender;
-(IBAction)chat:(id)sender;
@end
