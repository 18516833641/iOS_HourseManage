//
//  ThStatusTableViewCell.h
//  HourseManage
//
//  Created by mac on 2019/12/26.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RuKuModel;

@interface ThStatusTableViewCell : UITableViewCell

@property (nonatomic,strong)RuKuModel   *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@property (weak, nonatomic) IBOutlet UILabel *topOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *topTwoLabel;


@property (weak, nonatomic) IBOutlet UILabel *bottomOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomTwoLabel;

@property (weak, nonatomic) IBOutlet UILabel *topThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

@property (weak, nonatomic) IBOutlet UILabel *BossOneLabel;

@property (weak, nonatomic) IBOutlet UILabel *BossTwoLabel;
@end

NS_ASSUME_NONNULL_END
