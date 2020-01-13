//
//  YuYueViewController.m
//  HourseManage
//
//  Created by mac on 2020/1/7.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

#import "YuYueViewController.h"

@interface YuYueViewController ()

@property (weak, nonatomic) IBOutlet UITextField *ontTextField;
@property (weak, nonatomic) IBOutlet UITextField *twoField;
@property (weak, nonatomic) IBOutlet UITextField *threeField;
@property (weak, nonatomic) IBOutlet UITextField *fourField;
@property (weak, nonatomic) IBOutlet UIButton *fiveField;
@property (weak, nonatomic) IBOutlet UIButton *sixField;

@end

@implementation YuYueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    _ontTextField.text = _OneStr;
    _twoField.text = _TwoStr;
    _threeField.text = _ThreeStr;
    _fourField.text = _fourStr;

    NSArray *array = [_fiveStr componentsSeparatedByString:@","];
    [_fiveField setTitle:array[0] forState:UIControlStateNormal];
    [_sixField setTitle:array[1] forState:UIControlStateNormal];
    
    

    
    
}


- (IBAction)fiveAction:(id)sender {

        Dialog()
        .wEventOKFinishSet(^(id anyID, id otherData) {
            
            [self.fiveField setTitle:[NSString stringWithFormat:@"%@",[anyID componentsJoinedByString:@"-"]] forState:UIControlStateNormal];
        })

        .wTypeSet(DialogTypeDatePicker)
        .wStart();
    
}


- (IBAction)sixButtonAction:(id)sender {
    Dialog()
    .wEventOKFinishSet(^(id anyID, id otherData) {
        [self.sixField setTitle:[NSString stringWithFormat:@"%@",[anyID componentsJoinedByString:@"-"]] forState:UIControlStateNormal];
    })

    .wTypeSet(DialogTypeDatePicker)
    .wStart();
}


- (IBAction)doneButtonAction:(id)sender {
    
        [SVProgressHUD show];
    
    if ([_ontTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入司机名称"];
        return;
    }
    if ([_twoField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入车牌号"];
        return;
    }
    if ([_threeField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入司机电话"];
        return;
    }
    if ([_fourField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入核载量（t）"];
        return;
    }
    
    if ([_fiveField.titleLabel.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请时间"];
        return;
    }
    
    if ([_sixField.titleLabel.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"请选择时间"];
        return;
    }
    
    
        NSDictionary * params=@{
                                @"driverName":_ontTextField.text,//司机名称
                                @"driverPlateNo":_twoField.text,//车牌号
                                @"driverPhone":_threeField.text,//司机电话
                                @"makeWeight":_fourField.text,//核载量（t）
                                @"makeTime":@"",
                                @"repoName":@"",
                                @"companyName":@"",
                                @"detailId":@"",
                                @"id":@"",
                                @"status":@"",
                                @"storageId":@"",
                                @"beginTime":_fiveField.titleLabel.text,
                                @"endTime":_sixField.titleLabel.text,
                                                      
            };
    
    NSString * paramStr = [self convertToJsonData:params];
    NSLog(@"%@",params);
    
            NSString *urlString = [NSString stringWithFormat:@"%@/api/wms/wmsOrderMakeappoin/save",Url_Sever];
                //请求数据
                [PostService AFHTTPSessionManager:urlString method:@"POST" params:paramStr WithBlock:^(id  _Nonnull responseObject, NSError * _Nonnull error) {
                   
                    [SVProgressHUD dismiss];
                    if (error) {
                        [SVProgressHUD showErrorWithStatus:@"网络请求失败，请重新尝试"];
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


-(NSString *)convertToJsonData:(NSDictionary *)dict
{
   
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
  
    NSString *jsonString;
    
    if (!jsonData) {
   
        NSLog(@"%@",error);
   
    }else{
          jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;

}



@end
