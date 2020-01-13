//
//  rukuViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "rukuViewController.h"
#import "HomePageCollectionViewCell.h"
#import "BaseTableViewCell.h"
#import "DetailsViewController.h"
#import "HomeModel.h"
#import "LoginViewController.h"
#import "rukuDetaileViewController.h"
//#import "KuneiDetaileViewController.h"
//#import "chukuDetaileViewController.h"
#import "rukuDetaileListViewController.h"


@interface rukuViewController ()
{
    int _page;
    int _reload;
}



@property (weak, nonatomic) IBOutlet UICollectionView * collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionConstraints;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewConstraints;

@property (nonatomic,strong)UICollectionViewFlowLayout * CustomLayout;

@property (nonatomic,strong)NSArray                    * nameArr;

@property (nonatomic,strong)NSArray                    * IconArrl;



@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *ontButton;
@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet UIButton *threeButton;

@property (weak, nonatomic) IBOutlet UITableView * uitableView;
@property(nonatomic,strong)NSMutableArray      * dataSource;
@property(nonatomic,strong)NSDictionary        * parameters;
@property(nonatomic,strong)NSString            * urlString;

#pragma mark === 搜索
@property (weak, nonatomic) IBOutlet UIView *serchView;

@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoLabel;
@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@property (weak, nonatomic) IBOutlet UITextField *oneTextField;
@property (weak, nonatomic) IBOutlet UITextField *twoTextField;
@property (weak, nonatomic) IBOutlet UITextField *threeTextFiled;
@property (weak, nonatomic) IBOutlet UILabel *fourtextLabel;
@property (weak, nonatomic) IBOutlet UIButton *fourbutton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textfiledViewHeight;


@property (weak, nonatomic) IBOutlet UIStackView *textViewFiled;
@property (nonatomic,strong)RZCarPlateNoTextField*CarPlate;



@property (weak, nonatomic) IBOutlet UIImageView *nodataImage;

@property (nonatomic,copy)NSString            * WDTStatus;//


@end

@implementation rukuViewController

- (void)viewDidLoad {
    
    _page=1;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self setTableView];
//    [self SetJXCategoryView];
    _WDTStatus = [NSString stringWithFormat:@"%@",@"0"];
    
    
    _CarPlate = [[RZCarPlateNoTextField alloc] init];
    _CarPlate.frame = _threeTextFiled.frame;
    _CarPlate.rz_maxLength = 0;  // 最大输入长度 （0 不限制）
    _CarPlate.rz_checkCarPlateNoValue = YES;  // 是否需要校验车牌号输入规则
    _CarPlate.rz_regexPlateNoIfYouNeed = ^NSString * _Nonnull(NSString * _Nonnull text) {
        // 你的校验方法,
        return text;
    };
    __weak typeof(self) weakSelf = self;
    _CarPlate.rz_textFieldEditingValueChanged = ^(RZCarPlateNoTextField * _Nonnull textField) {
        weakSelf.threeTextFiled.placeholder = @"";
        
        NSLog(@"输入变化回调：%@", weakSelf.CarPlate.text);
        
    };
    
    if (_CarPlate.text == nil) {
        _threeTextFiled.placeholder = @"请输入车牌号";
    }
    
    [_CarPlate rz_changeKeyBoard:YES]; // 代码控制显示字母 （YES：省份）
    [_textViewFiled addSubview:_CarPlate];
    
   
    
    switch (_state) {
        case ruku:
        _nameArr=@[@"入库订单管理",@"入库门禁管理",@"作业信息接受",@"入库质检管理",@"入库信息确认"];
            _IconArrl=@[@"img_1",@"img_2-1",@"img_3-1",@"img_4",@"img_5"];
            _collectionConstraints.constant = 200;
            _tableviewConstraints.constant = -60;
            _titleView.hidden = YES;
            _titleView.hidden = YES;
            _collectionConstraints.constant = 200;
            _tableviewConstraints.constant = -60;
            _parameters=@{
                          @"page":[NSString stringWithFormat:@"%d",_page],
                          @"limit":@"10",
                          @"orderType":@"0",//出库1 入库0
                          @"orderNo":@"",//搜索
                          @"companyName":@"",//搜索
              };
              _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
            [self postService:8];
            break;
        case kunei:
            _nameArr=@[@"库存管理",@"库内管理",@"作业信息接受",@"作业信息确认"];
            _IconArrl=@[@"img_1-1",@"img_2-2",@"img_3-1",@"img_4-1"];
            _titleView.hidden = YES;
            _collectionConstraints.constant = 100;
            _tableviewConstraints.constant = -60;
            _parameters=@{//库存管理
                           @"page":[NSString stringWithFormat:@"%d",_page],
                           @"limit":@"10",
                           @"orderNo":@"",//搜索
                           @"companyName":@"",//搜索
                               };
           _urlString = [NSString stringWithFormat:@"%@/api/wms/stock/getPageByCondition",Url_Sever];
           [self GETService:4];
            
            break;
        case chuku:
            _nameArr=@[@"出库订单管理",@"出库门禁管理",@"作业信息接受",@"出库信息确认"];
            _IconArrl=@[@"img_1",@"img_2-1",@"img_3-1",@"img_4-1"];
            _collectionConstraints.constant = 100;
            _tableviewConstraints.constant = 0;
            _threeLabel.hidden = YES;
            _threeTextFiled.hidden = YES;
            _textfiledViewHeight.constant = 220;
            _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"orderType":@"1",//出库1 入库0
                                @"orderNo":@"",//搜索
                                @"companyName":@"",//搜索
                                };
            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
            _titleView.hidden = YES;
            _collectionConstraints.constant = 100;
            _tableviewConstraints.constant = -60;
            [self postService:0];
            
            
            break;
            
        default:
            break;
    }
    
    [self Refresh];
         
    [self Loading];
    
    _CustomLayout=[[UICollectionViewFlowLayout alloc]init];
    _collectionView.collectionViewLayout = _CustomLayout;
    [_collectionView registerNib:[UINib nibWithNibName:@"HomePageCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HomePageCollectionViewCell"];
    
    [self UInavigationController];
  
    
}
#pragma MARK :暂无数据
- (IBAction)noDataImageAction:(id)sender {
    
    
    
}


