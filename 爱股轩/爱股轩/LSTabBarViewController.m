//
//  LSTabBarViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/5.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTabBarViewController.h"
#import "LSFirstViewController.h"
#import "LSCLassViewController.h"
#import "LSShopCartViewController.h"
#import "LSPersonCenterViewController.h"
#import "YtabBarButton.h"

@interface LSTabBarViewController ()<UITabBarDelegate>

/**主控制器个数*/
@property (strong,nonatomic) NSMutableArray *itemsArr;

@property (strong,nonatomic) NSMutableArray *btnArr;

@property (strong,nonatomic) LSFirstViewController *homeVC;

@property (strong,nonatomic) LSCLassViewController *classVC;

@property (strong,nonatomic) LSShopCartViewController *shopVC;

@property (strong,nonatomic) LSPersonCenterViewController *personVC;

@end

@implementation LSTabBarViewController

#pragma mark ==懒加载==
-(NSMutableArray *)itemsArr{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}


-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES;
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    [self btnArr];
    _tabBarV  = [[UIImageView alloc]initWithFrame:rect];
    _tabBarV.userInteractionEnabled = YES;
    _tabBarV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_tabBarV];

    NSArray *norArr = @[@"home_b",@"fbxs_b",@"buy_b",@"me_b"];
    NSArray *selArr = @[@"home_hove",@"fbxs_hove",@"buy_hove",@"me_hove"];
    NSArray *titleArr = @[@"首页",@"分类",@"购物车",@"我的"];

    for (int i=0; i<4; i++) {
        YtabBarButton *btn = [[YtabBarButton alloc]initWithFrame:CGRectMake(i*__kWidth/4, 0, __kWidth/4, rect.size.height)];
        [_tabBarV addSubview:btn];
        btn.tag = i;
        [btn addBtnImage:OMImage(norArr[i]) SelectedImage:OMImage(selArr[i]) title:titleArr[i]];
        [_btnArr addObject:btn];
        [btn addTarget:self action:@selector(chooseTabbar:) forControlEvents:BtnTouchUpInside];
        if (!i) {
            [btn sendActionsForControlEvents:BtnTouchUpInside];
        }
    }

    [self initView];


}

-(void)creatItemVC:(UIViewController*)vc{
    BaseNavigationController *navi = [[BaseNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:navi];

}


-(void)chooseTabbar:(UIButton*)sender{
    for (YtabBarButton*btn in _btnArr) {
        if (btn.tag == sender.tag) {
            btn.selected = !sender.selected;
            btn.userInteractionEnabled = NO;
        }else{
            btn.userInteractionEnabled = YES;
            btn.selected = NO;
        }
    }
    self.selectedIndex = sender.tag;
    _selectIndex = sender.tag;
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:[NSString stringWithFormat:@"%ld",(long)_selectIndex]];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tabSelectIndex" object:arr userInfo:nil];
}


-(void)initView{
    _homeVC = [[LSFirstViewController alloc]init];
    [self creatItemVC:_homeVC];
    _classVC = [[LSCLassViewController alloc]init];
    [self creatItemVC:_classVC];
    _shopVC = [[LSShopCartViewController alloc]init];
    [self creatItemVC:_shopVC];
    _personVC = [[LSPersonCenterViewController alloc]init];
    [self creatItemVC:_personVC];
}


-(void)setSelectIndex:(NSInteger)selectIndex{
    for (YtabBarButton*btn in _btnArr) {
        if (btn.tag == selectIndex) {
            btn.selected = !btn.selected;
            btn.userInteractionEnabled = NO;
        }else{
            btn.userInteractionEnabled = YES;
            btn.selected = NO;
        }
    }
    self.selectedIndex = selectIndex;
    
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
