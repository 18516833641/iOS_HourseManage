//
//  rukuDetaileViewController.h
//  HourseManage
//
//  Created by mac on 2019/12/21.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "AnalyticsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface rukuDetaileViewController : AnalyticsViewController<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>


@property (nonatomic,assign) WDTState state;

@property (nonatomic,copy)NSString            * collectionCellIndex;//  区分collectionViewcell

@property (nonatomic,copy)NSString            * OrderNum;// 订单号

@property (nonatomic,copy)NSString            * OrderStatus;// 订单状态

@property (nonatomic,copy)NSString            * userId;//商户id

@property (nonatomic,copy)NSString            * shiftsId;//shiftsId


//@property (nonatomic,copy)NSString            * OrderStatus;//

//@property (nonatomic,copy)NSString            * OrderNumber;//
//
//@property (nonatomic,copy)NSString            * cellstatus;//

//@property (nonatomic,copy)NSString            * userId;//商户id

@end

NS_ASSUME_NONNULL_END
