//
//  LSTeacherListViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/14.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherListViewController.h"
#import "LSTeacherListCell.h"

#import "LSTeacherRecommendGoodsViewController.h"

@interface LSTeacherListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView *mainV;

@end

@implementation LSTeacherListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"名师专栏";
    [self initView];
}

- (void)initView {
    [self.view addSubview:self.mainV];
    [self.view sendSubviewToBack:_mainV];

    //注册
    [_mainV registerClass:[LSTeacherListCell class] forCellWithReuseIdentifier:@"LSTeacherListCell"];
}

- (UICollectionView *)mainV{
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64) collectionViewLayout:flowLayout];
        _mainV.backgroundColor = __BackColor;
        _mainV.delegate = self;
        _mainV.dataSource = self;
    }
    return _mainV;
}

#pragma mark ==UICollectionViewDelegate==
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 21;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LSTeacherListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSTeacherListCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LSTeacherListCell alloc]init];
    }
    cell.title = @"廖英强";
    return cell;
}

//内容距离屏幕边缘的距离 参数顺序是top,left,bottom,right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(AutoWidth(15), AutoWidth(7), 0, AutoWidth(7));
}
//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AutoWidth(10);
}
//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return AutoWidth(10);
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(AutoWidth(110), AutoWidth(135));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    LSTeacherRecommendGoodsViewController *vc = [[LSTeacherRecommendGoodsViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
