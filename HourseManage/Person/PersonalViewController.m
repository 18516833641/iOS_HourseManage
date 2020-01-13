//
//  PersonalViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/4.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonlTableViewCell.h"
#import "LoginViewController.h"

#import "PersonUserInfoViewController.h"
#import "PersonPasswordViewController.h"
#import "PersonAboutUsViewController.h"
#import "PersonVersionViewController.h"
#import "PersonFeedbackViewController.h"

@interface PersonalViewController ()

@property (weak, nonatomic) IBOutlet UILabel      * userName;

@property (weak, nonatomic) IBOutlet UILabel      * kunei;

@property (weak, nonatomic) IBOutlet UILabel      * ruku;

@property (weak, nonatomic) IBOutlet UILabel      * chuku;

@property (weak, nonatomic) IBOutlet UITableView  * tableView;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * IconArrl;


@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"个人中心";
    
    [_tableView registerNib:[UINib nibWithNibName:@"PersonlTableViewCell" bundle:nil] forCellReuseIdentifier:@"PersonlTableViewCell"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString * name=[userDefaults objectForKey:@"name"];

    
    _userName.text = name;
    
}
- (IBAction)escLoginAction:(id)sender {
    
     
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    NSUserDefaults * defautls = [NSUserDefaults standardUserDefaults];
    [defautls removePersistentDomainForName:appDomain];

    
    
    __unsafe_unretained __typeof(self) weakSelf = self;
    LoginViewController *tab = [[LoginViewController alloc]init];
    weakSelf.view.window.rootViewController = tab;
    

    
//    LoginViewController *Login=[[LoginViewController alloc]init];
//
//    [self presentViewController:Login  animated:YES completion:nil];
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:case 1:
            return 2;
            break;
            
        default:
            return 1;
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
   
    return CGFLOAT_MIN;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 30)];
    v.backgroundColor = Color_Base(238, 245, 250);
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PersonlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonlTableViewCell"];
    if(!cell){
        cell = [[PersonlTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"PersonlTableViewCell"];
    }
    

    switch (indexPath.section) {
        case 0:{
            _nameArr=@[@"账户资料",@"修改密码"];
            _IconArrl=@[@"geren",@"xiugaimima"];
            cell.title.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
            cell.image.image = [UIImage imageNamed:_IconArrl[indexPath.item]];
        }
            break;
        case 1:{
            _nameArr=@[@"关于我们",@"版本信息"];
            _IconArrl=@[@"guanyuwmkaobei",@"banbenxinx"];
            cell.title.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
            cell.image.image = [UIImage imageNamed:_IconArrl[indexPath.item]];
        }
            break;
            
        default:{
            _nameArr=@[@"意见反馈"];
            _IconArrl=@[@"yijianfanku"];
            cell.title.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
            cell.image.image = [UIImage imageNamed:_IconArrl[indexPath.item]];
        }
            break;
    }
     return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSUserDefaults *des = [NSUserDefaults standardUserDefaults];
//    NSString *uid = [des objectForKey:@"UID"];
//    if (uid == nil) {
//        LoginViewController *login = [[LoginViewController alloc]init];
//        [self presentViewController:login animated:YES completion:nil];}else{
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                PersonUserInfoViewController *vc= [[PersonUserInfoViewController alloc]init];
               vc.hidesBottomBarWhenPushed = YES;
               vc.title=@"账户资料";
               [self.navigationController pushViewController:vc animated:YES];
            }else{
                PersonPasswordViewController *vc=[[PersonPasswordViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                vc.title=@"修改密码";
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            case 1:
                       if (indexPath.row == 0) {
                           PersonAboutUsViewController *vc=[[PersonAboutUsViewController alloc]init];
                           vc.hidesBottomBarWhenPushed = YES;
                           vc.title=@"关于我们";
                           [self.navigationController pushViewController:vc animated:YES];
                       }else{
                           PersonVersionViewController *vc=[[PersonVersionViewController alloc]init];
                           vc.hidesBottomBarWhenPushed = YES;
                           vc.title=@"版本信息";
                           [self.navigationController pushViewController:vc animated:YES];
                       }
                       break;
            case 2:
            if (indexPath.row == 0) {
                PersonFeedbackViewController *vc=[[PersonFeedbackViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                vc.title=@"意见反馈";
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        default:
            
            
            break;
    }
    


}



@end
