//
//  ThStatusTableViewCell.m
//  HourseManage
//
//  Created by mac on 2019/12/26.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "ThStatusTableViewCell.h"
#import "RuKuModel.h"

@implementation ThStatusTableViewCell


//{
//  "detailId" : "WI20191226000006",
//  "driverName" : "kcm",
//  "makeWeight" : "33",
//  "id" : "39a5c4abff144f31bcd43730d4eff169",
//  "storageName" : "1223测试",
//  "driverPhone" : "18810359884",
//  "storageId" : "658691731830603776",
//  "deleteFlag" : "0",
//  "makeTime" : "2019-12-27 00:00,2019-12-28 23:59",
//  "driverPlateNo" : "蒙A98752"
//}


-(void)setModel:(RuKuModel *)model{
    
    
    _titleLabel.text = [NSString stringWithFormat:@"司机姓名:%@",model.driverName];
    
//    _statusLabel.hidden = YES;
    _rightLabel.text = [NSString stringWithFormat:@"车牌号:%@",model.driverPlateNo];
    
    _topOneLabel.text = @"司机电话";
    
    _bottomOneLabel.text = model.driverPhone;
    
    _topTwoLabel.text = @"核载量(t)";
    
    _bottomTwoLabel.text = model.makeWeight;
    
    _topThreeLabel.text = @"预约存储区";
    
    _bottomLabel.text = model.storageName;
    
    _BossOneLabel.hidden = YES;
    
    _BossTwoLabel.text = [NSString stringWithFormat:@"预约入场时间:%@",model.makeTime];
    
    
}

@end
