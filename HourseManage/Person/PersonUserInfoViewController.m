//
//  PersonUserInfoViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/23.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "PersonUserInfoViewController.h"
#import "OStatusTableViewCell.h"

@interface PersonUserInfoViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (nonatomic,strong)NSArray               * nameArr;

@property (nonatomic,strong)NSArray               * titleArr;

@end

@implementation PersonUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_tableview registerNib:[UINib nibWithNibName:@"OStatusTableViewCell" bundle:nil] forCellReuseIdentifier:@"OStatusTableViewCell"];
    
    _nameArr=@[@"组织机构",@"姓名",@"账户",@"性别",@"描述"];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString * orgName=[userDefaults objectForKey:@"orgName"];
    NSString * name=[userDefaults objectForKey:@"name"];
    NSString * sub=[userDefaults objectForKey:@"sub"];
    NSString * orgId=[userDefaults objectForKey:@"orgId"];
    NSString * exp=[userDefaults objectForKey:@"exp"];
    
    _titleArr = @[orgName,name,sub,orgId,exp];
    
}

#pragma mark - delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OStatusTableViewCell"];
    if(!cell){
        cell = [[OStatusTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"OStatusTableViewCell"];
    }
    cell.orderLabel.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.item]];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",_titleArr[indexPath.item]];
    
     return cell;
    
}


@end