-(void)viewDidDisappear:(BOOL)animated
{
    [SVProgressHUD dismiss];
}

-(void)AllocdataSource
{
    if (!_dataSource) {
        _dataSource=[[NSMutableArray alloc]init];
    }
}

- (IBAction)ontButtonAction:(id)sender {
    _ontButton.backgroundColor = NavigationColor_RGB;
    [_ontButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    
    _twoButton.backgroundColor = UIColor.whiteColor;
    _twoButton.titleLabel.textColor = UIColor.lightGrayColor;
    
    _threeButton.backgroundColor = UIColor.whiteColor;
    _threeButton.titleLabel.textColor = UIColor.lightGrayColor;
    
    
    switch (_state) {
        case ruku:
        {
            switch ([_WDTStatus intValue]) {
                case 2://已派单
                    {
                        _parameters=@{
                                    @"page":[NSString stringWithFormat:@"%d",_page],
                                    @"limit":@"10",
                                    @"total":@"0",
                                    @"orderType":@"0",//出库1 入库0
                                    @"deleteFlag":@"0",
                                    @"status":@"0",
                                    @"inoutId":@"",//搜索
                                    @"driverPlateNo":@"",//搜索
                                    @"driverPhone":@"",//搜索
                                    };
                        _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
                        [self postService:10];
                    }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
            
        case kunei:
        {
            switch ([_WDTStatus intValue]) {
                       case 1:
                           {
                           _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"type":@"0",
                                           @"oldStorageNo":@"",//搜索
                                           @"shipperName":@"",//搜索
                                           @"stockOrderNo":@"",//搜索
                                               };
                           _urlString = [NSString stringWithFormat:@"%@/api/wms/stockManage/getPageByCondition",Url_Sever];
                           [self GETService:5];
                           }
                           break;
                    
                    case 2:
                    {
                    _parameters=@{
                                    @"page":[NSString stringWithFormat:@"%d",_page],
                                    @"limit":@"10",
                                    @"total":@"0",
                                    @"driverPlateNo":@"",//搜索
                                    @"driverPhone":@"",//搜索
                                    @"orderType":@"",//搜索
                                    @"status":@"",//搜索
                                    @"inoutId":@"",//搜索
                                        };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                    [self GETService:6];
                    }
                    break;
                    
                    case 3:
                    {
                    _parameters=@{
                                    @"page":[NSString stringWithFormat:@"%d",_page],
                                    @"limit":@"10",
                                    @"total":@"0",
                                    @"driverPlateNo":@"",//搜索
                                    @"driverPhone":@"",//搜索
                                    @"orderType":@"",//搜索
                                    @"status":@"",//搜索
                                    @"inoutId":@"",//搜索
                                        };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                    [self GETService:7];
                    }
                    break;
                           
                       default:
                           break;
                           }
            
        }
            break;
            
        case chuku:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
    
}

- (IBAction)twoButtonAction:(id)sender {
    
    _ontButton.backgroundColor = UIColor.whiteColor;
    _ontButton.titleLabel.textColor = UIColor.lightGrayColor;
    
    _twoButton.backgroundColor = NavigationColor_RGB;
    [_twoButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    
    _threeButton.backgroundColor = UIColor.whiteColor;
    _threeButton.titleLabel.textColor = UIColor.lightGrayColor;
    
    switch (_state) {
            case ruku:
            {
                switch ([_WDTStatus intValue]) {
                    case 2:
                        {
                            NSLog(@"作业信息接受");
                            _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"total":@"0",
                                        @"orderType":@"0",//出库1 入库0
                                        @"deleteFlag":@"0",
                                        @"status":@"1",
                                        @"inoutId":@"",//搜索
                                        @"driverPlateNo":@"",//搜索
                                        @"driverPhone":@"",//搜索
                                        };
                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
                            [self postService:10];
                        }
                        break;
                        
                    default:
                        break;
                }
                
            }
                break;
                
            case kunei:
            {
                switch ([_WDTStatus intValue]) {
                           case 1:
                               {
                               _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                               @"type":@"0",
                                               @"oldStorageNo":@"",//搜索
                                               @"shipperName":@"",//搜索
                                               @"stockOrderNo":@"",//搜索
                                                   };
                               _urlString = [NSString stringWithFormat:@"%@/api/wms/stockManage/getPageByCondition",Url_Sever];
                               [self GETService:5];
                               }
                               break;
                        
                        case 2:
                        {
                        _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"total":@"0",
                                        @"driverPlateNo":@"",//搜索
                                        @"driverPhone":@"",//搜索
                                        @"orderType":@"",//搜索
                                        @"status":@"",//搜索
                                        @"inoutId":@"",//搜索
                                            };
                        _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                        [self GETService:6];
                        }
                        break;
                        
                        case 3:
                        {
                        _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"total":@"0",
                                        @"driverPlateNo":@"",//搜索
                                        @"driverPhone":@"",//搜索
                                        @"orderType":@"",//搜索
                                        @"status":@"",//搜索
                                        @"inoutId":@"",//搜索
                                            };
                        _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                        [self GETService:7];
                        }
                        break;
                               
                           default:
                               break;
                               }
                
            }
                break;
                
            case chuku:
            {
                
            }
                break;
                
            default:
                break;
        }
    
    
}
- (IBAction)threeButtonAction:(id)sender {
    
    _ontButton.backgroundColor = UIColor.whiteColor;
    _ontButton.titleLabel.textColor = UIColor.lightGrayColor;
    
    _twoButton.backgroundColor = UIColor.whiteColor;
    _twoButton.titleLabel.textColor = UIColor.lightGrayColor;
    
    _threeButton.backgroundColor = NavigationColor_RGB;
    [_threeButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    
    
    
    switch (_state) {
            case ruku:
            {
                switch ([_WDTStatus intValue]) {
                    case 2:
                        {
                            NSLog(@"作业信息接受");
                            _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"total":@"0",
                                        @"orderType":@"0",//出库1 入库0
                                        @"deleteFlag":@"0",
                                        @"status":@"2",
                                        @"inoutId":@"",//搜索
                                        @"driverPlateNo":@"",//搜索
                                        @"driverPhone":@"",//搜索
                                        };
                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
                            [self postService:10];
                        }
                        break;
                        
                    default:
                        break;
                }
                
            }
                break;
                
            case kunei:
            {
                switch ([_WDTStatus intValue]) {
                           case 1:
                               {
                               _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                               @"type":@"0",
                                               @"oldStorageNo":@"",//搜索
                                               @"shipperName":@"",//搜索
                                               @"stockOrderNo":@"",//搜索
                                                   };
                               _urlString = [NSString stringWithFormat:@"%@/api/wms/stockManage/getPageByCondition",Url_Sever];
                               [self GETService:5];
                               }
                               break;
                        
                        case 2:
                        {
                        _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"total":@"0",
                                        @"driverPlateNo":@"",//搜索
                                        @"driverPhone":@"",//搜索
                                        @"orderType":@"",//搜索
                                        @"status":@"",//搜索
                                        @"inoutId":@"",//搜索
                                            };
                        _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                        [self GETService:6];
                        }
                        break;
                        
                        case 3:
                        {
                        _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"total":@"0",
                                        @"driverPlateNo":@"",//搜索
                                        @"driverPhone":@"",//搜索
                                        @"orderType":@"",//搜索
                                        @"status":@"",//搜索
                                        @"inoutId":@"",//搜索
                                            };
                        _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                        [self GETService:7];
                        }
                        break;
                               
                           default:
                               break;
                               }
                
            }
                break;
                
            case chuku:
            {
                
            }
                break;
                
            default:
                break;
        }
    
}




