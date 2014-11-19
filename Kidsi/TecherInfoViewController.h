//
//  TecherInfoViewController.h
//  Kidsi
//
//  Created by Ashok on 10/30/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TecherInfoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (weak, nonatomic) IBOutlet UIButton *star1;
@property (weak, nonatomic) IBOutlet UIButton *star2;

@property (weak, nonatomic) IBOutlet UIButton *star3;
@property (weak, nonatomic) IBOutlet UIButton *star4;
@property (weak, nonatomic) IBOutlet UIButton *star5;
- (IBAction)star1Click:(id)sender;

- (IBAction)backButton:(id)sender;
@end
