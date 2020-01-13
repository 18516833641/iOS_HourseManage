//
//  PersonFeedbackViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/23.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PersonFeedbackViewController.h"

@interface PersonFeedbackViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@end

@implementation PersonFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)butAction:(id)sender {
    
    if ([_textView.text isEqualToString:@""] || [_phoneNumber.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"请补全信息"];
        [SVProgressHUD dismissWithDelay:1.75];
        return;
    }
    
    [SVProgressHUD show];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString * orgId=[userDefaults objectForKey:@"orgId"];
    
    NSDictionary * params=@{
                            @"id":orgId,
                            @"originalPassword":_textView.text,
                            @"newPassword":_phoneNumber.text,
                                                  
        };
    
    
    NSLog(@"%@",params);
      
    NSString *urlString = [NSString stringWithFormat:@"%@/api/wms/appInfo/saveOrUpAppInfo",Url_Sever];
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
