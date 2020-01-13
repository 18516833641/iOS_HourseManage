//
//  AppDelegate.m
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "AppDelegate.h"

#import "LoginViewController.h"
#import "RootNavigationController.h"
#import "IQKeyboardManager.h"
#import "HomePageViewController.h"

#import "RootTabBarViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:YES];
    
    
    
    //这里记录是不是第一次登录 保存用户信息 跳转RootVC
    NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
    
    NSString * frist=[des objectForKey:@"ISFrist"];
    
    NSLog(@"--=--=-%@",frist);
    
    if ([frist intValue]==1) {
        
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        RootTabBarViewController*Root=[[RootTabBarViewController alloc]init];
        self.window.rootViewController=Root;
        
        [self.window makeKeyAndVisible];
        
    }else{
    
        self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.window.backgroundColor = [UIColor whiteColor];
        LoginViewController *Root=[[LoginViewController alloc]init];
        
        self.window.rootViewController=Root;
        
        [self.window makeKeyAndVisible];
        
    }
    
    
    
    return YES;
}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
