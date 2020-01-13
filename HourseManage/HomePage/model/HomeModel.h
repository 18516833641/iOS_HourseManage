//
//  HomeModel.h
//  HourseManage
//
//  Created by mac on 2019/11/29.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeModel : NSObject

@property(nonatomic,copy)NSString * modelState;//

#pragma mark ====出库订单管理列表
@property (nonatomic,copy)NSString *actualWeight;//
@property (nonatomic,copy)NSString *arrival_time;//
@property (nonatomic,copy)NSString *artificial_flag;//
@property (nonatomic,copy)NSString *company_name;//
@property (nonatomic,copy)NSString *confirm_business;//
@property (nonatomic,copy)NSString *confirm_wd;//
@property (nonatomic,copy)NSString *create_time;//
@property (nonatomic,copy)NSString *create_type;//
@property (nonatomic,copy)NSString *delete_flag;//
@property (nonatomic,copy)NSString *frozen_card;//
@property (nonatomic,copy)NSString *goodsNum;//
@property (nonatomic,copy)NSString *orderType;//
@property (nonatomic,copy)NSString *order_no;//
@property (nonatomic,copy)NSString *order_status;//
@property (nonatomic,copy)NSString *remark;//
@property (nonatomic,copy)NSString *repository_id;//
@property (nonatomic,copy)NSString *storage_mode;//
@property (nonatomic,copy)NSString *tally;//
@property (nonatomic,copy)NSString *temporary;//
@property (nonatomic,copy)NSString *update_time;//
@property (nonatomic,copy)NSString *user_id;//
@property (nonatomic,copy)NSString *repo_name;

#pragma mark ====出库门禁管理列表
@property (nonatomic,copy)NSString *companyName;//
@property (nonatomic,copy)NSString *detailId;//
@property (nonatomic,copy)NSString *driverName;//
@property (nonatomic,copy)NSString *driverPhone;//
@property (nonatomic,copy)NSString *driverPlateNo;//
//@property (nonatomic,copy)NSString *id;//
@property (nonatomic,copy)NSString *makeTime;//
@property (nonatomic,copy)NSString *makeWeight;//
@property (nonatomic,copy)NSString *status;//
@property (nonatomic,copy)NSString *storageId;//
@property (nonatomic,copy)NSString *storageName;//

#pragma mark ====出库作业信息接受列表

#pragma mark ==== 出库信息确认列表
//@property (nonatomic,copy)NSString *actualWeight;//
//@property (nonatomic,copy)NSString *arrival_time;//
//@property (nonatomic,copy)NSString *artificial_flag;//
//@property (nonatomic,copy)NSString *company_name;//
//@property (nonatomic,copy)NSString *confirm_business;//
//
//@property (nonatomic,copy)NSString *confirm_wd;//
//@property (nonatomic,copy)NSString *create_time;//
//@property (nonatomic,copy)NSString *create_type;//
//@property (nonatomic,copy)NSString *delete_flag;//
//@property (nonatomic,copy)NSString *frozen_card;//
//@property (nonatomic,copy)NSString *goodsNum;//
//@property (nonatomic,copy)NSString *orderType;//
//@property (nonatomic,copy)NSString *order_no;//
//@property (nonatomic,copy)NSString *order_status;//
//@property (nonatomic,copy)NSString *remark;//
//@property (nonatomic,copy)NSString *repository_id;//
//@property (nonatomic,copy)NSString *storage_mode;//
//@property (nonatomic,copy)NSString *order_no;//
//@property (nonatomic,copy)NSString *tally;//
//@property (nonatomic,copy)NSString *temporary;//
//@property (nonatomic,copy)NSString *update_time;//
//@property (nonatomic,copy)NSString *user_id;//


#pragma mark =======库内库存管理
//@property (nonatomic,copy)NSString *actualWeight;//
@property (nonatomic,copy)NSString *createTime;//
@property (nonatomic,copy)NSString *deleteFlag;//
@property (nonatomic,copy)NSString *freezeActualWeight;//
@property (nonatomic,copy)NSString *freezeNumbers;//

