//
//  rukuDetaileViewController.m
//  HourseManage
//
//  Created by mac on 2019/12/21.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "rukuDetaileViewController.h"
#import "JXCategoryView.h"
#import "rukuDetaileListViewController.h"

@interface rukuDetaileViewController ()

@property (nonatomic, strong) JXCategoryTitleView         * myCategoryView;

@property (nonatomic, strong) JXCategoryListContainerView * listContainerView;

@property (nonatomic,strong)NSArray                       * titles;

@end

@implementation rukuDetaileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    [self SetJXCategoryView];
}

-(void)SetJXCategoryView{

//    self.uitableView.hidden = YES;

    [self.view addSubview:self.listContainerView];
    
    
    switch (_state) {
            //入库
            case ruku:{
                
                switch ([_collectionCellIndex intValue]) {
                    case 0:
                    {
                        if ([_OrderStatus intValue] == 5) {
                            self.titles = @[@"基本信息", @"预计货品", @"实际货品",@"预约信息", ];
                        }else{
                            self.titles = @[@"基本信息", @"预计货品",@"预约信息", ];
                        }
                        
                    }
                        break;
                    case 2:
                    {
                        self.titles = @[@"调度单", @"预约信息", @"叉车工",@"搬运工", ];
                    }
                        break;
                    case 3:
                    {
                        self.titles = @[@"入库质检", @"入库订单", @"货品信息"];
                    }
                        break;
                    case 4:
                    {
                        self.titles = @[@"基本信息", @"预计货品", @"实际货品",@"预约信息", ];
                    }
                        break;
                    default:
                        break;
                }
            
            
            
                    }
                break;
            
            //库内
            case kunei:{
                
                switch ([_collectionCellIndex intValue]) {
                    case 0:
                    {
                        self.titles = @[@"库存信息", @"入库信息",@"出库信息", @"货权转移信息"];
                    }
                        break;
                    case 2:
                    {
                        self.titles = @[@"基本信息", @"预约转移货品"];
                    }
                        break;
                    case 3:
                    {
                        self.titles = @[@"基本信息", @"预计转移货品", @"实际转移货品"];
                    }
                        break;
                    default:
                        break;
                }
                
                    }
                break;
            
            
            //出库
            case chuku:{
                
                switch ([_collectionCellIndex intValue]) {
                    case 0:
                    {
                        if ([_OrderStatus intValue] == 5) {
                               self.titles = @[@"基本信息", @"预计货品", @"实际货品",@"预约信息", ];
                           }else{
                               self.titles = @[@"基本信息", @"预计货品",@"预约信息", ];
                           }
                        
                    }
                        break;
                    case 2:
                    {
                        self.titles = @[@"调度单", @"预约信息",@"叉车工",@"搬运工"];
                    }
                        break;
                    case 3:
                    {
                        self.titles = @[@"基本信息", @"预计货品", @"实际货品",@"预约信息"];
                    }
                        break;
                    default:
                        break;
                }
                
                    }
                break;
            
        default:
            break;
    }
    
    
    

    

    self.myCategoryView = [[JXCategoryTitleView alloc] init];
    self.myCategoryView.listContainer = self.listContainerView;
    self.myCategoryView.delegate = self;
    [self.view addSubview:self.myCategoryView];




    self.myCategoryView.titles = self.titles;
    self.myCategoryView.titleColor  = [UIColor lightGrayColor];
    self.myCategoryView.titleSelectedColor  = NavigationColor_RGB;
    self.myCategoryView.backgroundColor = [UIColor whiteColor];

    self.myCategoryView.layer.cornerRadius = 15;
    self.myCategoryView.layer.masksToBounds = YES;
    self.myCategoryView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.myCategoryView.layer.borderWidth = 1/[UIScreen mainScreen].scale;

    self.myCategoryView.titleColorGradientEnabled = YES;

    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = NavigationColor_RGB;
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.myCategoryView.indicators = @[lineView];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.myCategoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.listContainerView.frame = CGRectMake(0, 80, self.view.frame.size.width, self.view.frame.size.height - 80);
//    self.listContainerView.backgroundColor = UIColor.blueColor;

    self.myCategoryView.frame = CGRectMake(10, 10, self.view.frame.size.width-20, 60);
//    self.myCategoryView.backgroundColor = UIColor.yellowColor;
}

- (JXCategoryListContainerView *)listContainerView {
    if (_listContainerView == nil) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}

#pragma mark - JXCategoryViewDelegate
//点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"点击选中或者滚动选中都会调用该方法。%ld", (long)index);
}
//滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - JXCategoryListContainerViewDelegate

//返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}
//根据下标index返回对应遵从`JXCategoryListContentViewDelegate`协议的列表实例
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {

    rukuDetaileListViewController * vc = [[rukuDetaileListViewController alloc]init];
    NSLog(@"-----%ld",index);
    vc.JXCategory_num = [NSString stringWithFormat:@"%ld",index];
    vc.state = _state;
    vc.collection_CellIndex = _collectionCellIndex;
    vc.Order_Num = _OrderNum;
    vc.Order_Status = _OrderStatus;
    vc.user_Id =  _userId;
//    vc.shiftsId = _shiftsId;
    return vc;
}


@end
