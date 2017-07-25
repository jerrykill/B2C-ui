//
//  LSSearchViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSSearchViewController.h"
#import "LSBaseSearchNaviView.h"

@interface LSSearchViewController ()<YPopViewDelegate,LSBaseSearchNaviViewDelegate>

@property (strong,nonatomic) LSBaseSearchNaviView *naviV;

@property (strong,nonatomic) NSArray *list;

@property (strong,nonatomic) NSArray *images;

@end

@implementation LSSearchViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    LSTabBarViewController *tab = (LSTabBarViewController*)self.tabBarController;
    tab.tabBarV.hidden = YES;

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = NO;
    LSTabBarViewController *tab = (LSTabBarViewController*)self.tabBarController;
    tab.tabBarV.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _list = @[@"首页",@"消息"];
    _images =@[@"home",@"news"];
    [self.view addSubview:self.naviV];
    [self.view bringSubviewToFront:_naviV];

}
-(void)setSearchText:(NSString *)searchText{
    _naviV.searchText = searchText;
}

#pragma mark ==懒加载==
- (LSBaseSearchNaviView *)naviV {
    if (!_naviV) {
        _naviV = [[LSBaseSearchNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.isEdit = _searchEdit;

        _naviV.delegate = self;
    }
    return _naviV;
}
- (YPopView *)popV {
    if (!_popV) {
        _popV = [[YPopView alloc]initWithFrame:CGRectMake(__kWidth-40, 8, __kWidth, __kHeight-60) title:_list image:_images];
        _popV.delegate = self;
        _popV.userInteractionEnabled = YES;
    }
    return _popV;
}


- (void)backAction {
    [self back];
}

- (void)rightAction {
    [self.view addSubview:self.popV];
    [self.view bringSubviewToFront:_popV];
}


- (void)startSearch {

}

- (void)searchAction:(NSString *)sender{

}

#pragma mark ==YPopViewDelegate==
-(void)chooseIndex:(NSInteger)index{
    if (index==0) {
        dispatch_async(dispatch_get_main_queue(), ^{
            LSTabBarViewController *tab = (LSTabBarViewController*)self.tabBarController;
            tab.selectIndex = 0;
            [self.navigationController popToRootViewControllerAnimated:YES];
        });
    }else{
        NSLog(@"消息中心");
        //        YSystemNewsViewController *vc = [[YSystemNewsViewController alloc]init];
        //        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return  UIStatusBarStyleLightContent;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_popV removeFromSuperview];
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
