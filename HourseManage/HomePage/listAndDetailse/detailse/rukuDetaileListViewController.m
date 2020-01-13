//
//  rukuDetaileListViewController.m
//  HourseManage
//
//  Created by mac on 2019/12/21.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "rukuDetaileListViewController.h"

#import "JXCategoryView.h"

#import "OStatusTableViewCell.h"
#import "TStatusTableViewCell.h"
#import "ThStatusTableViewCell.h"
#import "RuKuModel.h"
#import "YuYueViewController.h"


@interface rukuDetaileListViewController ()
{
    int _page;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray        * dataSource;

@property (weak, nonatomic) IBOutlet UIView *buttonView;

@property (weak, nonatomic) IBOutlet UIButton *tongguoButton;

@property (weak, nonatomic) IBOutlet UIButton *bohuiButton;

@property (weak, nonatomic) IBOutlet UIImageView *nodataImage;


@property (nonatomic,copy)NSString          * UrlString;

@property(nonatomic,strong)NSDictionary        * parameters;

@property (nonatomic,strong)NSArray           * nameArr;



@property (nonatomic,copy)NSString          * storageId;

@property (nonatomic,copy)NSString          * shiftsId;

@property (nonatomic,copy)NSArray           * YuYueArr;



@end

@implementation rukuDetaileListViewController

- (UIView *)listView {
    return self.view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self SetUITableviewCellStatus];
    
    [self SetPostService];
    
    

    _storageId = [[NSString alloc]init];
}

