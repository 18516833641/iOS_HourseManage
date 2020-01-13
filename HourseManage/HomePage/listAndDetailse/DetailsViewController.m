//
//  DetailsViewController.m
//  HourseManage
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 jietingzhang. All rights reserved.
//

#import "DetailsViewController.h"
#import "BaseTableViewCell.h"
#import "DetailsTableViewCell.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (weak, nonatomic) IBOutlet UITableView *detailsTableView;

@property (nonatomic,strong)NSArray                    * nameArr;

@property (nonatomic,strong)NSArray                    * titleArrl;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

//    self.view.backgroundColor = Color_Base(arc4random()%255/255.0, arc4random()%255/255.0, arc4random()%255/255.0, 1);
    self.view.backgroundColor = Color_Base(arc4random()%255/255, arc4random()%255/255, arc4random()%255/255);
    
    [_listTableView registerNib:[UINib nibWithNibName:@"DetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailsTableViewCell"];
     
    [_detailsTableView registerNib:[UINib nibWithNibName:@"BaseTableViewCell" bundle:nil] forCellReuseIdentifier:@"BaseTableViewCell"];
}

#pragma mark tablevoiew

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1001) {
        return 50;
    }else{
        return 200;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == 1001) {
        return 5;
    }else{
        return 5;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 1001) {
        DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailsTableViewCell"];
        if(!cell){
            cell = [[DetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DetailsTableViewCell"];
        }
        _nameArr=@[@"商户名称",@"订单编号",@"订单类型",@"入库方式",@"预计入库时间"];
        _titleArrl=@[@"大连华信计算机股份",@"SDFSFY78685678",@"I类型",@"xxx库",@"2019-10-10"];
        
        cell.name.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.row]];
        cell.title.text = [NSString stringWithFormat:@"%@",_titleArrl[indexPath.row]];
        
         return cell;
    }else{
        BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseTableViewCell"];
        if(!cell){
            cell = [[BaseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"BaseTableViewCell"];
        }

         return cell;
    }
    
    
    
}


@end
