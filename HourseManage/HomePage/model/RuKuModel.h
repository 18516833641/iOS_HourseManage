//
//  RuKuModel.h
//  HourseManage
//
//  Created by mac on 2019/12/26.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuKuModel : NSObject


//入库详情预计货品
@property (nonatomic,copy)NSString *specification;//
@property (nonatomic,copy)NSString *totalWeight;//
@property (nonatomic,copy)NSString *actualWeight;//
@property (nonatomic,copy)NSString *status;//
@property (nonatomic,copy)NSString *storageName;//
@property (nonatomic,copy)NSString *storageId;//

@property (nonatomic,copy)NSString *deleteFlag;//
@property (nonatomic,copy)NSString *orderNo;//
@property (nonatomic,copy)NSString *totalNum;//

@property (nonatomic,copy)NSString *goodsCode;//
@property (nonatomic,copy)NSString *packagingCode;//
@property (nonatomic,copy)NSString *supplierId;//
@property (nonatomic,copy)NSString *measurement;//

@property (nonatomic,copy)NSString *packagingName;//
@property (nonatomic,copy)NSString *userName;//
@property (nonatomic,copy)NSString *goodsCategory;//
@property (nonatomic,copy)NSString *goodsCategoryCode;//
@property (nonatomic,copy)NSString *goodsProduct;//modelState

@property (nonatomic,copy)NSString *modelState;


//入库详情预约信息
@property (nonatomic,copy)NSString *detailId;//
@property (nonatomic,copy)NSString *driverName;//
@property (nonatomic,copy)NSString *makeWeight;//
//@property (nonatomic,copy)NSString *storageName;//
@property (nonatomic,copy)NSString *driverPhone;//
//@property (nonatomic,copy)NSString *storageId;//
//@property (nonatomic,copy)NSString *deleteFlag;//
@property (nonatomic,copy)NSString *makeTime;//
@property (nonatomic,copy)NSString *driverPlateNo;//


//入库详情实际信息
//@property (nonatomic,copy)NSString *specification;//
//@property (nonatomic,copy)NSString *totalWeight;//
//@property (nonatomic,copy)NSString *storageName;//
@property (nonatomic,copy)NSString *measName;//

@property (nonatomic,copy)NSString *maxNumbers;//
@property (nonatomic,copy)NSString *supplierName;//
//@property (nonatomic,copy)NSString *storageId;//
@property (nonatomic,copy)NSString *spotId;//
//@property (nonatomic,copy)NSString *deleteFlag;//
//@property (nonatomic,copy)NSString *supplierId;//
//@property (nonatomic,copy)NSString *totalNum;//
//@property (nonatomic,copy)NSString *goodsCode;//
//@property (nonatomic,copy)NSString *packagingCode;//
@property (nonatomic,copy)NSString *maxActual;//
//@property (nonatomic,copy)NSString *goodsCategory;//
//@property (nonatomic,copy)NSString *actualWeight;//
//@property (nonatomic,copy)NSString *goodsProduct;//





@property (nonatomic,copy)NSString *wdtID;//

@end

NS_ASSUME_NONNULL_END
