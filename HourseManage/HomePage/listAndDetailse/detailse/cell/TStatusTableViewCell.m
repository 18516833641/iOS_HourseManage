//
//  TStatusTableViewCell.m
//  HourseManage
//
//  Created by mac on 2019/12/21.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "TStatusTableViewCell.h"
#import "RuKuModel.h"

@implementation TStatusTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)setModel:(RuKuModel *)model
{
    _titleLabel.text = [NSString stringWithFormat:@"货品:%@",model.goodsProduct];
    
    _statusLabel.hidden = YES;
    
    _bottomOneLabel.text = [NSString stringWithFormat:@"%@",model.storageName];
    
    _bommotTwoLabel.text = [NSString stringWithFormat:@"%@",model.goodsCategory];
    
    _bottomThreeLabel.text = [NSString stringWithFormat:@"%@",model.specification];
    
    _bottomeFourLabel.text = [NSString stringWithFormat:@"%@",model.totalNum];
    
    _bottomFiveLabel.text = [NSString stringWithFormat:@"%@",model.totalWeight];
    
    _bommotSixLabel.text = [NSString stringWithFormat:@"%@",model.actualWeight];
    
    _boosTitleLabel.text = [NSString stringWithFormat:@"供应商:%@",model.userName];
    
    _bossLabel.hidden = YES;
    
    
}

@end