-(void)SetUITableviewCellStatus{
    
    [_tableView registerNib:[UINib nibWithNibName:@"OStatusTableViewCell" bundle:nil] forCellReuseIdentifier:@"OStatusTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"TStatusTableViewCell" bundle:nil] forCellReuseIdentifier:@"TStatusTableViewCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"ThStatusTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThStatusTableViewCell"];
    
}
- (IBAction)tongguoAction:(id)sender {
    
    
    switch (_state) {
        case ruku:
            {
                switch ([_collection_CellIndex intValue]) {
                    case 0:
                        {
                            switch ([_JXCategory_num intValue]) {
                                case 0:
                                    {
                                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定通过审核嘛" preferredStyle:UIAlertControllerStyleAlert];
                                        
                                        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                            
                                            [self buttonActionService:@"3" withString:@""];
                                            
                                        }]];
                                        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                            
                                            
                                        }]];
                                        
                                        [self presentViewController:alert animated:YES completion:nil];
                                        
                                    }
                                    break;
                                    
                                default:
                                    break;
                            }
                            
                        }
                        break;
                    case 1:
                    {
                        
                    }
                    break;
                    case 2:
                    {
                        
                    }
                    break;
                    case 3:
                    {
                        
                    }
                    break;
                    case 4:
                    {
                        
                    }
                    break;
                        
                    default:
                        break;
                }
                
            }
            break;
        case kunei:
        {
            
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

#pragma mark ===驳回 通过
- (IBAction)bohuiAction:(id)sender {
    
    
    switch (_state) {
        case ruku:
            {
                switch ([_collection_CellIndex intValue]) {
                    case 0:
                        {
                            switch ([_JXCategory_num intValue]) {
                                case 0:
                                    {
                                         UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定驳回审核" preferredStyle:UIAlertControllerStyleAlert];

                                           [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

                                                
                                               UITextField *titleTextField = alert.textFields.firstObject;
                                               
                                               
                                               if ([titleTextField.text isEqualToString:@""]) {
                                                   
                                                   return [SVProgressHUD showWithStatus:@"请输入驳回原因"];
                                               }else{
                                                   [self buttonActionService:@"9" withString:titleTextField.text];
                                               }

                                           }]];
                                           [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

                                           }]];
                                           
                                           [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                                                  
                                               textField.placeholder = @"请输入驳回原因";
                                              }];

                                           [self presentViewController:alert animated:YES completion:nil];
                                        
                                    }
                                    break;
                                    
                                default:
                                    break;
                            }
                            
                        }
                        break;
                    case 1:
                    {
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定再次预约嘛" preferredStyle:UIAlertControllerStyleAlert];
                        
                        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
//                            [self buttonActionService:@"3" withString:@""];
                          YuYueViewController * VC = [[YuYueViewController alloc]init];
                                 
                           VC.title = @"入库门禁预约编辑";
                        
                            VC.OneStr = self.YuYueArr[1];
                            VC.TwoStr = self.YuYueArr[2];
                            VC.ThreeStr = self.YuYueArr[3];
                            VC.fourStr = self.YuYueArr[4];
                            VC.fiveStr= self.YuYueArr[5];
                            VC.sixStr= self.YuYueArr[5];

                           [self.navigationController pushViewController:VC animated:YES];
                            
                        }]];
                        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                            
                        }]];
                        
                        [self presentViewController:alert animated:YES completion:nil];
                        
                    }
                    break;
                    case 2:
                    {
                        
                    }
                    break;
                    case 3:
                    {
                        
                    }
                    break;
                    case 4:
                    {
                        
                    }
                    break;
                        
                    default:
                        break;
                }
                
            }
            break;
        case kunei:
        {
            
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


-(void)buttonActionService:(NSString *) opintion withString:(NSString *)str
{
     
    [SVProgressHUD show];
            
    NSDictionary * params=@{
                            @"orderNo":_Order_Num,//订单号
                            @"orderStatus":opintion,//订单状态
                            @"orderType":@"0",//订单类型 0 入库 1 出库
                            @"userId":_user_Id,//商户id
                            @"opinion":str,//通过3 驳回9
                                                  
        };
        NSString *urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/approval",Url_Sever];
            //请求数据
            [PostService AFHTTPSessionManager:urlString method:@"POST" params:params WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
               
                [SVProgressHUD dismiss];
                if (error) {
                    [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
                }else{

                    NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
                    
                    
                    if ([responseObject[@"status"] intValue] == 200) {
                       
                        [SVProgressHUD showWithStatus: @"操作成功"];
                        [SVProgressHUD dismissWithDelay:1.75];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                       
                        return;
                    
                    }else{
                         [SVProgressHUD showWithStatus: [NSString stringWithFormat:@"操作失败:%@",responseObject[@"message"]]];
                    }
                }
                
            }];
}


-(void)SetPostService{
    
    switch (_state) {
        case ruku:
        {
            switch ([_collection_CellIndex intValue]) {
                   case 0://入库订单列表
                       {
                           switch ([_JXCategory_num intValue]) {
                               case 0:
                               {
                                    _nameArr = @[@"订单编号",@"订单状态",@"商户名称",@"预计入库时间",@"所属仓库",@"是否面临预约",@"是否需要理贷",@"审核意见",@"备注"];
                                   _parameters=@{
                                               @"orderNo":_Order_Num,
                                   };
                                  
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                                   [self postService:0];
                               }
                               break;
                                   
                               case 1:
                               {
                                   // 预计货品
                                   _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                               @"orderNo":_Order_Num,
                                               @"storageMode":@"0",//出库1 入库0
                                   };
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                                   [self postService:1];
                               }
                               
                               break;
                               case 2:
                               {
                                   if ([_Order_Status intValue] == 5) {
                                       
                                       //实际货品
                                          _parameters=@{
                                                      @"page":[NSString stringWithFormat:@"%d",_page],
                                                      @"limit":@"10",
                                                      @"orderNo":_Order_Num,//出库1 入库0
                                                      @"storageMode":@"0",
                                          };
                                          _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsSpotGoodsDetail/getSpotDetail/%@",Url_Sever,_Order_Num];
                                          [self postService:2];
                                       
                                   }else{
                                       //预约信息
                                       _parameters=@{
                                                   @"page":[NSString stringWithFormat:@"%d",_page],
                                                   @"limit":@"10",
                                                   @"orderNo":_Order_Num,
                                                   @"storageMode":@"0",
                                       };
                                       _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                                       [self postService:1];
                                       
                                   }
                                   
                                   
                               }
                                   break;
                                   
                               case 3:
                               {
                                   //预约信息
                                   _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                               @"orderNo":_Order_Num,
                                               @"storageMode":@"0",
                                   };
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                                   [self postService:1];
                               }
                               
                               break;
                               default:
                               {
                               }
                                   break;
                           }
                           
                       }
                       break;
                   case 1://入库门禁管理
                   {
                       _nameArr = @[@"入库编号",@"司机名称",@"车牌号",@"司机电话",@"核载量(t)",@"预约入场时间"];
                       _parameters=@{
                                    @"id":_Order_Num,
                        };
                       
                        _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/edit",Url_Sever];
                        [self postService:0];
                       
                   }
                   break;
                   case 2://入库作业信息接受
                   {
                       switch ([_JXCategory_num intValue]) {
                           case 0://调度单
                           {
                               _nameArr = @[@"月台名称",@"班主名称",@"是否需要理贷",@"调度单状态"];
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                              
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/edit",Url_Sever];
                               [self postService:0];
                           }
                           break;
                               
                           case 1://预约信息
                           {
                               _nameArr = @[@"司机姓名",@"车牌号",@"司机电话",@"预约入场时间"];
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/edit",Url_Sever];
                               [self postService:0];
                           }
                           
                           break;
                           case 2://叉车工
                           {
//                               HomeModel *model = _dataSource[0];
//
//                               _storageId = model.storageId;
                               NSLog(@"-------%@",_storageId);
                              _parameters=@{
                                          @"storageId":@"657176150023340032",
                              };
                              _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository/%@",Url_Sever,_shiftsId];
                              [self postService:1];
                               
                               
                           }
                               break;
                               
                           case 3://搬运工
                           {
                              
                               _parameters=@{
                                           @"storageId":@"657176150023340032",
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository",Url_Sever];
                               [self postService:1];
                           }
                           
                           break;
                           default:
               
                               break;
                       }
                       
                   }
                   break;
                   case 3://入库质检管理
                   {
                       switch ([_JXCategory_num intValue]) {
                           case 0://入库质检详情接口
                           {
                               _nameArr = @[@"质检状态",@"质检员",@"质检时间",@"质检评论"];
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                              
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsQualityTesting/edit",Url_Sever];
                               [self postService:0];
                           }
                           break;
                               
                           case 1://入库质检详情接口1
                           {
                               _nameArr = @[@"订单编号",@"商户名称",@"预计入库时间",@"订单状态",@"备注"];
                               _parameters=@{
                                           @"orderNo":_Order_Num,
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                               [self postService:0];
                           }
                           
                           break;
                           case 2://入库质检详情接口2
                           {
                              _parameters=@{
                                          @"page":[NSString stringWithFormat:@"%d",_page],
                                          @"limit":@"10",
                                          @"total":@"",
                                          @"deleteFlag":@"",
                                          @"status":@"",
                                          @"orderNo":_Order_Num,
                              };
                              _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                              [self postService:1];
                               
                               
                           }
                               break;
                           
                           break;
                           default:
                           break;
                       }
                       
                       
                   }
                   break;
                   case 4://入库信息确认
                   {
                       switch ([_JXCategory_num intValue]) {
                           case 0:
                           {
                                
                               _nameArr = @[@"订单编号",@"订单状态",@"商户名称",@"是否需要人工",@"仓库名称",@"预计出库时间",@"是否开具冻检证",@"是否临时预约",@"是否需要理贷",@"备注"];
                               _parameters=@{
                                           @"orderNo":_Order_Num,
                               };
                              
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                               [self postService:0];
                           }
                           break;
                               
                           case 1:
                           {
                               // 预计货品
                               _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"orderNo":_Order_Num,
                                           @"storageMode":@"0",//出库1 入库0
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                               [self postService:1];
                           }
                           
                           break;
                           case 2:
                           {
                               //实际货品
                               _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"orderNo":_Order_Num,//出库1 入库0
                                           @"storageMode":@"0",
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsSpotGoodsDetail/getSpotDetail?id=%@",Url_Sever,_user_Id];
                               [self postService:1];
                               
                               
                           }
                               break;
                               
                           case 3:
                           {
                               //预约信息
                               _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"orderNo":_Order_Num,
                                           @"storageMode":@"0",
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                               [self postService:1];
                           }
                           
                           break;
                           default:
                           {
                           }
                               break;
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
            
            switch ([_collection_CellIndex intValue]) {
                   case 0:// 库内订单列表
                       {
                           switch ([_JXCategory_num intValue]) {
                               case 0:
                               {
                                    _nameArr = @[@"所在存储区",@"货品种类",@"货品名称",@"货主名称",@"规格",@"数量",@"毛重(t)",@"净重(t)",@"冻结数量",@"冻结毛重(t)",@"冻结净重(t)",@"库存状态",@"备注"];
                                   _parameters=@{
                                               @"id":_user_Id,
                                   };
                                  
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/stock/getStockById",Url_Sever];
                                   [self GETService:0];
                               }
                               break;
                                   
                               case 1:
                               {
                                   // 入库信息
                                   _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                           @"orderNo":@"",
                                               @"storageMode":@"0",//出库1 入库0
                                   };
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                                   [self postService:1];
                               }
                               
                               break;
                               case 2:
                               {
                                  //出库信息
                                   _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                               @"orderNo":@"",//出库1 入库0
                                               @"storageMode":@"0",
                                   };
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsSpotGoodsDetail/getSpotDetail?pathvariable=%@",Url_Sever,_user_Id];
                                   [self postService:1];
                                   
                                   
                               }
                                   break;
                                   
                               case 3:
                               {
                                   //货权转移信息
                                   _parameters=@{
                                               @"page":[NSString stringWithFormat:@"%d",_page],
                                               @"limit":@"10",
                                               @"orderNo":@"",
                                               @"storageMode":@"0",
                                   };
                                   _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                                   [self postService:1];
                               }
                               
                               break;
                               default:
                               {
                               }
                                   break;
                           }
                           
                       }
                       break;
                   case 1://入库门禁管理
                   {
                       _nameArr = @[@"入库编号",@"司机名称",@"车牌号",@"司机电话",@"核载量(t)",@"预约入场时间"];
                       _parameters=@{
                                    @"id":@"",
                        };
                       
                        _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/edit",Url_Sever];
                        [self postService:0];
                       
                   }
                   break;
                   case 2://入库作业信息接受
                   {
                       switch ([_JXCategory_num intValue]) {
                           case 0://调度单
                           {
                               _nameArr = @[@"月台名称",@"班主名称",@"是否需要理贷",@"调度单状态"];
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                              
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/edit",Url_Sever];
                               [self postService:0];
                           }
                           break;
                               
                           case 1://预约信息
                           {
                               _nameArr = @[@"司机姓名",@"车牌号",@"司机电话",@"预约入场时间"];
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/edit",Url_Sever];
                               [self postService:0];
                           }
                           
                           break;
                           case 2://叉车工
                           {
                               NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                               
                               NSString * storageId=[userDefaults objectForKey:@"storageId"];
                               NSLog(@"------%@",storageId);
                               
                              _parameters=@{
                                          @"id":_user_Id,
                              };
                              _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository",Url_Sever];
                              [self postService:0];
                               
                               
                           }
                               break;
                               
                           case 3://搬运工
                           {
                              
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository",Url_Sever];
                               [self postService:0];
                           }
                           
                           break;
                           default:
               
                               break;
                       }
                       
                   }
                   break;
                   case 3://入库质检管理
                   {
                       switch ([_JXCategory_num intValue]) {
                           case 0://入库质检详情接口
                           {
                               _nameArr = @[@"质检状态",@"质检员",@"质检时间",@"质检评论"];
                               _parameters=@{
                                           @"id":_user_Id,
                               };
                              
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsQualityTesting/edit",Url_Sever];
                               [self postService:0];
                           }
                           break;
                               
                           case 1://入库质检详情接口1
                           {
                               _nameArr = @[@"订单编号",@"商户名称",@"预计入库时间",@"订单状态",@"备注"];
                               _parameters=@{
                                           @"orderNo":_Order_Num,
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                               [self postService:0];
                           }
                           
                           break;
                           case 2://入库质检详情接口2
                           {
                              _parameters=@{
                                          @"page":[NSString stringWithFormat:@"%d",_page],
                                          @"limit":@"10",
                                          @"total":@"",
                                          @"deleteFlag":@"",
                                          @"status":@"",
                                          @"orderNo":_Order_Num,
                              };
                              _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                              [self postService:1];
                               
                               
                           }
                               break;
                           
                           break;
                           default:
                           break;
                       }
                       
                       
                   }
                   break;
                   case 4://入库信息确认
                   {
                       switch ([_JXCategory_num intValue]) {
                           case 0:
                           {
                                
                               _nameArr = @[@"订单编号",@"订单状态",@"商户名称",@"是否需要人工",@"仓库名称",@"预计出库时间",@"是否开具冻检证",@"是否临时预约",@"是否需要理贷",@"备注"];
                               _parameters=@{
                                           @"orderNo":_Order_Num,
                               };
                              
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                               [self postService:0];
                           }
                           break;
                               
                           case 1:
                           {
                               // 预计货品
                               _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"orderNo":_Order_Num,
                                           @"storageMode":@"0",//出库1 入库0
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                               [self postService:1];
                           }
                           
                           break;
                           case 2:
                           {
                               //实际货品
                               _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"orderNo":_Order_Num,//出库1 入库0
                                           @"storageMode":@"0",
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsSpotGoodsDetail/getSpotDetail?id=%@",Url_Sever,_user_Id];
                               [self postService:1];
                               
                               
                           }
                               break;
                               
                           case 3:
                           {
                               //预约信息
                               _parameters=@{
                                           @"page":[NSString stringWithFormat:@"%d",_page],
                                           @"limit":@"10",
                                           @"orderNo":_Order_Num,
                                           @"storageMode":@"0",
                               };
                               _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                               [self postService:1];
                           }
                           
                           break;
                           default:
                           {
                           }
                               break;
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
            switch ([_collection_CellIndex intValue]) {
                case 0:// 出库订单列表
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                 _nameArr = @[@"订单编号",@"订单状态",@"商户名称",@"是否需要人工",@"仓库名称",@"预计出库时间",@"是否开具冻检证",@"是否临时预约",@"是否需要理贷",@"审核意见",@"备注"];
                                _parameters=@{
                                            @"orderNo":_Order_Num,
                                };
                               
                                _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                                [self postService:0];
                            }
                            break;
                                
                            case 1:
                            {
                                // 出库预计货品
                                _parameters=@{
                                            @"page":[NSString stringWithFormat:@"%d",_page],
                                            @"limit":@"10",
                                            @"orderNo":@"",
                                            @"storageMode":@"1",//出库1 入库0
                                };
                                _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                                [self postService:1];
                            }
                            
                            break;
                            case 2:
                            {
                                if ([_Order_Status intValue] == 5) {
                                                                     
                                 //实际货品
                                    _parameters=@{
                                                @"page":[NSString stringWithFormat:@"%d",_page],
                                                @"limit":@"10",
                                                @"orderNo":_Order_Num,//出库1 入库0
                                                @"storageMode":@"1",
                                    };
                                    _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsSpotGoodsDetail/getSpotDetail?pathvariable=%@",Url_Sever,_user_Id];
                                    [self postService:1];
                                 
                             }else{
                                 //预约信息
                                 _parameters=@{
                                             @"page":[NSString stringWithFormat:@"%d",_page],
                                             @"limit":@"10",
                                             @"orderNo":_Order_Num,
                                             @"storageMode":@"1",
                                 };
                                 _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                                 [self postService:1];
                                 
                             }
                                
                                
                            }
                                break;
                                
                            case 3:
                            {
                                //货权转移信息
                                _parameters=@{
                                            @"page":[NSString stringWithFormat:@"%d",_page],
                                            @"limit":@"10",
                                            @"orderNo":@"",
                                            @"storageMode":@"1",
                                };
                                _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                                [self postService:1];
                            }
                            
                            break;
                            default:
                            {
                            }
                                break;
                        }
                        
                    }
                    break;
                case 1://出库门禁管理
                {
                    _nameArr = @[@"入库编号",@"司机名称",@"车牌号",@"司机电话",@"核载量(t)",@"预约入场时间"];
                    _parameters=@{
                                 @"id":@"",
                     };
                    
                     _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/edit",Url_Sever];
                     [self postService:0];
                    
                }
                break;
                case 2://出库作业信息接受
                {
                    switch ([_JXCategory_num intValue]) {
                        case 0://调度单
                        {
                            _nameArr = @[@"月台名称",@"班主名称",@"是否需要理贷",@"调度单状态"];
                            _parameters=@{
                                        @"id":_user_Id,
                            };
                           
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/edit",Url_Sever];
                            [self postService:0];
                        }
                        break;
                            
                        case 1://预约信息
                        {
                            _nameArr = @[@"司机姓名",@"车牌号",@"司机电话",@"预约入场时间"];
                            _parameters=@{
                                        @"id":_user_Id,
                            };
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsDispatchLeafets/edit",Url_Sever];
                            [self postService:0];
                        }
                        
                        break;
                        case 2://叉车工
                        {
                           _parameters=@{
                                       @"id":_user_Id,
                           };
                           _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository",Url_Sever];
                           [self postService:0];
                            
                            
                        }
                            break;
                            
                        case 3://搬运工
                        {
                           
                            _parameters=@{
                                        @"id":_user_Id,
                            };
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository",Url_Sever];
                            [self postService:0];
                        }
                        
                        break;
                        default:
            
                            break;
                    }
                    
                }
                break;

                case 3://出库信息确认
                {
                    switch ([_JXCategory_num intValue]) {
                        case 0:
                        {
                             
                            _nameArr = @[@"订单编号",@"订单状态",@"商户名称",@"是否需要人工",@"仓库名称",@"预计出库时间",@"是否开具冻检证",@"是否临时预约",@"是否需要理贷",@"备注"];
                            _parameters=@{
                                        @"orderNo":_Order_Num,
                            };
                           
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/edit",Url_Sever];
                            [self postService:0];
                        }
                        break;
                            
                        case 1:
                        {
                            // 预计货品
                            _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"orderNo":_Order_Num,
                                        @"storageMode":@"1",//出库1 入库0
                            };
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInoutDetail/pageList",Url_Sever];
                            [self postService:1];
                        }
                        
                        break;
                        case 2:
                        {
                            //实际货品
                            _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"orderNo":_Order_Num,
                                        @"storageMode":@"1",//出库1 入库0
                            };
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsSpotGoodsDetail/getSpotDetail?id=%@",Url_Sever,_user_Id];
                            [self postService:1];
                            
                            
                        }
                            break;
                            
                        case 3:
                        {
                            //预约信息
                            _parameters=@{
                                        @"page":[NSString stringWithFormat:@"%d",_page],
                                        @"limit":@"10",
                                        @"orderNo":_Order_Num,
                                        @"storageMode":@"1",
                            };
                            _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderInout/getOrderMake",Url_Sever];
                            [self postService:1];
                        }
                        
                        break;
                        default:
                        {
                        }
                            break;
                    }
                    
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
    
    
   

    
    
    
}

-(void)postService:(NSInteger)stetas{
    
    [self AllocdataSource];
    [_dataSource removeAllObjects];
   
    [SVProgressHUD show];
    
   
    
    //请求数据
    [PostService AFHTTPSessionManager:_UrlString method:@"POST" params:_parameters WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
       
        [SVProgressHUD dismiss];
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
            [SVProgressHUD dismissWithDelay:1.75];
            self.nodataImage.hidden = YES;
        }else{

            NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
            
            
            switch (stetas) {
                case 0:
                {
                    HomeModel *model=[[HomeModel alloc]init];
                    model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                    [model setValuesForKeysWithDictionary:responseObject[@"content"]];
                    [self.dataSource addObject:model];
                    [self.tableView reloadData];
                    
                    if ([model.storageId isEqualToString:@""]) {
                        
                    }else{
                        
                        
                        
                        
                        
                        
                        
//                         NSLog(@"-------%@",_storageId);
//                         _parameters=@{
//                                     @"storageId":model.storageId,
//                         };
//                         _UrlString = [NSString stringWithFormat:@"%@/api/wms/wmsStaff/getStaffToRepository/%@",Url_Sever,_shiftsId];
//                         [self postService:1];
                        
                    }
                    
                }
                    break;
                case 1:
                {
                    for (NSDictionary *newdict in responseObject[@"content"][@"rows"]) {
                        
                        RuKuModel *model=[[RuKuModel alloc]init];
                        model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                        [model setValuesForKeysWithDictionary:newdict];
                        [self.dataSource addObject:model];
                        [self.tableView reloadData];
                    }
                    
                    
                }
                    break;
                case 2:
                {
                    for (NSDictionary *newdict in responseObject[@"content"]) {
                        
                        RuKuModel *model=[[RuKuModel alloc]init];
                        model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
                        [model setValuesForKeysWithDictionary:newdict];
                        [self.dataSource addObject:model];
                        [self.tableView reloadData];
                    }
                    
                    
                }
                    break;
                    
                default:
                    break;
            }
            if (self.dataSource.count == 0) {
                
                self.nodataImage.hidden = NO;
            }else{
                self.nodataImage.hidden = YES;
            }
        }
        
    }];
    
}


-(void)GETService:(NSInteger)stetas{
    
    [self AllocdataSource];
    [_dataSource removeAllObjects];
   
    [SVProgressHUD show];
    
    
    //请求数据
    [PostService AFHTTPSessionManager:_UrlString method:@"GET" params:_parameters WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
       
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
                [self.tableView reloadData];
            }
            
            
            if (self.dataSource.count == 0) {
                
                self.nodataImage.hidden = NO;
            }else{
                self.nodataImage.hidden = YES;
            }
             [self.tableView reloadData];
        }
        
    }];
    
}


