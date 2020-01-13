//
//  BaseTableViewCell.m
//  HourseManage
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(HomeModel *)model{
    
//
//    @property (nonatomic,copy)NSString *companyName;//
//@property (nonatomic,copy)NSString *detailId;//
//@property (nonatomic,copy)NSString *driverName;//
//@property (nonatomic,copy)NSString *driverPhone;//
//@property (nonatomic,copy)NSString *driverPlateNo;//
////@property (nonatomic,copy)NSString *id;//
//@property (nonatomic,copy)NSString *makeTime;//
//@property (nonatomic,copy)NSString *makeWeight;//
//@property (nonatomic,copy)NSString *status;//
//@property (nonatomic,copy)NSString *storageId;//
//@property (nonatomic,copy)NSString *storageName;//
    
    NSLog(@"======%@",model.modelState);
    
    switch ([model.modelState intValue]) {
            
#pragma mark =======出库
            
        case 0://出库订单管理
            
            switch ([model.order_status intValue]) {
                case 0:
                    _status.text = @"待入库";
                    break;
                    case 1:
                    _status.text = @"编辑中";
                    break;
                case 2:
                    _status.text = @"待审核";
                    break;
                    case 3:
                    _status.text = @"待入库";
                    break;
                    case 4:
                    _status.text = @"待确认";
                    break;
                    case 5:
                    _status.text = @"已完成";
                    break;
                    case 9:
                    _status.text = @"审核驳回";
                    break;
                    
                    
                default:
                    break;
            }
            
                _orderNumber.text = model.order_no;
            //
            //    status.text = model.
            //
                _ckmcLabel.text = model.repo_name;
            //
                _zjztLable.text = [NSString stringWithFormat:@"%@",model.actualWeight];
            //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.goodsNum];
            //
                _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.company_name];
            //
                _timeLabel.text = [NSString stringWithFormat:@"出库时间：%@",model.create_time];
            
            _shmcLabel.hidden = NO;
            
            _oneLable.text = @"仓库名称";
            
            _twoLabel.text = @"总净重(t)";
            
            _threeLabel.text = @"总数量";
            
            break;
        case 1://出库门禁管理
            _orderNumber.text = model.detailId;
        //
            _status.text = @"已预约";
        //
            _ckmcLabel.text = model.repoName;
        //
            _zjztLable.text = model.makeWeight;
        //
            _zjzsLabel.text = model.driverPhone;
        //
            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.companyName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"出库时间：%@",model.makeTime];
            
            _oneLable.text = @"仓库名称";
            
            _twoLabel.text = @"运载重量";
            
            _threeLabel.text = @"司机电话";
            
        break;
            
        case 2://出库作业接受信息
            switch ([model.status    intValue]) {
                case 0:
                    _status.text = @"已派单";
                    break;
                    case 1:
                    _status.text = @"未完成";
                    break;
                case 2:
                    _status.text = @"已完成";
                    break;
                    
                default:
                    break;
            }
            
         
            _orderNumber.text = model.inoutId;
            //
            //    status.text = model.
            //
                _ckmcLabel.text = model.name;
            //
                _zjztLable.text = [NSString stringWithFormat:@"%@",model.driverPlateNo];
            //
                _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.driverPhone];
            //
            //
                _timeLabel.text = [NSString stringWithFormat:@"班组名称：%@",model.shiftsName];
                
                _shmcLabel.hidden = YES;
                
                _oneLable.text = @"月台";
                
                _twoLabel.text = @"车牌号";
                
                _threeLabel.text = @"司机电话";
        break;
        
        case 3://出库信息确认
            
            switch ([model.order_status intValue]) {
                case 0:
                    _status.text = @"待入库";
                    break;
                    case 1:
                    _status.text = @"编辑中";
                    break;
                case 2:
                    _status.text = @"待审核";
                    break;
                    case 3:
                    _status.text = @"待入库";
                    break;
                    case 4:
                    _status.text = @"待确认";
                    break;
                    case 5:
                    _status.text = @"已出库";
                    break;
                    case 9:
                    _status.text = @"审核驳回";
                    break;
                    
                    
                default:
                    break;
            }
            
            
            _orderNumber.text = model.order_no;
            
            
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.company_name;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.totalWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.tally];
        //