@property (nonatomic,copy)NSString *freezeTotalNum;//
@property (nonatomic,copy)NSString *goodsCatName;//
@property (nonatomic,copy)NSString *goodsCode;//
@property (nonatomic,copy)NSString *goodsName;//
@property (nonatomic,copy)NSString *measurement;//
@property (nonatomic,copy)NSString *numbers;//
@property (nonatomic,copy)NSString *repoName;//
@property (nonatomic,copy)NSString *shipperName;//
@property (nonatomic,copy)NSString *specification;//
@property (nonatomic,copy)NSString *stockStatus;//
//@property (nonatomic,copy)NSString *storageId;//
//@property (nonatomic,copy)NSString *storageName;//
@property (nonatomic,copy)NSString *storageNo;//
@property (nonatomic,copy)NSString *supplierId;//
@property (nonatomic,copy)NSString *totalNum;//
@property (nonatomic,copy)NSString *updateTime;//
@property (nonatomic,copy)NSString *userId;//

@property (nonatomic,copy)NSString *stockOrderNo;//
@property (nonatomic,copy)NSString *carryTime;//

//@property (nonatomic,copy)NSString *supplierId;//
//@property (nonatomic,copy)NSString *totalNum;//
//@property (nonatomic,copy)NSString *updateTime;//
//@property (nonatomic,copy)NSString *userId;//



#pragma mark =======入库订单管理
@property (nonatomic,copy)NSString *totalWeight;
@property (nonatomic,copy)NSString *shiftsId;//
@property (nonatomic,copy)NSString *result;//
@property (nonatomic,copy)NSString *orderNo;//order_status
//@property (nonatomic,copy)NSString *order_status;



//入库详情
@property (nonatomic,copy)NSString *operateTime;
@property (nonatomic,copy)NSString *createType;//
@property (nonatomic,copy)NSString *ordertype;//
//@property (nonatomic,copy)NSString *temporary;//
//@property (nonatomic,copy)NSString *repoName;//
//@property (nonatomic,copy)NSString *orderNo;//
//@property (nonatomic,copy)NSString *userId;//
@property (nonatomic,copy)NSString *artificialFlag;//
@property (nonatomic,copy)NSString *orderStatus;//
//@property (nonatomic,copy)NSString *companyName;//
@property (nonatomic,copy)NSString *arrivalTime;//

@property (nonatomic,copy)NSString *storageMode;//
@property (nonatomic,copy)NSString *repositoryId;//
//@property (nonatomic,copy)NSString *tally;//





//@property (nonatomic,copy)NSString *arrival_time;//
//@property (nonatomic,copy)NSString *artificial_flag;//
//@property (nonatomic,copy)NSString *company_name;//
//@property (nonatomic,copy)NSString *company_name;//

//@property (nonatomic,copy)NSString *confirm_business;//
//@property (nonatomic,copy)NSString *confirm_wd;//
//@property (nonatomic,copy)NSString *create_time;//
//@property (nonatomic,copy)NSString *create_type;//
//@property (nonatomic,copy)NSString *delete_flag;//
//@property (nonatomic,copy)NSString *goodsNum;//
//@property (nonatomic,copy)NSString *orderType;//
//@property (nonatomic,copy)NSString *order_no;//
//@property (nonatomic,copy)NSString *order_status;//
//@property (nonatomic,copy)NSString *org_id;//
//
//@property (nonatomic,copy)NSString *repo_name;//
//@property (nonatomic,copy)NSString *repository_id;//
//@property (nonatomic,copy)NSString *storage_mode;//
//@property (nonatomic,copy)NSString *tally;//
//@property (nonatomic,copy)NSString *temporary;//
//
//@property (nonatomic,copy)NSString *update_time;//
//@property (nonatomic,copy)NSString *user_id;//

#pragma mark =======入库作业接受管理
//@property (nonatomic,copy)NSString *artificialFlag;//
//@property (nonatomic,copy)NSString *driverPhone;//
//@property (nonatomic,copy)NSString *driverPlateNo;//
//@property (nonatomic,copy)NSString *goodsProduct;//
@property (nonatomic,copy)NSString *inoutId;//


@property (nonatomic,copy)NSString *makeappoinId;//
@property (nonatomic,copy)NSString *name;//
//@property (nonatomic,copy)NSString *orderType;//
//@property (nonatomic,copy)NSString *repositoryId;//
@property (nonatomic,copy)NSString *shiftsName;//
//@property (nonatomic,copy)NSString *status;//


#pragma mark ===入库质检管理详情
//@property (nonatomic,copy)NSString *result;//
//@property (nonatomic,copy)NSString *createTime;//
@property (nonatomic,copy)NSString *operatorName;//
//@property (nonatomic,copy)NSString *status;//
@property (nonatomic,assign)NSArray *attName;//


@property (nonatomic,copy)NSString *wdtID;//


@end

NS_ASSUME_NONNULL_END
