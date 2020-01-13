//
//  LoginViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "LoginViewController.h"
#import "RootTabBarViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    BOOL _isShowPassword;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    _password.secureTextEntry = YES;
}

- (IBAction)loginAction:(id)sender {

    [self postLogin];
  
}

-(void)postLogin{
    
    _userName.text = @"admin";
    _password.text = @"admin";
    
    if ([_userName.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if ([_password.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    NSDictionary * dict=@{
                          @"username":_userName.text,
                          @"password":_password.text,
                          };
    [SVProgressHUD show];
    
    NSString *urlString = [NSString stringWithFormat:@"%@/api/auth/jwt/token",Url_Sever];
    
    [PostService startRequestWithUrl:urlString method:@"POST" params:dict WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {

        [SVProgressHUD dismiss];
        if (error) {
            
            NSLog(@"---%@",error);
            [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
        }else{

            NSString *source = responseObject[@"data"];
             NSLog(@"---    %@",responseObject[@"data"]);
             NSRange range = NSMakeRange(0, 0);
             
             range.location = [source rangeOfString:@"."].location + 1;
             
             range.length = [source rangeOfString:@"." options:NSBackwardsSearch].location - range.location;
             
            
             NSString * newstr = [source substringWithRange:range];
            
//            NSString *str2 = [newstr substringWithRange:NSMakeRange(0,97)];//str2 = "name"
            

//            NSData * str = [PostService dataWithBase64EncodedString:str2];
            
            
            NSDictionary * jsonData = [PostService jwtDecodeWithJwtString:newstr];
            
            NSLog(@"----===-：：：：%@",jsonData);
            
//             NSDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:str options:NSJSONReadingMutableLeaves error:nil];


            
            

            NSUserDefaults *userDefaultsUid = [NSUserDefaults standardUserDefaults];

            [userDefaultsUid setObject:jsonData[@"exp"] forKey:@"exp"];
            [userDefaultsUid setObject:jsonData[@"name"] forKey:@"name"];
            [userDefaultsUid setObject:jsonData[@"userId"] forKey:@"userId"];
            [userDefaultsUid setObject:jsonData[@"sub"] forKey:@"sub"];
            [userDefaultsUid setObject:jsonData[@"orgName"] forKey:@"orgName"];
            [userDefaultsUid setObject:jsonData[@"orgId"] forKey:@"orgId"];
            [userDefaultsUid setObject:source forKey:@"Authorization"];

            __unsafe_unretained __typeof(self) weakSelf = self;
            RootTabBarViewController *tab = [[RootTabBarViewController alloc]init];
            weakSelf.view.window.rootViewController = tab;
            [userDefaultsUid setObject:@"1" forKey:@"ISFrist"];//记录是否第一次登录
            
        }

    }];
}




- (IBAction)isSelecdAction:(id)sender {
    _isShowPassword = !_isShowPassword;
    _password.secureTextEntry = !_isShowPassword;
    
    if (_isShowPassword) {
        [_isSelecdBut setBackgroundImage:[UIImage imageNamed:@"selecd"] forState:UIControlStateNormal];
    }else{
        [_isSelecdBut setBackgroundImage:[UIImage imageNamed:@"selecds"] forState:UIControlStateNormal];
    }
}


@end