-(void)setTableView{
    
//    _listView.hidden = YES;
//
//    _titleView.hidden = YES;
    
    [_uitableView registerNib:[UINib nibWithNibName:@"BaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"BaseTableViewCell"];
    
}

-(void)postService:(NSInteger)stetas{
    
    [self AllocdataSource];
    [_dataSource removeAllObjects];
   
    [SVProgressHUD show];
    
    
    //请求数据
    [PostService AFHTTPSessionManager:_urlString method:@"POST" params:_parameters WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
       
        [SVProgressHUD dismiss];
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
        }else{

            NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
            
            if ([responseObject[@"status"] intValue] == 40301) {
                
                NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
                NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
                [defautls removePersistentDomainForName:appDomain];

                __unsafe_unretained __typeof(self) weakSelf = self;
                LoginViewController *tab = [[LoginViewController alloc]init];
                weakSelf.view.window.rootViewController = tab;
               
                return;
            
            }
            
            for (NSDictionary *newdict in responseObject[@"content"][@"data"][@"rows"]) {
                
                
                
                HomeModel *model=[[HomeModel alloc]init];
                model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                [model setValuesForKeysWithDictionary:newdict];
                [self.dataSource addObject:model];
                [self.uitableView reloadData];
            }
            
            for (NSDictionary *newdict in responseObject[@"content"][@"rows"]) {
                
                if ([responseObject[@"status"] intValue] == 40301){
                    
                    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
                    NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
                    [defautls removePersistentDomainForName:appDomain];

                    __unsafe_unretained __typeof(self) weakSelf = self;
                    LoginViewController *tab = [[LoginViewController alloc]init];
                    weakSelf.view.window.rootViewController = tab;
                   
                    return;
                
                }
                
                HomeModel *model=[[HomeModel alloc]init];
                model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                [model setValuesForKeysWithDictionary:newdict];
                [self.dataSource addObject:model];
                [self.uitableView reloadData];
            }
            
            if (self.dataSource.count == 0) {
                
                self.nodataImage.hidden = NO;
            }else{
                self.nodataImage.hidden = YES;
            }
            
            
             [self.uitableView reloadData];
        }
        
    }];
    
}

-(void)GETService:(NSInteger)stetas{
    
    [self AllocdataSource];
    [_dataSource removeAllObjects];
   
    [SVProgressHUD show];
    
    
    //请求数据
    [PostService AFHTTPSessionManager:_urlString method:@"GET" params:_parameters WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
       
        [SVProgressHUD dismiss];
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
        }else{

            NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
            for (NSDictionary *newdict in responseObject[@"content"][@"list"]) {
                
                HomeModel *model=[[HomeModel alloc]init];
                model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                [model setValuesForKeysWithDictionary:newdict];
                [self.dataSource addObject:model];
                [self.uitableView reloadData];
            }
            
            
            if (self.dataSource.count == 0) {
                
                self.nodataImage.hidden = NO;
            }else{
                self.nodataImage.hidden = YES;
            }
             [self.uitableView reloadData];
        }
        
    }];
    
}


#pragma mark  右上角搜索按钮
-(void)UInavigationController{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
//    imageView.backgroundColor = [UIColor whiteColor];
    imageView.userInteractionEnabled = YES;
    //给imageView添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SetUP)];
    [imageView addGestureRecognizer:tap];
    imageView.image = [UIImage imageNamed:@"saixuan"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:imageView];
    self.navigationItem.rightBarButtonItem = leftItem;
}

#pragma mark =====搜索
-(void)SetUP
{
    NSLog(@"213123");
    
    _serchView.hidden = NO;
    if ([_CarPlate.text isEqualToString:@""]) {
        _threeTextFiled.placeholder = @"请输入车牌号";
    }
    
}

//取消搜索框
- (IBAction)searchViewTap:(id)sender {
    
    _serchView.hidden = YES;
    [_oneTextField resignFirstResponder];
    [_twoTextField resignFirstResponder];
    [_CarPlate resignFirstResponder];
}

//重置搜索框button
- (IBAction)chongZhiButAction:(id)sender {
    _serchView.hidden = YES;
    [_oneTextField resignFirstResponder];
    [_twoTextField resignFirstResponder];
    [_CarPlate resignFirstResponder];
}

//搜索框搜索button
- (IBAction)SearchButAction:(id)sender {
    
    
    
    
}





