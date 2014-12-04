//
//  NotificationViewController.m
//  Kidsi
//
//  Created by Ashok on 12/3/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()
{

   
    UIButton *button,*onlineButton;
    UISwitch *switch1;
    NSDictionary *notification;
    // NSMutableArray *notifiactionDis;
    NSArray *sectionName;
    
}
@end

@implementation NotificationViewController
@synthesize navigationItem,notificationTableView;

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
    
    UIView *view1=[[UIView alloc] initWithFrame:CGRectMake(0, 0,1024, 20)];
    view1.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:view1];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, 80, 44)];
    [btn setTitle:@"Home" forState:UIControlStateNormal];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btnBack setTintColor:[UIColor whiteColor]];
    [navigationItem setLeftBarButtonItem:btnBack];
    
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    sectionName=[[NSArray alloc]initWithObjects:@"Notification",@"Message Notification", nil];
    
    // notifiactionDis=[[NSMutableArray alloc]initWithObjects:@"",@"",@"",@"", nil];
    
    
    
    notification = @{@"Notification"         : @[@"Conversation Tones"],
                     @"Message Notification" : @[@"Notification Tone", @"Contact Ringtone",@"Vibrate:Default",@"Popup Notification",@"Light:White",]};
    

    
    // Do any additional setup after loading the view.
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




-(IBAction)backButton:(id)sender;
{
    [self.navigationController popViewControllerAnimated:YES];
}


///table view delegate and datasource methods
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
        NSString *sectionTitle1 = [sectionName objectAtIndex:section];
        NSArray *sectionNotification = [notification objectForKey:sectionTitle1];
        return [sectionNotification count];
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
           return [sectionName count];
   
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"Cell";
    UITableViewCell *cell=[notificationTableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
   if(cell==nil)
   {
     cell=[[UITableViewCell alloc]init];
   }
    //self.tableView.transform=CGAffineTransformMakeRotation(-M_PI*0.5);
    
    //if(cell==nil)
    // {//
    //onlineButton=[[UIButton alloc]initWithFrame:CGRectMake(220, 10, 40, 40)];
    
    //[onlineButton setUserInteractionEnabled:YES];
    
    
    //[onlineButton setBackgroundImage:[UIImage imageNamed:@"absent.png"] forState:UIControlStateNormal];
    // [onlineButton setBackgroundImage:[UIImage imageNamed:@"attend.png"] forState:UIControlStateHighlighted];
    //[onlineButton addTarget:self action:@selector(buttonSelected) forControlEvents:UIControlEventTouchUpInside];
    
    // }
    NSLog(@"w=%f,h=%f",cell
          .frame.size.width,cell.frame.size.height);
    tableView.tintColor=[UIColor purpleColor];
    // cell.textLabel.text=[NSString stringWithFormat:@"%@",[teacherList objectAtIndex:indexPath.row]];
    NSString *sectionTitle1 = [sectionName objectAtIndex:indexPath.section];
        
        NSArray *sectionAnimals = [notification objectForKey:sectionTitle1];
        NSString *animal = [sectionAnimals objectAtIndex:indexPath.row];
        cell.textLabel.text = animal;
        cell.detailTextLabel.text=@"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";
        cell.detailTextLabel.numberOfLines=3;
        cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
        //tableView.sectionHeaderHeight=50;
        cell.textLabel.font=[UIFont systemFontOfSize:17];
        switch1=[[UISwitch alloc]initWithFrame:CGRectMake(420,45, 40, 31)];
        [switch1 setContentMode:UIViewContentModeRight];
        cell.accessoryView=switch1;
        
        
    
    return cell;
    
}


-(void)buttonSelected
{
    if([onlineButton isHighlighted]==YES)
    {
        [onlineButton setHighlighted:NO];
        //[onlineButton setBackgroundImage:ui forState:<#(UIControlState)#>];
        
    }
    else
    {
        [onlineButton setHighlighted:YES];
    }
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // button.backgroundColor=[UIColor redColor];
    
}


/*
 - (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
 {
 //  return animalSectionTitles;
 return sectionName;
 }
 
 */


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    
    
        return [sectionName objectAtIndex:section];
    
}















@end
