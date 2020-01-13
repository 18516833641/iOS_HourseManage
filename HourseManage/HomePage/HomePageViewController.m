//
//  HomePageViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageCollectionViewCell.h"
#import "rukuViewController.h"

@interface HomePageViewController ()



@property (weak, nonatomic) IBOutlet UIView *scrollerView;

@property (weak, nonatomic) IBOutlet UIView *bigView;

@property (weak, nonatomic) IBOutlet UIView *smallViewOne;

@property (weak, nonatomic) IBOutlet UIView *smallViewTwo;

@property (weak, nonatomic) IBOutlet UICollectionView *UICollectionView;

@property (nonatomic,strong)UICollectionViewFlowLayout * CustomLayout;


@property (nonatomic,strong)NSArray                    * nameArr;

@property (nonatomic,strong)NSArray                    * IconArrl;




@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"仓储管理";
    
    _nameArr=@[@"入库订单管理",@"入库门禁管理",@"入库作业信息接受",@"入库质检管理",@"入库信息确认",@"库存管理",@"库内管理",@"库存作业信息接受",@"库存信息确认",@"出库订单管理",@"出库门禁管理",@"出库作业信息接受",@"出库信息确认"];
    _IconArrl=@[@"img_1",@"img_2-1",@"img_3-1",@"img_4",@"img_5",@"img_1-1",@"img_2-2",@"img_3-1",@"img_4-1",@"img_1",@"img_2-1",@"img_3-1",@"img_4-1"];
    
    _CustomLayout=[[UICollectionViewFlowLayout alloc]init];
    self.UICollectionView.collectionViewLayout = _CustomLayout;
    [self.UICollectionView registerNib:[UINib nibWithNibName:@"HomePageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomePageCollectionViewCell"];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"12313");

    [self showTabBar];
}


- (IBAction)bigviewAction:(id)sender {
    
    rukuViewController * vc = [[rukuViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = @"入库管理";
    vc.state = ruku;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (IBAction)smallViewAction:(id)sender {
    rukuViewController * vc = [[rukuViewController alloc]init];
    vc.title = @"库内管理";
    vc.state = kunei;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)smallViewTwoAction:(id)sender {
    rukuViewController * vc = [[rukuViewController alloc]init];
    vc.title = @"出库管理";
    vc.state = chuku;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ======UICollectionView Delegate

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 13;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomePageCollectionViewCell* cell = [self.UICollectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionViewCell"forIndexPath:indexPath];
    cell.label.text=[NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.iamge.image=[UIImage imageNamed:_IconArrl[indexPath.item]];
//    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat CellWidth = Screen_Width / 5;
    
    return CGSizeMake(CellWidth+5,CellWidth+5);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 10, 5, 10);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    rukuViewController * vc = [[rukuViewController alloc]init];
    
    switch (indexPath.row) {
            
           case 0:case 1:case 2:case 3:case 4:
            vc.state = ruku;
            vc.title = @"入库管理列表";
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
                       break;
            
            case 5:case 6:case 7:case 8:
            vc.state = kunei;
            vc.title = @"库内管理列表";
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
                       break;
            
            case 9:case 10:case 11:case 12:
            vc.state = chuku;
            vc.title = @"出库管理列表";
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
                       break;
           
            
        default:
            break;
    }
   
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//设置垂直间距,默认的垂直和水平间距都是10
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//设置水平间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