//            _shmcLabel.text = [NSString stringWithFormat:@"名称：%@",model.repoName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"出库时间：%@",model.arrival_time];
            
            _shmcLabel.hidden = YES;
            
            _oneLable.text = @"仓库名称";
            
            _twoLabel.text = @"总净重(t)";
            
            _threeLabel.text = @"总数量";
            
        break;
#pragma mark =======库内
        case 4://库存管理
            
            _shmcLabel.hidden = NO;
            
            _oneLable.text = @"规格";
            
            _twoLabel.text = @"净重(t)";
            
            _threeLabel.text = @"数量";
            
            _orderNumber.text = [NSString stringWithFormat:@"货品名称:%@",model.goodsCatName];
        //
            _status.text = [NSString stringWithFormat:@"商户名称:%@",model.shipperName];
        //
            _ckmcLabel.text = [NSString stringWithFormat:@"%@",model.specification];
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.actualWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.numbers];
        //
            _shmcLabel.text = [NSString stringWithFormat:@"仓库名称：%@",model.repoName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"存储区名称：%@",model.storageName];
        break;
            
        case 5://库内管理
            
            switch ([model.status intValue]) {
                case 0:
                    _status.text = @"待入库";
                    break;
                    case 1:
                    _status.text = @"已提交";
                    break;
                case 2:
                    _status.text = @"待审核";
                    break;
                    case 3:
                    _status.text = @"待入库";
                    break;
                    case 4:
                    _status.text = @"待确认";
                    break;
                    case 5:
                    _status.text = @"已出库";
                    break;
                    case 9:
                    _status.text = @"审核驳回";
                    break;
                    
                    
                default:
                    break;
            }
            
            _shmcLabel.hidden = NO;
            
            _oneLable.text = @"商户名称";
            
            _twoLabel.text = @"总净重(t)";
            
            _threeLabel.text = @"数量";
            
            _orderNumber.text = model.stockOrderNo;
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.shipperName;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.totalWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.totalNum];
        //
            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.repoName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"预计搬运时间：%@",model.carryTime];
        break;
            
        case 6://作业信息接受
            _shmcLabel.hidden = YES;
            
            _oneLable.text = @"作业仓库";
            
            _twoLabel.text = @"作业存储区";
            
            _threeLabel.text = @"预计搬运时间";
            
            _orderNumber.text = model.goodsCode;
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.name;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.driverPlateNo];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.driverPhone];
        //
        //
            _timeLabel.text = [NSString stringWithFormat:@"出库时间：%@",model.createTime];
            
        break;
            
        case 7://库内作业信息确认
            
            switch ([model.order_status intValue]) {
                case 0:
                    _status.text = @"待入库";
                    break;
                    case 1:
                    _status.text = @"编辑中";
                    break;
                case 2:
                    _status.text = @"待审核";
                    break;
                    case 3:
                    _status.text = @"待入库";
                    break;
                    case 4:
                    _status.text = @"待确认";
                    break;
                    case 5:
                    _status.text = @"已完成";
                    break;
                    case 9:
                    _status.text = @"审核驳回";
                    break;
                    
                    
                default:
                    break;
            }
            
            _shmcLabel.hidden = NO;
            
            _oneLable.text = @"商户名称";
            
            _twoLabel.text = @"总净重(t)";
            
            _threeLabel.text = @"数量";
            
            _orderNumber.text = model.goodsCode;
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.repoName;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.actualWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.numbers];
        //
            _shmcLabel.text = [NSString stringWithFormat:@"货主名称：%@",model.shipperName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"仓库名称：%@",model.createTime];
        break;