-(void)AllocdataSource
{
    if (!_dataSource) {
        _dataSource=[[NSMutableArray alloc]init];
    }
}


//
//-(void)setDataSource:(NSMutableArray *)dataSource{
//
//    if (_dataSource.count>0) {
//
//    }
//
//}





-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    switch (_state) {
        case ruku:
            {
                switch ([_collection_CellIndex intValue]) {
                    case 0://入库订单列表
                        {
                            switch ([_JXCategory_num intValue]) {
                                case 0:
                                {
                                    return 60;
                                }
                                break;
                                    
                                case 1:case 2:
                                {
                                    return 230;
                                }
                                
                                break;
                                case 3:
                                {
                                    //预约信息
                                    return 180;
                                }
                                
                                break;
                                default:
                                {
                                }
                                    break;
                            }
                            
                        }
                        break;
                    case 1:case 2://入库门禁管理 //作业信息接受
                    {
                       
                        return 60;
                    }
                    break;
                    case 3://入库质检管理
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:case 1:
                            {
                                return 60;
                            }
                            break;
                                
                            case 2:
                            {
                                return 230;
                            }
                            
                            break;
                           
                            break;
                            default:

                            break;
                        }
                    }
                    break;
                    case 4://入库信息确认
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                return 60;
                            }
                            break;
                                
                            case 1:case 2:
                            {
                                return 230;
                            }
                            
                            break;
                            case 3:
                            {
                                //预约信息
                                return 180;
                            }
                            
                            break;
                            default:
                            {
                            }
                                break;
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
            
            
        }
            break;
            
        case chuku:
        {
            switch ([_collection_CellIndex intValue]) {
                case 0://chuku订单列表
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                return 60;
                            }
                            break;
                                
                            case 1:case 2:
                            {
                                return 230;
                            }
                            
                            break;
                            case 3:
                            {
                                //预约信息
                                return 180;
                            }
                            
                            break;
                            default:
                            {
                            }
                                break;
                        }
                        
                    }
                    break;
                case 1:case 2://入库门禁管理 //作业信息接受
                {
                   
                    return 60;
                }
                break;
                case 3://入库质检管理
                {
                    switch ([_JXCategory_num intValue]) {
                        case 0:case 1:
                        {
                            return 60;
                        }
                        break;
                            
                        case 2:
                        {
                            return 230;
                        }
                        
                        break;
                       
                        break;
                        default:

                        break;
                    }
                }
                break;
                case 4://入库信息确认
                {
                    switch ([_JXCategory_num intValue]) {
                        case 0:
                        {
                            return 60;
                        }
                        break;
                            
                        case 1:case 2:
                        {
                            return 230;
                        }
                        
                        break;
                        case 3:
                        {
                            //预约信息
                            return 180;
                        }
                        
                        break;
                        default:
                        {
                        }
                            break;
                    }
                    
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
    
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    switch (_state) {
        case ruku:
            {
                switch ([_collection_CellIndex intValue]) {
                    case 0://入库订单列表
                        {
                            switch ([_JXCategory_num intValue]) {
                                case 0:
                                {
                                    return _nameArr.count;
                                }
                                break;
                                    
                                case 1:case 2:case 3 :
                                {
                                    return _dataSource.count;
                                }
                                break;
                                default:
                                break;
                            }
                            
                        }
                        break;
                    case 1:case 2://入库门禁管理 //作业信息接受
                    {
                       
                        return _nameArr.count;
                    }
                    break;
                    case 3://入库质检管理
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:case 1:
                            {
                                return _nameArr.count;
                            }
                            break;
                                
                            case 2:
                            {
                                return _dataSource.count;
                            }
                            
                            break;
                           
                            break;
                            default:

                            break;
                        }
                        
                    }
                    break;
                    case 4://入库信息确认
                    {
                        switch ([_JXCategory_num intValue]) {
                                           case 0:
                                           {
                                               return _nameArr.count;
                                           }
                                           break;
                                               
                                           case 1:case 2:case 3 :
                                           {
                                               return _dataSource.count;
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
                
            }
            break;
            
        case kunei:{
            switch ([_collection_CellIndex intValue]) {
                case 0://入库订单列表
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                return _nameArr.count;
                            }
                            break;
                                
                            case 1:case 2:case 3 :
                            {
                                return _dataSource.count;
                            }
                            break;
                            default:
                            break;
                        }
                        
                    }
                    break;
                case 1:case 2://入库门禁管理 //作业信息接受
                {
                   
                    return _nameArr.count;
                }
                break;
                case 3://入库质检管理
                {
                    switch ([_JXCategory_num intValue]) {
                        case 0:case 1:
                        {
                            return _nameArr.count;
                        }
                        break;
                            
                        case 2:
                        {
                            return _dataSource.count;
                        }
                        
                        break;
                       
                        break;
                        default:

                        break;
                    }
                    
                }
                break;
                case 4://入库信息确认
                {
                    switch ([_JXCategory_num intValue]) {
                                       case 0:
                                       {
                                           return _nameArr.count;
                                       }
                                       break;
                                           
                                       case 1:case 2:case 3 :
                                       {
                                           return _dataSource.count;
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
            
        }
            break;
            
        case chuku:{
            
            switch ([_collection_CellIndex intValue]) {
                case 0://出库订单列表
                    {
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                return _nameArr.count;
                            }
                            break;
                                
                            case 1:case 2:case 3 :
                            {
                                return _dataSource.count;
                            }
                            break;
                            default:
                            break;
                        }
                        
                    }
                    break;
                case 1:case 2://入库门禁管理 //作业信息接受
                {
                   
                    return _nameArr.count;
                }
                break;
                case 3://入库质检管理
                {
                    switch ([_JXCategory_num intValue]) {
                        case 0:case 1:
                        {
                            return _nameArr.count;
                        }
                        break;
                            
                        case 2:
                        {
                            return _dataSource.count;
                        }
                        
                        break;
                       
                        break;
                        default:

                        break;
                    }
                    
                }
                break;
                case 4://入库信息确认
                {
                    switch ([_JXCategory_num intValue]) {
                                       case 0:
                                       {
                                           return _nameArr.count;
                                       }
                                       break;
                                           
                                       case 1:case 2:case 3 :
                                       {
                                           return _dataSource.count;
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
            
        }
            break;
        default:
            break;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
    if(!cell){
        cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
    }
    
    switch (_state) {
        case ruku:
            {
                switch ([_collection_CellIndex intValue]) {
                    case 0:{
                        
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                               
                                OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                                if(!cell){
                                    cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                                }
                                
                                    if (_dataSource.count>0) {
                                        HomeModel * model=_dataSource[0];
                                        
                                        NSString * orderStatus = @"";
                                        switch ([model.orderStatus intValue]) {//0.已取消、1.编辑中、2.待审核、3.待入库、4.待确认、5. 已完成、9.审核驳回   通过 3 驳回 9
                                            case 0:
                                                
                                            orderStatus = @"已取消";
                                                break;
                                            case 1:
                                            orderStatus = @"编辑中";
                                            break;
                                                
                                            case 2:
                                            orderStatus = @"待审核";
                                            break;
                                                
                                            case 3:
                                            orderStatus = @"待入库";
                                            break;
                                                
                                            case 4:
                                            orderStatus = @"待确认";
                                            break;
                                                
                                            case 5:
                                            orderStatus = @"已完成";
                                            break;
                                                
                                            case 9:
                                            orderStatus = @"审核驳回";
                                            break;
                                                
                                            default:
                                                break;
                                        }
                                        
                                        if ([model.orderStatus intValue] == 2) {
                                            
                                            _buttonView.hidden = NO;
                                        }
                                        
                                        NSArray * titleArr=@[model.orderNo,orderStatus,model.companyName,model.arrivalTime,model.repoName,[NSString stringWithFormat:@"%@",[model.storageMode intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.temporary intValue] == 0  ? @"否" : @"是"],@"",@""];
                                        cell.orderLabel.text = _nameArr[indexPath.row];
                                        cell.titleLabel.text = titleArr[indexPath.row];
                                    }
                                
                                 return cell;
                            }
                            break;
                                
                            case 1:
                            {
                                TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                if(!cell){
                                    cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                       RuKuModel * model=_dataSource[indexPath.row];
                                       cell.model=model;
                                   }
                                
                                return cell;
                            }
                                
                            break;
                                
                            case 2:
                            {
                                
                                if ([_Order_Status intValue] == 5) {
                                    
                                    //实际货品
                                     TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                       if(!cell){
                                           cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                       }
                                       if (_dataSource.count>0) {
                                           RuKuModel * model=_dataSource[indexPath.row];
//                                           cell.model=model;
                                           cell.topOneLabel.text = @"存储区";
                                           cell.topTwoLabel.text = @"货品种类";
                                           cell.topThreeLabel.text = @"规格";
                                           cell.topFourLabel.text = @"数量";
                                           cell.topFiveLabel.text = @"净重(t)";
                                           cell.topSixLabel.text = @"毛重(t)";

                                           
                                           cell.bottomOneLabel.text = model.storageName;
                                           cell.bommotTwoLabel.text = model.goodsCategory;
                                           cell.bottomThreeLabel.text = model.specification;
                                           cell.bottomeFourLabel.text = model.totalNum;
                                           cell.bottomFiveLabel.text = model.totalWeight;
                                           cell.bommotSixLabel.text = model.actualWeight;
                                           cell.bossLabel.hidden = YES;
                                           cell.statusLabel.hidden = YES;
                                           
                                       }
                                    
                                    
                                       return cell;
                                    
                                }else{
                                    ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                    if(!cell){
                                        cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                    }
                                    if (_dataSource.count>0) {
                                        RuKuModel * model=_dataSource[indexPath.row];
                                        cell.model=model;
                                    }
                                    return cell;
                                    
                                }
                                
                            }
                            
                            break;
                                
                            case 3:
                            {
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                            break;
                            default:
                                break;
                        }
                        
                        
                        
                        
                    }
                    break;
                        
                    case 1:{//入库门禁管理
                        
                        OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                        if(!cell){
                            cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                        }
                        
                            if (_dataSource.count>0) {
                                HomeModel * model=_dataSource[0];
                                
                                _buttonView.hidden = NO;
                                [_bohuiButton setTitle:@"再次预约" forState:UIControlStateNormal];
//                  
                                _tongguoButton.hidden = YES;
                                NSArray * titleArr=@[model.detailId,model.driverName,model.driverPlateNo,model.driverPhone,model.makeWeight,model.makeTime];
                                _YuYueArr = titleArr;
                                cell.orderLabel.text = _nameArr[indexPath.row];
                                cell.titleLabel.text = titleArr[indexPath.row];
                            }
                        
                         return cell;
                        
                    }
                    break;
                        
                    case 2:{//入库作业信息接受
                        
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                
                                
                                OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                                if(!cell){
                                    cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                                }
                                
                                    if (_dataSource.count>0) {
                                        HomeModel * model=_dataSource[0];
                                        
                                        if ([model.orderStatus intValue] == 2) {
                                            
                                            _buttonView.hidden = NO;
                                        }
                                        
                                        NSArray * titleArr=@[model.name,model.shiftsName,[NSString stringWithFormat:@"%@",[model.tally intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.orderType intValue] == 0  ? @"已派单" : @"未派单"]];
                                        cell.orderLabel.text = _nameArr[indexPath.row];
                                        cell.titleLabel.text = titleArr[indexPath.row];
                                    }
                                
                                 return cell;
                            }
                            break;
                                
                            case 1:
                            {
                                
                                OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                                if(!cell){
                                    cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                                }
                                
                                    if (_dataSource.count>0) {
                                        HomeModel * model=_dataSource[0];
                                        
                                        if ([model.orderStatus intValue] == 2) {
                                            
                                            _buttonView.hidden = NO;
                                        }
                                        
                                        NSArray * titleArr=@[model.driverName,model.driverPlateNo,model.driverPhone,model.createTime];
                                        cell.orderLabel.text = _nameArr[indexPath.row];
                                        cell.titleLabel.text = titleArr[indexPath.row];
                                    }
                                
                                 return cell;
                            }
                                
                            break;
                                
                            case 2:
                            {
                                
                                if ([_JXCategory_num intValue] == 5) {
                                    
                                    //实际货品
                                     TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                       if(!cell){
                                           cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                       }
                                       if (_dataSource.count>0) {
                                           RuKuModel * model=_dataSource[indexPath.row];
                                           cell.model=model;
                                       }
                                       return cell;
                                    
                                }else{
                                    ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                    if(!cell){
                                        cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                    }
                                    if (_dataSource.count>0) {
                                        RuKuModel * model=_dataSource[indexPath.row];
                                        cell.model=model;
                                    }
                                    return cell;
                                    
                                }
                                
                            }
                            
                            break;
                                
                            case 3:
                            {
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                            break;
                            default:
                                break;
                        }
                        
                    }
                    
                    break;
                        
                    case 3:{//入库质检管理
                        
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                                OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                                if(!cell){
                                    cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                                }
                                
                                    if (_dataSource.count>0) {
                                        HomeModel * model=_dataSource[0];
                                        
                                        if ([model.orderStatus intValue] == 2) {
                                            
                                            _buttonView.hidden = NO;
                                        }
                                        
                                        NSArray * titleArr=@[[NSString stringWithFormat:@"%@",[model.status intValue] == 0  ? @"合格" : @"不合格"],model.operatorName,model.createTime,model.result];
                                        cell.orderLabel.text = _nameArr[indexPath.row];
                                        cell.titleLabel.text = titleArr[indexPath.row];
                                    }
                                
                                 return cell;
                            }
                            break;
                                
                            case 1:
                            {
                                
                                OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                                if(!cell){
                                    cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                                }
                                
                                    if (_dataSource.count>0) {
                                        HomeModel * model=_dataSource[0];
                                        
                                        if ([model.orderStatus intValue] == 2) {
                                            
                                            _buttonView.hidden = NO;
                                        }
                                        
                                        NSString * orderStatus = @"";
                                        switch ([model.orderStatus intValue]) {//0.已取消、1.编辑中、2.待审核、3.待入库、4.待确认、5. 已完成、9.审核驳回   通过 3 驳回 9
                                            case 0:
                                                
                                            orderStatus = @"已取消";
                                                break;
                                            case 1:
                                            orderStatus = @"编辑中";
                                            break;
                                                
                                            case 2:
                                            orderStatus = @"待审核";
                                            break;
                                                
                                            case 3:
                                            orderStatus = @"待入库";
                                            break;
                                                
                                            case 4:
                                            orderStatus = @"待确认";
                                            break;
                                                
                                            case 5:
                                            orderStatus = @"已完成";
                                            break;
                                                
                                            case 9:
                                            orderStatus = @"审核驳回";
                                            break;
                                                
                                            default:
                                                break;
                                        }
                                        
                                        NSArray * titleArr=@[model.orderNo,model.companyName,model.operateTime,orderStatus,@""];
                                        cell.orderLabel.text = _nameArr[indexPath.row];
                                        cell.titleLabel.text = titleArr[indexPath.row];
                                    }
                                
                                 return cell;
                            }
                                
                            break;
                                
                            case 2:
                            {
                                
                                TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                if(!cell){
                                    cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                            break;
                                
                            case 3:
                            {
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                            break;
                            default:
                                break;
                        }
                    }
                        
                    
                    break;
                        
                    case 4:{//入库信息确认
                        
                        
                        switch ([_JXCategory_num intValue]) {
                            case 0:
                            {
                               
                                OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                                if(!cell){
                                    cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                                }
                                
                                    if (_dataSource.count>0) {
                                        HomeModel * model=_dataSource[0];
                                        
                                        NSString * orderStatus = @"";
                                        switch ([model.orderStatus intValue]) {//0.已取消、1.编辑中、2.待审核、3.待入库、4.待确认、5. 已完成、9.审核驳回   通过 3 驳回 9
                                            case 0:
                                                
                                            orderStatus = @"已取消";
                                                break;
                                            case 1:
                                            orderStatus = @"编辑中";
                                            break;
                                                
                                            case 2:
                                            orderStatus = @"待审核";
                                            break;
                                                
                                            case 3:
                                            orderStatus = @"待入库";
                                            break;
                                                
                                            case 4:
                                            orderStatus = @"待确认";
                                            break;
                                                
                                            case 5:
                                            orderStatus = @"已完成";
                                            break;
                                                
                                            case 9:
                                            orderStatus = @"审核驳回";
                                            break;
                                                
                                            default:
                                                break;
                                        }
                                        
                                        if ([model.orderStatus intValue] == 2) {
                                            
                                            _buttonView.hidden = NO;
                                        }
                                        
                                        NSArray * titleArr=@[model.orderNo,orderStatus,model.companyName,[NSString stringWithFormat:@"%@",[model.artificialFlag intValue] == 0  ? @"否" : @"是"],model.repoName,model.arrivalTime,model.arrivalTime,[NSString stringWithFormat:@"%@",[model.temporary intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.tally intValue] == 0  ? @"否" : @"是"],@""];
                                        cell.orderLabel.text = _nameArr[indexPath.row];
                                        cell.titleLabel.text = titleArr[indexPath.row];
                                    }
                                
                                 return cell;
                            }
                            break;
                                
                            case 1:
                            {
                                TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                if(!cell){
                                    cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                       RuKuModel * model=_dataSource[indexPath.row];
                                       cell.model=model;
                                   }
                                
                                return cell;
                            }
                                
                            break;
                                
                            case 2:
                            {
                                
                                if ([_JXCategory_num intValue] == 5) {
                                    
                                    //实际货品
                                     TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                       if(!cell){
                                           cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                       }
                                       if (_dataSource.count>0) {
                                           RuKuModel * model=_dataSource[indexPath.row];
                                           cell.model=model;
                                       }
                                       return cell;
                                    
                                }else{
                                    ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                    if(!cell){
                                        cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                    }
                                    if (_dataSource.count>0) {
                                        RuKuModel * model=_dataSource[indexPath.row];
                                        cell.model=model;
                                    }
                                    return cell;
                                    
                                }
                                
                            }
                            
                            break;
                                
                            case 3:
                            {
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
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
                
            }
            break;
        case kunei:{
            
        }
            break;
            
        case chuku:{
            
            switch ([_collection_CellIndex intValue]) {
                case 0:{
                    
                    switch ([_JXCategory_num intValue]) {
                        case 0:
                        {
                           
                            OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                            if(!cell){
                                cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                            }
                            
                                if (_dataSource.count>0) {
                                    HomeModel * model=_dataSource[0];
                                    
                                    NSString * orderStatus = @"";
                                    switch ([model.orderStatus intValue]) {//0.已取消、1.编辑中、2.待审核、3.待入库、4.待确认、5. 已完成、9.审核驳回   通过 3 驳回 9
                                        case 0:
                                            
                                        orderStatus = @"已取消";
                                            break;
                                        case 1:
                                        orderStatus = @"编辑中";
                                        break;
                                            
                                        case 2:
                                        orderStatus = @"待审核";
                                        break;
                                            
                                        case 3:
                                        orderStatus = @"待入库";
                                        break;
                                            
                                        case 4:
                                        orderStatus = @"待确认";
                                        break;
                                            
                                        case 5:
                                        orderStatus = @"已完成";
                                        break;
                                            
                                        case 9:
                                        orderStatus = @"审核驳回";
                                        break;
                                            
                                        default:
                                            break;
                                    }
                                    
                                    if ([model.orderStatus intValue] == 2) {
                                        
                                        _buttonView.hidden = NO;
                                    }
//     [@"订单编号",@"订单状态",@"商户名称",@"是否需要人工",@"仓库名称",@"预计出库时间",@"是否开具冻检证",@"是否临时预约",@"是否需要理贷",@"审核意见",@"备注"];
                                    NSArray * titleArr=@[model.orderNo,orderStatus,model.companyName,[NSString stringWithFormat:@"%@",[model.artificialFlag intValue] == 0  ? @"否" : @"是"],model.repoName,model.arrivalTime,[NSString stringWithFormat:@"%@",[model.storageMode intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.temporary intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.tally intValue] == 0  ? @"否" : @"是"],@"",[NSString stringWithFormat:@"%@",model.remark],];
                                    cell.orderLabel.text = _nameArr[indexPath.row];
                                    cell.titleLabel.text = titleArr[indexPath.row];
                                }
                            
                             return cell;
                        }
                        break;
                            
                        case 1:
                        {
                            TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                            if(!cell){
                                cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                            }
                            if (_dataSource.count>0) {
                                   RuKuModel * model=_dataSource[indexPath.row];
                                   cell.model=model;
                               }
                            
                            return cell;
                        }
                            
                        break;
                            
                        case 2:
                        {
                            
                            if ([_JXCategory_num intValue] == 5) {
                                
                                //实际货品
                                 TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                   if(!cell){
                                       cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                   }
                                   if (_dataSource.count>0) {
                                       RuKuModel * model=_dataSource[indexPath.row];
                                       cell.model=model;
                                   }
                                   return cell;
                                
                            }else{
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                        }
                        
                        break;
                            
                        case 3:
                        {
                            ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                            if(!cell){
                                cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                            }
                            if (_dataSource.count>0) {
                                RuKuModel * model=_dataSource[indexPath.row];
                                cell.model=model;
                            }
                            return cell;
                            
                        }
                        
                        break;
                        default:
                            break;
                    }
                    
                    
                    
                    
                }
                break;
                    
                case 1:{//入库门禁管理
                    
                    OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                    if(!cell){
                        cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                    }
                    
                        if (_dataSource.count>0) {
                            HomeModel * model=_dataSource[0];
                            
                            if ([model.orderStatus intValue] == 2) {
                                
                                _buttonView.hidden = NO ;
                            }
                            
                            NSArray * titleArr=@[model.detailId,model.driverName,model.driverPlateNo,model.driverPhone,model.makeWeight,model.makeTime];
                            cell.orderLabel.text = _nameArr[indexPath.row];
                            cell.titleLabel.text = titleArr[indexPath.row];
                        }
                    
                     return cell;
                    
                }
                break;
                    
                case 2:{//入库作业信息接受
                    
                    switch ([_JXCategory_num intValue]) {
                        case 0:
                        {
                            
                            
                            OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                            if(!cell){
                                cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                            }
                            
                                if (_dataSource.count>0) {
                                    HomeModel * model=_dataSource[0];
                                    
                                    if ([model.orderStatus intValue] == 2) {
                                        
                                        _buttonView.hidden = NO;
                                    }
                                    
                                    NSArray * titleArr=@[model.name,model.shiftsName,[NSString stringWithFormat:@"%@",[model.tally intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.orderType intValue] == 0  ? @"已派单" : @"未派单"]];
                                    cell.orderLabel.text = _nameArr[indexPath.row];
                                    cell.titleLabel.text = titleArr[indexPath.row];
                                }
                            
                             return cell;
                        }
                        break;
                            
                        case 1:
                        {
                            
                            OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                            if(!cell){
                                cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                            }
                            
                                if (_dataSource.count>0) {
                                    HomeModel * model=_dataSource[0];
                                    
                                    if ([model.orderStatus intValue] == 2) {
                                        
                                        _buttonView.hidden = NO;
                                    }
                                    
                                    NSArray * titleArr=@[model.driverName,model.driverPlateNo,model.driverPhone,model.makeTime];
                                    cell.orderLabel.text = _nameArr[indexPath.row];
                                    cell.titleLabel.text = titleArr[indexPath.row];
                                }
                            
                             return cell;
                        }
                            
                        break;
                            
                        case 2:
                        {
                            
                            if ([_JXCategory_num intValue] == 5) {
                                
                                //实际货品
                                 TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                   if(!cell){
                                       cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                   }
                                   if (_dataSource.count>0) {
                                       RuKuModel * model=_dataSource[indexPath.row];
                                       cell.model=model;
                                   }
                                   return cell;
                                
                            }else{
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                        }
                        
                        break;
                            
                        case 3:
                        {
                            ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                            if(!cell){
                                cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                            }
                            if (_dataSource.count>0) {
                                RuKuModel * model=_dataSource[indexPath.row];
                                cell.model=model;
                            }
                            return cell;
                            
                        }
                        
                        break;
                        default:
                            break;
                    }
                    
                }
                
                break;
                    
                case 3:{//  出库信息确认
                    
                    
                    switch ([_JXCategory_num intValue]) {
                        case 0:
                        {
                           
                            OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
                            if(!cell){
                                cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
                            }
                            
                                if (_dataSource.count>0) {
                                    HomeModel * model=_dataSource[0];
                                    
                                    NSString * orderStatus = @"";
                                    switch ([model.orderStatus intValue]) {//0.已取消、1.编辑中、2.待审核、3.待入库、4.待确认、5. 已完成、9.审核驳回   通过 3 驳回 9
                                        case 0:
                                            
                                        orderStatus = @"已取消";
                                            break;
                                        case 1:
                                        orderStatus = @"编辑中";
                                        break;
                                            
                                        case 2:
                                        orderStatus = @"待审核";
                                        break;
                                            
                                        case 3:
                                        orderStatus = @"待入库";
                                        break;
                                            
                                        case 4:
                                        orderStatus = @"待确认";
                                        break;
                                            
                                        case 5:
                                        orderStatus = @"已完成";
                                        break;
                                            
                                        case 9:
                                        orderStatus = @"审核驳回";
                                        break;
                                            
                                        default:
                                            break;
                                    }
                                    
                                    if ([model.orderStatus intValue] == 2) {
                                        
                                        _buttonView.hidden = NO;
                                    }
                                    
                                    NSArray * titleArr=@[model.orderNo,orderStatus,model.companyName,[NSString stringWithFormat:@"%@",[model.artificialFlag intValue] == 0  ? @"否" : @"是"],model.repoName,model.arrivalTime,model.arrivalTime,[NSString stringWithFormat:@"%@",[model.temporary intValue] == 0  ? @"否" : @"是"],[NSString stringWithFormat:@"%@",[model.tally intValue] == 0  ? @"否" : @"是"],@""];
                                    cell.orderLabel.text = _nameArr[indexPath.row];
                                    cell.titleLabel.text = titleArr[indexPath.row];
                                }
                            
                             return cell;
                        }
                        break;
                            
                        case 1:
                        {
                            TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                            if(!cell){
                                cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                            }
                            if (_dataSource.count>0) {
                                   RuKuModel * model=_dataSource[indexPath.row];
                                   cell.model=model;
                               }
                            
                            return cell;
                        }
                            
                        break;
                            
                        case 2:
                        {
                            
                            if ([_JXCategory_num intValue] == 5) {
                                
                                //实际货品
                                 TStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TStatusTableViewCell"];
                                   if(!cell){
                                       cell = [[TStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TStatusTableViewCell"];
                                   }
                                   if (_dataSource.count>0) {
                                       RuKuModel * model=_dataSource[indexPath.row];
                                       cell.model=model;
                                   }
                                   return cell;
                                
                            }else{
                                ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                                if(!cell){
                                    cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                                }
                                if (_dataSource.count>0) {
                                    RuKuModel * model=_dataSource[indexPath.row];
                                    cell.model=model;
                                }
                                return cell;
                                
                            }
                            
                        }
                        
                        break;
                            
                        case 3:
                        {
                            ThStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThStatusTableViewCell"];
                            if(!cell){
                                cell = [[ThStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ThStatusTableViewCell"];
                            }
                            if (_dataSource.count>0) {
                                RuKuModel * model=_dataSource[indexPath.row];
                                cell.model=model;
                            }
                            return cell;
                            
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
            
            
            
        }
            break;
            
        default:
            break;
    }

    return cell;
    
}





@end