#pragma mark ======UICollectionView Delegate

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (_state) {
        case ruku:
            return 5;
            break;
            
        default:
            return 4;
            break;
    }
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    HomePageCollectionViewCell* cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCollectionViewCell"forIndexPath:indexPath];
    cell.label.text=[NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.iamge.image=[UIImage imageNamed:_IconArrl[indexPath.item]];
    
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
////UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    HomePageCollectionViewCell *cell = (HomePageCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = Color_Base(238, 244, 249);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(),
^{
        cell.backgroundColor = [UIColor whiteColor];
    });
    
    
    switch (_state) {
        case ruku:
            
            _WDTStatus = [NSString stringWithFormat:@"%ld",indexPath.row];
            
            break;
            
        case kunei:
        
            _WDTStatus = [NSString stringWithFormat:@"%ld",indexPath.row];
        break;
            
        case chuku:
            _WDTStatus = [NSString stringWithFormat:@"%ld",indexPath.row];
        
        break;
            
        default:
            break;
    }
    
    
    if (_state == ruku) {
        
        if (indexPath.row == 0 || indexPath.row == 4) {
            _threeLabel.hidden = YES;
            _threeTextFiled.hidden = YES;
            _fourbutton.hidden = NO;
            _fourtextLabel.hidden = NO;
            _textfiledViewHeight.constant = 300;
        }
        
    }
    
    
    switch (_state) {
        case ruku:
            
            switch (indexPath.row) {
                case 0://入库订单管理
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 200;
                    _tableviewConstraints.constant = -60;
                    _parameters=@{
                                  @"page":[NSString stringWithFormat:@"%d",_page],
                                  @"limit":@"10",
                                  @"orderType":@"0",//出库1 入库0
                                  @"orderNo":@"",//搜索
                                  @"companyName":@"",//搜索
                      };
                      _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
                    [self postService:8];
                    
                    break;
                case 1://入库门禁管理
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 200;
                    _tableviewConstraints.constant = -60;
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"total":@"0",
                                @"orderType":@"0",//出库1 入库0
                                @"deleteFlag":@"0",
                                @"detailId":@"",//搜索
                                @"orderNo":@"",//搜索
                                @"companyName":@"",//搜索
                                };
//                    NSLog(@"入库门禁管理参数:%@",_parameters);
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/pageList",Url_Sever];
                    [self postService:9];
                
                break;
                case 2://作业信息接受
                   _collectionConstraints.constant = 200;
//                   _tableviewConstraints.constant = ;
                    _titleView.hidden = NO;
//                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = 0;
                    [_ontButton setTitle:@"已派单" forState:UIControlStateNormal];
                    [_twoButton setTitle:@"未完成" forState:UIControlStateNormal];
                    [_threeButton setTitle:@"已完成" forState:UIControlStateNormal];
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"total":@"0",
                                @"orderType":@"0",//出库1 入库0
                                @"deleteFlag":@"0",
                                @"status":@"0",
                                @"inoutId":@"",//搜索
                                @"driverPlateNo":@"",//搜索
                                @"driverPhone":@"",//搜索
                                };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
                    [self postService:10];
                
                break;
                case 3://入库质检管理
                    _titleView.hidden = YES;
                   _collectionConstraints.constant = 200;
                   _tableviewConstraints.constant = -60;
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"total":@"0",
//                                @"orderType":@"1",//出库1 入库0
//                                @"orderStatus":@"",
//                                @"confirmWd":@"0",
//                                @"orderNo":@"0",//搜索
//                                @"companyName":@"",//搜索
//                                @"storageMode":@"",//搜索
                                };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsQualityTesting/page",Url_Sever];
                    [self postService:11];
                
                break;
                case 4://入库信息确认
                    _titleView.hidden = YES;
                   _collectionConstraints.constant = 200;
                   _tableviewConstraints.constant = -60;
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"total":@"0",
                                @"orderType":@"0",//出库1 入库0
                                @"orderStatus":@"4",
                                @"confirmWd":@"0",
                                @"orderNo":@"",//搜索
                                @"companyName":@"",//搜索
                                @"storageMode":@"",//搜索
                                };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageListByConfirm",Url_Sever];
                    [self postService:12];
                    
                break;
                default:
                    break;
            }
            
            
            break;
            
        case kunei:
            switch (indexPath.row) {
                case 0://库存管理
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = -60;
                    _threeLabel.hidden = YES;
                    _threeTextFiled.hidden = YES;
                    _textfiledViewHeight.constant = 220;
                    _oneLabel.text = @"货品名称";
                    _oneTextField.placeholder = @"请输入货品名称";
                    _twoLabel.text = @"货主名称";
                    _twoTextField.placeholder = @"请输入货主名称";
                    _parameters=@{
                                   @"page":[NSString stringWithFormat:@"%d",_page],
                                   @"limit":@"10",
//                                   @"orderType":@"1",//出库1 入库0
                                   @"orderNo":@"",//搜索
                                   @"companyName":@"",//搜索
                                       };
                   _urlString = [NSString stringWithFormat:@"%@/api/wms/stock/getPageByCondition",Url_Sever];
                   [self GETService:4];
                    
                    
                    break;
                case 1://库内管理
                                
                    _titleView.hidden = NO;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = 0;
                    [_ontButton setTitle:@"库内订单" forState:UIControlStateNormal];
                    [_twoButton setTitle:@"库间订单" forState:UIControlStateNormal];
                    [_threeButton setTitle:@"库权转移订单订单" forState:UIControlStateNormal];
                    _threeLabel.hidden = YES;
                    _threeTextFiled.hidden = YES;
                    _textfiledViewHeight.constant = 220;
                    _oneLabel.text = @"货品名称";
                    _oneTextField.placeholder = @"请输入货品名称";
                    _twoLabel.text = @"订单编号";
                    _twoTextField.placeholder = @"请输入订单编号";
                     _parameters=@{
                                   @"page":[NSString stringWithFormat:@"%d",_page],
                                   @"limit":@"10",
                                   @"type":@"0",
                                   @"oldStorageNo":@"",//搜索
                                   @"shipperName":@"",//搜索
                                   @"stockOrderNo":@"",//搜索
                                       };
                   _urlString = [NSString stringWithFormat:@"%@/api/wms/stockManage/getPageByCondition",Url_Sever];
                   [self GETService:5];
                
                break;
                case 2://库存（调度）作业信息列表
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = -60;
                    
                    _threeLabel.hidden = YES;
                    _threeTextFiled.hidden = YES;
                    _oneLabel.hidden = YES;
                    _oneTextField.hidden = YES;
                    _textfiledViewHeight.constant = 150;
                    _twoLabel.text = @"订单编号";
                    _twoTextField.placeholder = @"请输入订单编号";
                      _parameters=@{
                                    @"page":[NSString stringWithFormat:@"%d",_page],
                                    @"limit":@"10",
                                    @"total":@"0",
                                    @"driverPlateNo":@"",//搜索
                                    @"driverPhone":@"",//搜索
                                    @"orderType":@"",//搜索
                                    @"status":@"",//搜索
                                    @"inoutId":@"",//搜索
                                        };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                    [self GETService:6];
                    
                
                break;
                case 3://库内信息确认
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = -60;
                    _threeLabel.hidden = YES;
                    _threeTextFiled.hidden = YES;
                    _textfiledViewHeight.constant = 220;
                    _oneLabel.text = @"货主名称";
                    _oneTextField.placeholder = @"请输入货品名称";
                    _twoLabel.text = @"订单编号";
                    _twoTextField.placeholder = @"请输入订单编号";
                      _parameters=@{
                                    @"page":[NSString stringWithFormat:@"%d",_page],
                                    @"limit":@"10",
                                    @"total":@"0",
                                    @"driverPlateNo":@"",//搜索
                                    @"driverPhone":@"",//搜索
                                    @"orderType":@"",//搜索
                                    @"status":@"",//搜索
                                    @"inoutId":@"",//搜索
                                        };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
                    [self GETService:7];
                
                break;
                    
                default:
                    break;
            }
            
        
            break;
            
        case chuku:
            
            switch (indexPath.row) {
                case 0://出库订单管理列表
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = -60;
                    _threeLabel.hidden = YES;
                    _threeTextFiled.hidden = YES;
                    _textfiledViewHeight.constant = 220;
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"orderType":@"1",//出库1 入库0
                                @"orderNo":@"",//搜索
                                @"companyName":@"",//搜索
                    };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
                    [self postService:0];
                    break;
                case 1://出库门禁管理
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = -60;
                    _threeLabel.hidden = NO;
                    _threeTextFiled.hidden = NO;
                    _twoLabel.text = @"商户名称";
                    _twoTextField.placeholder = @"请输入商户名称";
                    _textfiledViewHeight.constant = 300;
                    _parameters=@{
                                   @"page":[NSString stringWithFormat:@"%d",_page],
                                   @"limit":@"10",
                                   @"total":@"0",
                                   @"orderType":@"1",//出库1 入库0
                                   @"deleteFlag":@"0",
                                   @"detailId":@"",//搜索
                                   @"orderNo":@"",//搜索
                                   @"companyName":@"",//搜索
                                };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/pageList",Url_Sever];
                    [self postService:1];
                    
                    
                break;
                case 2://出库作业信息接受
                    _titleView.hidden = NO;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = 0;
                    [_ontButton setTitle:@"已派单" forState:UIControlStateNormal];
                    [_twoButton setTitle:@"未完成" forState:UIControlStateNormal];
                    [_threeButton setTitle:@"已完成" forState:UIControlStateNormal];
                    _threeLabel.hidden = NO;
                    _threeTextFiled.hidden = NO;
                    _twoLabel.text = @"司机电话";
                    _twoTextField.placeholder = @"请输入司机电话";
                    _textfiledViewHeight.constant = 300;
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
                                @"total":@"0",
                                @"orderType":@"1",//出库1 入库0
                                @"deleteFlag":@"0",
                                @"status":@"0",
                                @"inoutId":@"",//搜索
                                @"driverPlateNo":@"",//搜索
                                @"driverPhone":@"",//搜索
                                };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
                    [self postService:2];
                
                break;
                case 3://出库信息确认
                    _titleView.hidden = YES;
                    _collectionConstraints.constant = 100;
                    _tableviewConstraints.constant = -60;
                    _threeLabel.hidden = YES;
                    _threeTextFiled.hidden = YES;
                    _textfiledViewHeight.constant = 220;
                    _parameters=@{
                                @"page":[NSString stringWithFormat:@"%d",_page],
                                @"limit":@"10",
//                                @"total":@"0",
                                @"orderType":@"1",//出库1 入库0
//                                @"orderStatus":@"",
//                                @"confirmWd":@"0",
                                @"orderNo":@"0",//搜索
                                @"companyName":@"",//搜索
//                                @"storageMode":@"",//搜索
                                };
                    _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
                    [self postService:3];
                
                break;
                default:
                    break;
            }
        
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

