//
//  RootNavigationController.m
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()

@end

@implementation RootNavigationController

+(void)initialize{
    //导航栏总体设置
    UINavigationBar * nacBar = [UINavigationBar appearance];
    nacBar.tintColor = [UIColor whiteColor];  // 设置返回等按钮的颜色
    nacBar.translucent = NO;  //设置模糊效果
    nacBar.barTintColor = Color_Base(45, 116, 214);
    
    
    
    //设置标题文本颜色
    NSMutableDictionary *arr = [NSMutableDictionary dictionary];
    arr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    arr[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    
    [nacBar setTitleTextAttributes:arr];
    
    
}

-(void)popself{
    
    [self popViewControllerAnimated:YES];
    
}

-(UIBarButtonItem*) createBackButton{
    
    UIImage *backButtonImage = [[UIImage imageNamed:@"fh_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    return [[UIBarButtonItem alloc]initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(popself)];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:animated];
    
    if (viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1) {
        
        viewController.navigationItem.leftBarButtonItem =[self createBackButton];
        
    }
    
}

@end
