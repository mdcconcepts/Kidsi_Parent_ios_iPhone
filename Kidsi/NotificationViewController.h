//
//  NotificationViewController.h
//  Kidsi
//
//  Created by Ashok on 12/3/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationItem;
@property (weak, nonatomic) IBOutlet UITableView *notificationTableView;

@end