#pragma mark tablevoiew

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 180;

}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseTableViewCell"];
    if(!cell){
        cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BaseTableViewCell"];
    }
    if (_dataSource.count>0) {
        HomeModel * model=_dataSource[indexPath.row];
        cell.model=model;
    }

     return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    rukuDetaileViewController *detilVC = [[rukuDetaileViewController alloc]init];
    rukuDetaileListViewController *detilListVC = [[rukuDetaileListViewController alloc]init];
       switch (_state) {
           case ruku:
           {
               detilVC.state = ruku;

               switch ([_WDTStatus intValue]) {
                   case 0:// 入库订单管理
                   {
                       if (_dataSource.count>0) {
                           HomeModel * model=_dataSource[indexPath.row];
                           detilVC.collectionCellIndex = _WDTStatus;
                           detilVC.OrderNum = model.order_no;
                           detilVC.OrderStatus = model.order_status;
                           detilVC.userId = model.user_id;
                           detilVC.shiftsId = model.shiftsId;
                           detilVC.title = @"入库订单列表详情";
                           [self.navigationController pushViewController:detilVC animated:YES];
                       }
                       
                   }
                       break;
                    case 1://入库门禁管理
                    {
                        if (_dataSource.count>0) {

                        HomeModel * model=_dataSource[indexPath.row];
                        
//                        detilVC.OrderStatus = _WDTStatus;
//                        detilVC.ListStatus = @"0";
//                        detilVC.OrderNumber = model.detailId;
                        detilListVC.collection_CellIndex = _WDTStatus;
                        detilListVC.Order_Num = model.wdtID;
                        detilListVC.title = @"入库门禁管理详情";
                        [self.navigationController pushViewController:detilListVC animated:YES];
                        }
                    }
                        break;
                    case 2://入库作业信息接受
                    {
                       if (_dataSource.count>0) {
                           HomeModel * model=_dataSource[indexPath.row];
                           detilVC.collectionCellIndex = _WDTStatus;
                           detilVC.OrderNum = model.inoutId;
                           detilVC.userId = model.wdtID;
                           detilVC.title = @"入库作业信息列表详情";
                           [self.navigationController pushViewController:detilVC animated:YES];
                       }
                    }
                        break;
                   case 3://入库质检管理详情
                   {
                       
                       if (_dataSource.count>0) {
                           HomeModel * model=_dataSource[indexPath.row];
                           detilVC.collectionCellIndex = _WDTStatus;
                           detilVC.OrderNum = model.orderNo;
                           detilVC.userId = model.wdtID;
                           detilVC.title = @"入库质检管理列表详情";
                           [self.navigationController pushViewController:detilVC animated:YES];
                       }
                   }
                       break;
                   case 4:// 入库信息确认
                   {
                       if (_dataSource.count>0) {
                           HomeModel * model=_dataSource[indexPath.row];
                           detilVC.collectionCellIndex = _WDTStatus;
                           detilVC.OrderNum = model.order_no;
                           detilVC.userId = model.user_id;
                           detilVC.title = @"入库信息确认列表详情";
                           [self.navigationController pushViewController:detilVC animated:YES];
                       }
                   }
                       break;
                       
                   default:
                       break;
               }
               
           }
               break;
           case kunei:
            {
                
                detilVC.state = kunei;
                
                switch ([_WDTStatus intValue]) {
                                   case 0:// 库内库存管理
                                   {
                                       if (_dataSource.count>0) {
                                           HomeModel * model=_dataSource[indexPath.row];
                                           detilVC.collectionCellIndex = _WDTStatus;
                                           detilVC.OrderNum = model.order_no;
                                           detilVC.OrderStatus = model.order_status;
                                           detilVC.userId = model.supplierId;//storageId
                                           detilVC.title = @"库内订单列表详情";
                                           [self.navigationController pushViewController:detilVC animated:YES];
                                       }
                                       
                                   }
                                       break;
                                    case 1://库内管理
                                    {
                                        if (_dataSource.count>0) {

                                        HomeModel * model=_dataSource[indexPath.row];
                                        
                //                        detilVC.OrderStatus = _WDTStatus;
                //                        detilVC.ListStatus = @"0";
                //                        detilVC.OrderNumber = model.detailId;
                                        detilListVC.collection_CellIndex = _WDTStatus;
                                        detilListVC.Order_Num = model.wdtID;
                                        detilListVC.title = @"库内门禁管理详情";
                                        [self.navigationController pushViewController:detilListVC animated:YES];
                                        }
                                    }
                                        break;
                                    case 2://库内作业信息接受
                                    {
                                       if (_dataSource.count>0) {
                                           HomeModel * model=_dataSource[indexPath.row];
                                           detilVC.collectionCellIndex = _WDTStatus;
                                           detilVC.OrderNum = model.inoutId;
                                           detilVC.userId = model.wdtID;
                                           detilVC.title = @"库内作业信息列表详情";
                                           [self.navigationController pushViewController:detilVC animated:YES];
                                       }
                                    }
                                        break;
                                   case 3://入库质检管理详情
                                   {
                                       
                                       if (_dataSource.count>0) {
                                           HomeModel * model=_dataSource[indexPath.row];
                                           detilVC.collectionCellIndex = _WDTStatus;
                                           detilVC.OrderNum = model.order_no;
                                           detilVC.userId = model.user_id;
                                           detilVC.title = @"库内信息确认列表详情";
                                           [self.navigationController pushViewController:detilVC animated:YES];
                                       }
                                   }
                                       break;
                                       
                                   default:
                                       break;
                               }
                
                 
            
                 
             }
               
               break;
           case chuku:
               
            {
                detilVC.state = chuku;
                 switch ([_WDTStatus intValue]) {
                               case 0:// 出库订单库存管理
                               {
                                   if (_dataSource.count>0) {
                                       HomeModel * model=_dataSource[indexPath.row];
                                       detilVC.collectionCellIndex = _WDTStatus;
                                       detilVC.OrderNum = model.order_no;
                                       detilVC.OrderStatus = model.order_status;
                                       detilVC.userId = model.user_id;//storageId
                                       detilVC.title = @"出库订单列表详情";
                                       [self.navigationController pushViewController:detilVC animated:YES];
                                   }
                                   
                               }
                                   break;
                                case 1://出库门禁管理
                                {
                                    if (_dataSource.count>0) {

                                    HomeModel * model=_dataSource[indexPath.row];
                                    
            //                        detilVC.OrderStatus = _WDTStatus;
            //                        detilVC.ListStatus = @"0";
            //                        detilVC.OrderNumber = model.detailId;
                                    detilListVC.collection_CellIndex = _WDTStatus;
                                    detilListVC.Order_Num = model.wdtID;
                                    detilListVC.title = @"出库门禁管理详情";
                                    [self.navigationController pushViewController:detilListVC animated:YES];
                                    }
                                }
                                    break;
                                case 2://出库作业信息接受
                                {
                                   if (_dataSource.count>0) {
                                       HomeModel * model=_dataSource[indexPath.row];
                                       detilVC.collectionCellIndex = _WDTStatus;
                                       detilVC.OrderNum = model.inoutId;
                                       detilVC.userId = model.wdtID;
                                       detilVC.title = @"出库作业信息列表详情";
                                       [self.navigationController pushViewController:detilVC animated:YES];
                                   }
                                }
                                    break;
                               case 3://出库信息管理详情
                               {
                                   
                                   if (_dataSource.count>0) {
                                       HomeModel * model=_dataSource[indexPath.row];
                                       detilVC.collectionCellIndex = _WDTStatus;
                                       detilVC.OrderNum = model.order_no;
                                       detilVC.userId = model.user_id;
                                       detilVC.title = @"出库信息确认列表详情";
                                       [self.navigationController pushViewController:detilVC animated:YES];
                                   }
                               }
                                   break;
                                   
                               default:
                                   break;
                           }             }
               
               break;
               
           default:
               break;
       }
    
       
    
}

