//
//  PersonVersionViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/23.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PersonVersionViewController.h"

@interface PersonVersionViewController ()

@end

@implementation PersonVersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self postService];
}


-(void)postService{
   
    [SVProgressHUD show];
       
       
    NSString *urlString = [NSString stringWithFormat:@"%@/api/admin/dict/getAll",Url_Sever];
    
    //请求数据
    [PostService AFHTTPSessionManager:urlString method:@"GET" params:@{@"":@""}WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
       
        [SVProgressHUD dismiss];
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
        }else{

            NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
            
//            if ([responseObject[@"status"] intValue] == 40301) {
//
//                NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//                NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
//                [defautls removePersistentDomainForName:appDomain];
//
//                return;
//
//            }
//
//            for (NSDictionary *newdict in responseObject[@"content"][@"data"][@"rows"]) {
//
//
////
////                HomeModel *model=[[HomeModel alloc]init];
////                model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
////                [model setValuesForKeysWithDictionary:newdict];
////                [self.dataSource addObject:model];
////                [self.uitableView reloadData];
//            }
//
//            for (NSDictionary *newdict in responseObject[@"content"][@"rows"]) {
//
//                if ([responseObject[@"status"] intValue] == 40301){
//
//                    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//                    NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
//                    [defautls removePersistentDomainForName:appDomain];
//
//                    __unsafe_unretained __typeof(self) weakSelf = self;
//                    LoginViewController *tab = [[LoginViewController alloc]init];
//                    weakSelf.view.window.rootViewController = tab;
//
//                    return;
//
//                }
//
//                HomeModel *model=[[HomeModel alloc]init];
//                model.modelState = [NSString stringWithFormat:@"%ld",(long)stetas];
//                [model setValuesForKeysWithDictionary:newdict];
//                [self.dataSource addObject:model];
//                [self.uitableView reloadData];
//            }
//
//            if (self.dataSource.count == 0) {
//
//                self.nodataImage.hidden = NO;
//            }else{
//                self.nodataImage.hidden = YES;
//            }
            
            
//             [self.uitableView reloadData];
        }
        
    }];
    
}



@end
