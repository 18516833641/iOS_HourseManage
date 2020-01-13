//
//  TStatusTableViewCell.h
//  HourseManage
//
//  Created by mac on 2019/12/21.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RuKuModel;

@interface TStatusTableViewCell : UITableViewCell

@property (nonatomic,strong)RuKuModel   *model;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;



@property (weak, nonatomic) IBOutlet UILabel *topOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *topTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *topThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *topFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *topFiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *topSixLabel;


@property (weak, nonatomic) IBOutlet UILabel *bottomOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *bommotTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomeFourLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomFiveLabel;
@property (weak, nonatomic) IBOutlet UILabel *bommotSixLabel;



@property (weak, nonatomic) IBOutlet UILabel *boosTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bossLabel;


@end

NS_ASSUME_NONNULL_END