#pragma mark =======入库
            
        case 8://入库订单管理
            _orderNumber.text = model.order_no;
        //
        //    status.text = model.
            
            switch ([model.order_status intValue]) {
                case 0:
                    _status.text = @"已取消";
                    break;
                    case 1:
                    _status.text = @"编辑中";
                    break;
                case 2:
                    _status.text = @"待审核";
                    break;
                    case 3:
                    _status.text = @"待入库";
                    break;
                    case 4:
                    _status.text = @"待确认";
                    break;
                    case 5:
                    _status.text = @"已完成";
                    break;
                    case 9:
                    _status.text = @"审核驳回";
                    break;
                    
                    
                default:
                    break;
            }
            
            _shmcLabel.hidden = NO;
            
            _oneLable.text = @"仓库名称";
            
            _twoLabel.text = @"总净重(t)";
            
            _threeLabel.text = @"货品种类数量";
        //
            _ckmcLabel.text = model.repo_name;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.totalWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.goodsNum];
        //
            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.company_name];
        //
            _timeLabel.text = [NSString stringWithFormat:@"入库时间：%@",model.arrival_time];
        break;
            
        case 9://入库门禁管理
            
            _shmcLabel.hidden = NO;
            _status.text = @"已预约";
            _oneLable.text = @"仓库名称";
            
            _orderNumber.text = model.detailId;
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.repoName;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.makeWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.driverPhone];
        //
            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.companyName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"入库时间：%@",model.makeTime];
            
            _twoLabel.text = @"运载重量";
            
            _threeLabel.text = @"司机电话";
        break;
            
        case 10://作业信息接受
            
            
            _shmcLabel.hidden = YES;
            
            _oneLable.text = @"月台";
            
            _twoLabel.text = @"车牌号";
            
            _threeLabel.text = @"司机电话";
            
            _orderNumber.text = model.inoutId;
            
            switch ([model.status intValue]) {
                case 0:
                    _status.text = @"已派单";
                    break;
                    case 1:
                    _status.text = @"未完成";
                    break;
                case 2:
                    _status.text = @"已完成";
                    break;
                    case 3:
                    _status.text = @"待入库";
                    break;
                    case 4:
                    _status.text = @"待确认";
                    break;
                    case 5:
                    _status.text = @"已完成";
                    break;
                    case 9:
                    _status.text = @"审核驳回";
                    break;
                    
                    
                default:
                    break;
            }
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.name;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.driverPlateNo];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.driverPhone];
        //
//            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.goodsProduct];
        //
            _timeLabel.text = [NSString stringWithFormat:@"班组名称：%@",model.shiftsName];
            
            
            
            
        break;
            
    
        case 11://入库质检管理
            
            _shmcLabel.hidden = YES;
            
            _oneLable.text = @"商户名称";
            
            _twoLabel.text = @"车牌号";
            
            _threeLabel.text = @"司机姓名";
            
            _orderNumber.text = model.orderNo;
        //
            _status.text = @"通过";
        //
            _ckmcLabel.text = model.companyName;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.driverPlateNo];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.driverName];
        //
//            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.shipperName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"质检员：%@",model.operatorName];
        break;
            
        case 12://入库信息确认
            
            
           _shmcLabel.hidden = YES;
                       
           _oneLable.text = @"商户名称";
           
           _twoLabel.text = @"货品净重(t)";
           
           _threeLabel.text = @"货品数量";
            
            _status.text = @"已入库";
            
            _orderNumber.text = model.order_no;
        //
        //    status.text = model.
        //
            _ckmcLabel.text = model.company_name;
        //
            _zjztLable.text = [NSString stringWithFormat:@"%@",model.totalWeight];
        //
            _zjzsLabel.text = [NSString stringWithFormat:@"%@",model.actualWeight];
        //
//            _shmcLabel.text = [NSString stringWithFormat:@"商户名称：%@",model.shipperName];
        //
            _timeLabel.text = [NSString stringWithFormat:@"入库时间：%@",model.arrival_time];
        break;

        default:
            break;
    }
    

    
    
}

@end
