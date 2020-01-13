//
//  rukuDetaileListViewController.h
//  HourseManage
//
//  Created by mac on 2019/12/21.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "AnalyticsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface rukuDetaileListViewController : AnalyticsViewController<JXCategoryListContentViewDelegate>

@property (nonatomic,assign) WDTState state;

@property (nonatomic,copy)NSString            * collection_CellIndex;//区分collectionViewcell

@property (nonatomic,copy)NSString            * Order_Num;// 订单号

@property (nonatomic,copy)NSString            * Order_Status;// 订单状态

@property (nonatomic,copy)NSString            * user_Id;//商户id


//@property (nonatomic,copy)NSString            * shiftsId;//shiftsId

@property (nonatomic,copy)NSString            * JXCategory_num;
//


//@property (nonatomic, assign) BOOL              islist;
//
@end

NS_ASSUME_NONNULL_END
