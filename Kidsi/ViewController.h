//
//  ViewController.h
//  Kidsi
//
//  Created by Ashok on 10/18/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,weak)IBOutlet UITextField *userNameTextField;
@property(nonatomic,weak)IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewForVehical;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewForStudent;

@property (weak, nonatomic) IBOutlet UIImageView *imageForStudentLogo;

-(IBAction)login:(id)sender;
@end
