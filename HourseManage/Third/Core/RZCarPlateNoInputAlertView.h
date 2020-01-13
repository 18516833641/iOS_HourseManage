//
//  RZCarPlateNoInputAlertView.h
//  HourseManage
//
//  Created by mac on 2019/12/7.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RZCarPlateNoInputComplete) (BOOL isCancel, NSString *plateNo);

@interface RZCarPlateNoInputAlertView : UIViewController

+ (instancetype)showToVC:(UIViewController *)vc plateNo:(NSString *)plateNo title:(NSString *)title plateLength:(NSUInteger)length complete:(RZCarPlateNoInputComplete)complete;

@property (nonatomic, copy) RZCarPlateNoInputComplete complete;

@end

NS_ASSUME_NONNULL_END
