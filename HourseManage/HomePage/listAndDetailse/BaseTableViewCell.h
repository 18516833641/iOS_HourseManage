//
//  BaseTableViewCell.h
//  HourseManage
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HomeModel;
@interface BaseTableViewCell : UITableViewCell

@property (nonatomic,assign)NSInteger states;

@property (nonatomic,strong)HomeModel   *model;

@property (weak, nonatomic) IBOutlet UILabel *orderNumber;

@property (weak, nonatomic) IBOutlet UILabel *status;

@property (weak, nonatomic) IBOutlet UILabel *ckmcLabel;

@property (weak, nonatomic) IBOutlet UILabel *zjztLable;

@property (weak, nonatomic) IBOutlet UILabel *zjzsLabel;

@property (weak, nonatomic) IBOutlet UILabel *shmcLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@property (weak, nonatomic) IBOutlet UILabel *oneLable;

@property (weak, nonatomic) IBOutlet UILabel *twoLabel;

@property (weak, nonatomic) IBOutlet UILabel *threeLabel;
@end

NS_ASSUME_NONNULL_END
