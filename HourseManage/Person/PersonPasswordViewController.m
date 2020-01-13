//
//  PersonPasswordViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/23.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PersonPasswordViewController.h"

@interface PersonPasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *twoTextField;
@property (weak, nonatomic) IBOutlet UITextField *threTextField;

@end

@implementation PersonPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)ButtonACtion:(id)sender {
    
    if ([_oneTextFiled.text isEqualToString:@""] || [_twoTextField.text isEqualToString:@""] || [_threTextField.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"请补全信息"];
        [SVProgressHUD dismissWithDelay:1.75];
        return;
    }
    
    
    [SVProgressHUD show];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString * orgId=[userDefaults objectForKey:@"orgId"];
    
            
        
    NSDictionary * params=@{
                            @"id":orgId,
                            @"originalPassword":_oneTextFiled.text,
                            @"newPassword":_twoTextField.text,
                                                  
        };
    
    
    NSLog(@"%@",params);
      
    NSString *urlString = [NSString stringWithFormat:@"%@/api/admin/user/updatepassword",Url_Sever];
            //请求数据
           
    [PostService AFHTTPSessionManager:urlString method:@"POST" params:params WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
               
                [SVProgressHUD dismiss];
                if (error) {
                    [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
                    [SVProgressHUD dismissWithDelay:1.75];
                }else{

                    NSLog(@"---%@",[PostService DataTOjsonString:responseObject]);
                    
                    
                    if ([responseObject[@"status"] intValue] == 200) {
                       
                        [SVProgressHUD showWithStatus: @"操作成功"];
                        [SVProgressHUD dismissWithDelay:1.75];
                        
                        [self.navigationController popViewControllerAnimated:YES];
                       
                        return;
                    
                    }else{
                         [SVProgressHUD showWithStatus: [NSString stringWithFormat:@"操作失败:%@",responseObject[@"message"]]];
                    }
                }
                
            }];
    
}

@end
