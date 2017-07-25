//
//  LSAnnouncementViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/14.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSAnnouncementViewController.h"
#import "LSAnnounceCell.h"

@interface LSAnnouncementViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *mainV;

@end

@implementation LSAnnouncementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"爱股轩公告";
    self.rightNaviButton.hidden = YES;
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.mainV];
}

- (UITableView *)mainV{
    if (!_mainV) {
        _mainV = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64)];
        _mainV.backgroundColor = __BackColor;
        _mainV.delegate = self;
        _mainV.dataSource = self;
        _mainV.separatorColor = [UIColor clearColor];
    }
    return _mainV;
}

#pragma mark ==UITableViewDelegate==
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSAnnounceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSAnnounceCell"];
    if (!cell) {
        cell = [[LSAnnounceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSAnnounceCell"];
    }
    cell.title = @"各种公告测试";
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(10))];
    header.backgroundColor = __BackColor;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AutoWidth(58);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return AutoWidth(10);
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
