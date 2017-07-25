//
//  LSTeacherRecommendGoodsViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherRecommendGoodsViewController.h"
#import "LSTeacherRecommondSectionView.h"
#import "LSGoodHotCell.h"

@interface LSTeacherRecommendGoodsViewController ()<LSTeacherRecommondSectionViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView *mainV;

@end

@implementation LSTeacherRecommendGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"名师推荐商品";
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.mainV];

    //注册
    [_mainV registerClass:[LSGoodHotCell class]
            forCellWithReuseIdentifier:@"LSGoodHotCell"];
    [_mainV registerClass:[LSTeacherRecommondSectionView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"LSTeacherRecommondSectionView"];

}

#pragma mark ==懒加载==
- (UICollectionView *)mainV {
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64) collectionViewLayout:flowLayout];
        _mainV.delegate = self;
        _mainV.dataSource = self;
        _mainV.backgroundColor = __BackColor;
    }
    return _mainV;
}


#pragma mark ==UICollectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LSGoodHotCell *cell = [collectionView
                           dequeueReusableCellWithReuseIdentifier:@"LSGoodHotCell"
                                                     forIndexPath:indexPath];
    if (!cell) {
        cell = [[LSGoodHotCell alloc]init];
    }
    YGoodsModel *model = [[YGoodsModel alloc]init];
    model.goodTitle = @"故事廖聊吧20 上下册";
    model.goodMoney = @"10.00";
    model.goodOldMoney = @"19.00";
    cell.model = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        LSTeacherRecommondSectionView *headerV = [collectionView
                dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                   withReuseIdentifier:@"LSTeacherRecommondSectionView"
                                           forIndexPath:indexPath];
        LSTeacherModel *model = [[LSTeacherModel alloc]init];
        model.logoName = @"爱股轩名师";
        model.teacherName = @"廖英强";
        model.introduceInfo = @"用技术打开股市财富之门";
        headerV.model = model;
        headerV.delegate = self;
        return headerV;
    }
    return nil;
}
//内容距离屏幕边缘的距离 参数顺序是top,left,bottom,right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AutoWidth(4);
}
//y 间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return AutoWidth(4);
}

-  (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((__kWidth-AutoWidth(4))/2, AutoWidth(250));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(__kWidth, AutoWidth(143));
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}

#pragma mark ==LSTeacherRecommondSectionViewDelegate==
- (void)chooseCourseType:(NSInteger)sender{
    NSLog(@"%ld",sender);
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
