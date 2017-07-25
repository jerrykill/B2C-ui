//
//  LSBaseViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSBaseViewController.h"

@interface LSBaseViewController ()<YPopViewDelegate>

@property (strong,nonatomic) UILabel *titleLb;

@property (strong,nonatomic) NSArray *list;

@property (strong,nonatomic) NSArray *images;

@end

@implementation LSBaseViewController

-(void)dealloc{
    [_popV removeFromSuperview];
}

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
    [self navigationUI];
    
}

- (void)navigationUI{
    [self.view addSubview:self.headNaviV];
    [self.view bringSubviewToFront:_headNaviV];
    [_headNaviV addSubview:self.titleLb];
    [_headNaviV addSubview:self.leftNaviButton];
    [_headNaviV addSubview:self.rightNaviButton];
}

- (void)setNaviTitle:(NSString *)naviTitle{
    _titleLb.text = naviTitle;
}

#pragma mark ==懒加载==
- (UIView *)headNaviV {
    if (!_headNaviV) {
        _headNaviV =[[UIView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _headNaviV.gradientColor = @"yes";

    }
    return _headNaviV;
}

- (UILabel *)titleLb {
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(200))/2, 32, AutoWidth(200), 20)];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = BFont(18);
        _titleLb.textColor = [UIColor whiteColor];
    }
    return _titleLb;
}

- (UIButton *)leftNaviButton{
    if (!_leftNaviButton) {
        _leftNaviButton = [[UIButton alloc]initWithFrame:CGRectMake(11, 30, 23, 23)];
        _leftNaviButton.layer.cornerRadius = 12.5;
        [_leftNaviButton setImage:MImage(@"back") forState:BtnNormal];
        [_leftNaviButton addTarget:self action:@selector(back) forControlEvents:BtnTouchUpInside];
    }
    return _leftNaviButton;
}

- (UIButton *)rightNaviButton{
    if (!_rightNaviButton) {
        _rightNaviButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-35, 29, 25, 25)];
        [_rightNaviButton setImage:MImage(@"more") forState:BtnNormal];
        _rightNaviButton.titleLabel.font = MFont(15);
        [_rightNaviButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_rightNaviButton addTarget:self action:@selector(chooseRightNavi) forControlEvents:BtnTouchUpInside];
    }
    return _rightNaviButton;
}

- (YPopView *)popV {
    if (!_popV) {
        _popV = [[YPopView alloc]initWithFrame:CGRectMake(__kWidth-40, 8, __kWidth, __kHeight-60) title:_list image:_images];
        _popV.delegate = self;
        _popV.userInteractionEnabled = YES;
    }
    return _popV;
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)chooseRightNavi {
    [self.view addSubview:self.popV];
    [self.view bringSubviewToFront:_popV];
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

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
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
