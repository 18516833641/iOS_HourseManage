//
//  AnalyticsViewController.h
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnalyticsViewController : UIViewController

typedef enum _WDTState {
    ruku,
    chuku,
    kunei
} WDTState;

- (void)hideTabBar;

- (void)showTabBar;

@end

NS_ASSUME_NONNULL_END