//#pragma mark 侧滑
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewCellEditingStyleDelete;
//}
//
//
//- ( UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    UIContextualAction *topRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"通过" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//    NSLog(@"点击了置顶");
//        
//}];
//
//    topRowAction.backgroundColor = UIColor.blueColor;
//    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"驳回" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//    NSLog(@"点击了删除");
//        
//}];
//
//    deleteRowAction.backgroundColor = UIColor.redColor;
//    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[topRowAction,deleteRowAction]];
//    return config;
//}


#pragma mark =====下拉刷新 上拉加载
-(void)Refresh
{
    
    
    switch (_state) {
        case ruku:
        
            break;
        case kunei:
            
            break;
        case chuku:
            
            
            
            break;
            
        default:
            break;
    }
    
    
    
    
    
}


-(void)mjRefresh:(NSInteger *)page{
    
    __unsafe_unretained UITableView *tableView =self.uitableView;
    __weak typeof(self) weakSelf = self;
    tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        self->_page = 1 ;
        [self.dataSource removeAllObjects];
       
//        switch (weakSelf.state) {
//                case ruku:
//                    
//                switch (self->_reload) {
//                        case 0://入库订单管理
//                            _titleView.hidden = YES;
//                        self->_collectionConstraints.constant = 200;
//                            _tableviewConstraints.constant = -60;
//                            _parameters=@{
//                                          @"page":[NSString stringWithFormat:@"%d",_page],
//                                          @"limit":@"10",
//                                          @"orderType":@"0",//出库1 入库0
//                                          @"orderNo":@"",//搜索
//                                          @"companyName":@"",//搜索
//                              };
//                              _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
//                            [self postService:8];
//                            
//                            break;
//                        case 1://入库门禁管理
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 200;
//                            _tableviewConstraints.constant = -60;
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//                                        @"total":@"0",
//                                        @"orderType":@"0",//出库1 入库0
//                                        @"deleteFlag":@"0",
//                                        @"detailId":@"",//搜索
//                                        @"orderNo":@"",//搜索
//                                        @"companyName":@"",//搜索
//                                        };
//        //                    NSLog(@"入库门禁管理参数:%@",_parameters);
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/pageList",Url_Sever];
//                            [self postService:9];
//                        
//                        break;
//                        case 2://作业信息接受
//                           _collectionConstraints.constant = 200;
//        //                   _tableviewConstraints.constant = ;
//                            _titleView.hidden = NO;
//        //                    _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = 0;
//                            [_ontButton setTitle:@"已派单" forState:UIControlStateNormal];
//                            [_twoButton setTitle:@"未完成" forState:UIControlStateNormal];
//                            [_threeButton setTitle:@"已完成" forState:UIControlStateNormal];
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//                                        @"total":@"0",
//                                        @"orderType":@"0",//出库1 入库0
//                                        @"deleteFlag":@"0",
//                                        @"status":@"0",
//                                        @"inoutId":@"",//搜索
//                                        @"driverPlateNo":@"",//搜索
//                                        @"driverPhone":@"",//搜索
//                                        };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
//                            [self postService:10];
//                        
//                        break;
//                        case 3://入库质检管理
//                            _titleView.hidden = YES;
//                           _collectionConstraints.constant = 200;
//                           _tableviewConstraints.constant = -60;
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//                                        @"total":@"0",
//        //                                @"orderType":@"1",//出库1 入库0
//        //                                @"orderStatus":@"",
//        //                                @"confirmWd":@"0",
//        //                                @"orderNo":@"0",//搜索
//        //                                @"companyName":@"",//搜索
//        //                                @"storageMode":@"",//搜索
//                                        };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsQualityTesting/page",Url_Sever];
//                            [self postService:11];
//                        
//                        break;
//                        case 4://入库信息确认
//                            _titleView.hidden = YES;
//                           _collectionConstraints.constant = 200;
//                           _tableviewConstraints.constant = -60;
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//                                        @"total":@"0",
//                                        @"orderType":@"0",//出库1 入库0
//                                        @"orderStatus":@"4",
//                                        @"confirmWd":@"0",
//                                        @"orderNo":@"",//搜索
//                                        @"companyName":@"",//搜索
//                                        @"storageMode":@"",//搜索
//                                        };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageListByConfirm",Url_Sever];
//                            [self postService:12];
//                            
//                        break;
//                        default:
//                            break;
//                    }
//                    
//                    
//                    break;
//                    
//                case kunei:
//                    switch (indexPath.row) {
//                        case 0://库存管理
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = -60;
//                            _threeLabel.hidden = YES;
//                            _threeTextFiled.hidden = YES;
//                            _textfiledViewHeight.constant = 220;
//                            _oneLabel.text = @"货品名称";
//                            _oneTextField.placeholder = @"请输入货品名称";
//                            _twoLabel.text = @"货主名称";
//                            _twoTextField.placeholder = @"请输入货主名称";
//                            _parameters=@{
//                                           @"page":[NSString stringWithFormat:@"%d",_page],
//                                           @"limit":@"10",
//        //                                   @"orderType":@"1",//出库1 入库0
//                                           @"orderNo":@"",//搜索
//                                           @"companyName":@"",//搜索
//                                               };
//                           _urlString = [NSString stringWithFormat:@"%@/api/wms/stock/getPageByCondition",Url_Sever];
//                           [self GETService:4];
//                            
//                            
//                            break;
//                        case 1://库内管理
//                                        
//                            _titleView.hidden = NO;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = 0;
//                            [_ontButton setTitle:@"库内订单" forState:UIControlStateNormal];
//                            [_twoButton setTitle:@"库间订单" forState:UIControlStateNormal];
//                            [_threeButton setTitle:@"库权转移订单订单" forState:UIControlStateNormal];
//                            _threeLabel.hidden = YES;
//                            _threeTextFiled.hidden = YES;
//                            _textfiledViewHeight.constant = 220;
//                            _oneLabel.text = @"货品名称";
//                            _oneTextField.placeholder = @"请输入货品名称";
//                            _twoLabel.text = @"订单编号";
//                            _twoTextField.placeholder = @"请输入订单编号";
//                             _parameters=@{
//                                           @"page":[NSString stringWithFormat:@"%d",_page],
//                                           @"limit":@"10",
//                                           @"type":@"0",
//                                           @"oldStorageNo":@"",//搜索
//                                           @"shipperName":@"",//搜索
//                                           @"stockOrderNo":@"",//搜索
//                                               };
//                           _urlString = [NSString stringWithFormat:@"%@/api/wms/stockManage/getPageByCondition",Url_Sever];
//                           [self GETService:5];
//                        
//                        break;
//                        case 2://库存（调度）作业信息列表
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = -60;
//                            
//                            _threeLabel.hidden = YES;
//                            _threeTextFiled.hidden = YES;
//                            _oneLabel.hidden = YES;
//                            _oneTextField.hidden = YES;
//                            _textfiledViewHeight.constant = 150;
//                            _twoLabel.text = @"订单编号";
//                            _twoTextField.placeholder = @"请输入订单编号";
//                              _parameters=@{
//                                            @"page":[NSString stringWithFormat:@"%d",_page],
//                                            @"limit":@"10",
//                                            @"total":@"0",
//                                            @"driverPlateNo":@"",//搜索
//                                            @"driverPhone":@"",//搜索
//                                            @"orderType":@"",//搜索
//                                            @"status":@"",//搜索
//                                            @"inoutId":@"",//搜索
//                                                };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
//                            [self GETService:6];
//                            
//                        
//                        break;
//                        case 3://库内信息确认
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = -60;
//                            _threeLabel.hidden = YES;
//                            _threeTextFiled.hidden = YES;
//                            _textfiledViewHeight.constant = 220;
//                            _oneLabel.text = @"货主名称";
//                            _oneTextField.placeholder = @"请输入货品名称";
//                            _twoLabel.text = @"订单编号";
//                            _twoTextField.placeholder = @"请输入订单编号";
//                              _parameters=@{
//                                            @"page":[NSString stringWithFormat:@"%d",_page],
//                                            @"limit":@"10",
//                                            @"total":@"0",
//                                            @"driverPlateNo":@"",//搜索
//                                            @"driverPhone":@"",//搜索
//                                            @"orderType":@"",//搜索
//                                            @"status":@"",//搜索
//                                            @"inoutId":@"",//搜索
//                                                };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/getStockTransferPageData",Url_Sever];
//                            [self GETService:7];
//                        
//                        break;
//                            
//                        default:
//                            break;
//                    }
//                    
//                
//                    break;
//                    
//                case chuku:
//                    
//                    switch (indexPath.row) {
//                        case 0://出库订单管理列表
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = -60;
//                            _threeLabel.hidden = YES;
//                            _threeTextFiled.hidden = YES;
//                            _textfiledViewHeight.constant = 220;
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//                                        @"orderType":@"1",//出库1 入库0
//                                        @"orderNo":@"",//搜索
//                                        @"companyName":@"",//搜索
//                            };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
//                            [self postService:0];
//                            break;
//                        case 1://出库门禁管理
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = -60;
//                            _threeLabel.hidden = NO;
//                            _threeTextFiled.hidden = NO;
//                            _twoLabel.text = @"商户名称";
//                            _twoTextField.placeholder = @"请输入商户名称";
//                            _textfiledViewHeight.constant = 300;
//                            _parameters=@{
//                                           @"page":[NSString stringWithFormat:@"%d",_page],
//                                           @"limit":@"10",
//                                           @"total":@"0",
//                                           @"orderType":@"1",//出库1 入库0
//                                           @"deleteFlag":@"0",
//                                           @"detailId":@"",//搜索
//                                           @"orderNo":@"",//搜索
//                                           @"companyName":@"",//搜索
//                                        };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/pageList",Url_Sever];
//                            [self postService:1];
//                            
//                            
//                        break;
//                        case 2://出库作业信息接受
//                            _titleView.hidden = NO;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = 0;
//                            [_ontButton setTitle:@"已派单" forState:UIControlStateNormal];
//                            [_twoButton setTitle:@"未完成" forState:UIControlStateNormal];
//                            [_threeButton setTitle:@"已完成" forState:UIControlStateNormal];
//                            _threeLabel.hidden = NO;
//                            _threeTextFiled.hidden = NO;
//                            _twoLabel.text = @"司机电话";
//                            _twoTextField.placeholder = @"请输入司机电话";
//                            _textfiledViewHeight.constant = 300;
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//                                        @"total":@"0",
//                                        @"orderType":@"1",//出库1 入库0
//                                        @"deleteFlag":@"0",
//                                        @"status":@"0",
//                                        @"inoutId":@"",//搜索
//                                        @"driverPlateNo":@"",//搜索
//                                        @"driverPhone":@"",//搜索
//                                        };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/pageList",Url_Sever];
//                            [self postService:2];
//                        
//                        break;
//                        case 3://出库信息确认
//                            _titleView.hidden = YES;
//                            _collectionConstraints.constant = 100;
//                            _tableviewConstraints.constant = -60;
//                            _threeLabel.hidden = YES;
//                            _threeTextFiled.hidden = YES;
//                            _textfiledViewHeight.constant = 220;
//                            _parameters=@{
//                                        @"page":[NSString stringWithFormat:@"%d",_page],
//                                        @"limit":@"10",
//        //                                @"total":@"0",
//                                        @"orderType":@"1",//出库1 入库0
//        //                                @"orderStatus":@"",
//        //                                @"confirmWd":@"0",
//                                        @"orderNo":@"0",//搜索
//                                        @"companyName":@"",//搜索
//        //                                @"storageMode":@"",//搜索
//                                        };
//                            _urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/pageList",Url_Sever];
//                            [self postService:3];
//                        
//                        break;
//                        default:
//                            break;
//                    }
//                
//                    break;
//                    
//                default:
//                    break;
//            }
        
        
        // 结束刷新
        [tableView.mj_header endRefreshing];
        
    }];
    
}


-(void)Loading
{
    __unsafe_unretained UITableView *tableView =self.uitableView;
    
    tableView.mj_footer= [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        self->_page ++;
        
        [self postService:0];
        
        [tableView reloadData];
        
        [tableView.mj_footer endRefreshing];
        
    }];
}

@end
