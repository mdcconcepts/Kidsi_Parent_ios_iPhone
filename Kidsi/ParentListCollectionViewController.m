//
//  ParentListCollectionViewController.m
//  Kidsi
//
//  Created by Ashok on 10/20/14.
//  Copyright (c) 2014 MDC Concepts. All rights reserved.
//

#import "ParentListCollectionViewController.h"

@interface ParentListCollectionViewController ()

@end

@implementation ParentListCollectionViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    return true;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier=@"Cell";
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    UIImageView *imageView=[[UIImageView alloc]init];
    cell.backgroundColor=[UIColor colorWithRed:0.1f green:0.13f blue:0.48f alpha:1.0f];
    cell.layer.borderColor=[UIColor brownColor].CGColor;
    cell.layer.borderWidth=1.0f;
    
    //tomake cell border rectangular...
    cell.layer.cornerRadius=5.0f;
    if((indexPath.row)%2==0)
    {
        imageView.image=[UIImage imageNamed:@"chatlogoc.png"];
    }
    if((indexPath.row)%2!=0)
    {
        imageView.image=[UIImage imageNamed:@"chatlogod.png"];
    
    }
    imageView.frame=CGRectMake(cell.contentView.frame.origin.x+10, cell.contentView.frame.origin.y+10, cell.contentView.frame.origin.x+80, cell.contentView.frame.origin.y+70);
    
   // imageView.frame=cell.contentView.frame;
   UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(cell.contentView.frame.origin.x+10, cell.contentView.frame.origin.y+70,cell.contentView.frame.size.width-10, cell.contentView.frame.size.height-80)];
    label.text=@"Mr.Divate";
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:12];
    [cell addSubview: label];
    [cell addSubview:imageView];
    
    //Label for mobile number...
    UILabel *labelForMobileNo=[[UILabel alloc]initWithFrame:CGRectMake(cell.contentView.frame.origin.x+10, cell.contentView.frame.origin.y+90,cell.contentView.frame.size.width-10, cell.contentView.frame.size.height-80)];
    labelForMobileNo.text=@"9623456756";
    labelForMobileNo.textColor=[UIColor whiteColor];
    labelForMobileNo.font=[UIFont systemFontOfSize:12];
    [cell addSubview: labelForMobileNo];
    [cell addSubview:imageView];

    
    
    
    
    UIImageView *imageViewForOnline=[[UIImageView alloc] init];
    imageViewForOnline.image=[UIImage imageNamed:@"onlinedot.png"];
    imageViewForOnline.frame=CGRectMake(cell.contentView.frame.origin.x+85, cell.contentView.frame.origin.y+115,cell.contentView.frame.size.width-90, cell.frame.size.height-120);
    [cell addSubview:imageViewForOnline];
    return cell;
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
