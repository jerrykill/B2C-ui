//
//  LSGoodsFilterViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodsFilterViewController.h"
#import "LSGoodFilterCell.h"
#import "YGoodsFilterView.h"

@interface LSGoodsFilterViewController ()<YGoodsFilterViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) YGoodsFilterView *goodFilterV;

@property (strong,nonatomic) UITableView *mainV;

@end

@implementation LSGoodsFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)initView {
    [self.view addSubview:self.mainV];
    [self.view sendSubviewToBack:_mainV];
}

#pragma mark ==懒加载==
- (UITableView *)mainV {
    if (!_mainV) {
        _mainV = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64)];
        _mainV.backgroundColor = [UIColor whiteColor];
        _mainV.delegate=self;
        _mainV.dataSource = self;
        _mainV.separatorColor = [UIColor clearColor];
        _mainV.tableHeaderView = self.goodFilterV;
    }
    return _mainV;
}

- (YGoodsFilterView *)goodFilterV {
    if (!_goodFilterV) {
        _goodFilterV = [[YGoodsFilterView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(45))];
        _goodFilterV.delegate = self;
    }
    return _goodFilterV;
}


#pragma mark ==UITableViewDelegate==
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSGoodFilterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSGoodFilterCell"];
    if (!cell) {
        cell = [[LSGoodFilterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSGoodFilterCell"];
    }
    LSGoodModel *model = [[LSGoodModel alloc]init];
    model.goodName = @"爱股轩学习终端 每日解盘直播（学习终端+PC端MINI）";
    model.goodPrice = @"2980.00";
    model.evaluteCount = @"1000";
    model.dealCount = @"322";
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AutoWidth(132);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}

#pragma mark ==YGoodsFilterViewDelegate==
- (void)chooseType:(NSInteger)sender {
    switch (sender) {
        case 0:
        {
            NSLog(@"销量");
        }
            break;
        case 1:
        {
            NSLog(@"价格增加");
        }
            break;
        case 2:
        {
            NSLog(@"价格减少");
        }
            break;
        case 3:
        {
            NSLog(@"按老师分类");
        }
            break;
        default:
            break;
    }
}
- (void)startSearch {
    [self.navigationController popViewControllerAnimated:NO];
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
