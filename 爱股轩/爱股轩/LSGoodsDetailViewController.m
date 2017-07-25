//
//  LSGoodsDetailViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodsDetailViewController.h"
#import "LSGoodPicturesHeaderView.h"
#import "LSGoodsDetailTitleCell.h"
#import "LSGoodDetailTypeChooseView.h"
#import "LSGoodSizeChooseView.h"
#import "LSGoodDetailLikeHeadView.h"
#import "LSGoodDetailLikeCell.h"
#import "LSGoodDetailBottomFreshView.h"
#import "YGoodDetailBottomActionView.h"
#import "LSGoodDetailBottomTypesView.h"
#import "LSGoodSizeListView.h"


@interface LSGoodsDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LSGoodsDetailTitleCellDelegate,LSGoodDetailLikeHeadViewDelegate,YGoodDetailBottomActionViewDelegate,LSGoodSizeChooseViewDelegate,UIScrollViewDelegate,LSGoodDetailBottomTypesViewDelegate,LSGoodSizeListViewDelegate>
{
    BOOL isDrop;//向下
}

@property (strong,nonatomic) UIScrollView *backV;

@property (strong,nonatomic) UICollectionView *mainV;

@property (strong,nonatomic) UIButton *cartButton;

@property (strong,nonatomic) UIButton *countButton;

@property (strong,nonatomic) LSGoodDetailBottomTypesView *goodDetailBottomV;

@property (strong,nonatomic) YGoodDetailBottomActionView *bottomV;

@property (strong,nonatomic) LSGoodDetailModel *dataModel;

@property (strong,nonatomic) LSGoodModel *checkModel;

@property (assign,nonatomic) NSInteger selectType;

@property (strong,nonatomic) LSGoodSizeListView *goodSizeCheckV;

@end

@implementation LSGoodsDetailViewController

- (void)getdata{
    _dataModel = [[LSGoodDetailModel alloc]init];
    _dataModel.goodTitle = @"爱股轩学习终端 每日解盘直播（学习终端+PC端MINI）";
    _dataModel.goodMoney = @"240.00";
    _dataModel.activityMoney = @"229.09";
//    _dataModel.endTime = @"1493665691";
    _dataModel.imageArr = @[@"",@""];
    _dataModel.typeArr = @[@"机顶盒",@"Mini",@"机顶盒+MINI"];
    _selectType =0;
    _checkModel = [[LSGoodModel alloc]init];
    _checkModel.goodName = _dataModel.goodTitle;
    _checkModel.goodPrice = _dataModel.goodMoney;
    _checkModel.num = @"1";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"商品详情";
    [self getdata];
    [self initNavisCartView];
    [self initView];

}

- (void)initView {
    [self.view addSubview:self.backV];
    [self.view sendSubviewToBack:_backV];
    [_backV addSubview:self.mainV];
    [_backV addSubview:self.goodDetailBottomV];
    [self.view addSubview:self.bottomV];
    //注册
    [_mainV registerClass:[LSGoodsDetailTitleCell class] forCellWithReuseIdentifier:@"LSGoodsDetailTitleCell"];
    [_mainV registerClass:[LSGoodPicturesHeaderView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"LSGoodPicturesHeaderView"];
    [_mainV registerClass:[LSGoodSizeChooseView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
               withReuseIdentifier:@"LSGoodSizeChooseView"];

    [_mainV registerClass:[LSGoodDetailLikeHeadView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"LSGoodDetailLikeHeadView"];
    [_mainV registerClass:[LSGoodDetailLikeCell class] forCellWithReuseIdentifier:@"LSGoodDetailLikeCell"];
    [_mainV registerClass:[LSGoodDetailBottomFreshView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
               withReuseIdentifier:@"LSGoodDetailBottomFreshView"];

}

- (void)initNavisCartView{
    [self.headNaviV addSubview:self.cartButton];
    [_cartButton addSubview:self.countButton];
}

#pragma mark ==懒加载==
- (UIButton *)cartButton {
    if (!_cartButton) {
        _cartButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-85, 30, 30, 23)];
        [_cartButton setImage:MImage(@"cart_icon_top") forState:BtnNormal];
        [_cartButton addTarget:self action:@selector(chooseCart) forControlEvents:BtnTouchUpInside];
    }
    return _cartButton;
}

- (UIButton *)countButton {
    if (!_countButton) {
        _countButton = [[UIButton alloc]initWithFrame:CGRectMake(15, -2, 17, 17)];
        _countButton.layer.cornerRadius = 8.5;
        _countButton.backgroundColor = LH_RGBCOLOR(255, 115, 0);
        _countButton.titleLabel.font = MFont(11);
        [_countButton setTitle:@"12" forState:BtnNormal];
        [_countButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        _countButton.userInteractionEnabled = NO;
    }
    return _countButton;
}

- (UIScrollView *)backV {
    if (!_backV) {
        _backV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, (__kHeight-114)*2)];
        _backV.showsVerticalScrollIndicator = NO;
        _backV.showsHorizontalScrollIndicator = NO;
        _backV.delegate = self;
        _backV.scrollEnabled = YES;
        _backV.tag = 444;
    }
    return _backV;
}


- (UICollectionView *)mainV {
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-114) collectionViewLayout:flowLayout];
        _mainV.delegate = self;
        _mainV.dataSource = self;
        _mainV.backgroundColor = __BackColor;
        _mainV.tag = 31;
    }
    return _mainV;
}

- (LSGoodDetailBottomTypesView *)goodDetailBottomV {
    if (!_goodDetailBottomV) {
        _goodDetailBottomV = [[LSGoodDetailBottomTypesView alloc]initWithFrame:CGRectMake(0, CGRectYH(_mainV), __kWidth, __kHeight-114)];
        _goodDetailBottomV.delegate = self;
    }
    return _goodDetailBottomV;
}

- (YGoodDetailBottomActionView *)bottomV {
    if (!_bottomV) {
        _bottomV = [[YGoodDetailBottomActionView alloc]initWithFrame:CGRectMake(0, __kHeight-50, __kWidth, 50)];
        _bottomV.delegate = self;
    }
    return _bottomV;
}

- (LSGoodSizeListView *)goodSizeCheckV {
    if (!_goodSizeCheckV) {
        _goodSizeCheckV = [[LSGoodSizeListView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight)];
        _goodSizeCheckV.delegate = self;
    }
    return _goodSizeCheckV;
}

#pragma mark ==进购物车==
- (void)chooseCart {
    dispatch_async(dispatch_get_main_queue(), ^{
        LSTabBarViewController *tab = (LSTabBarViewController*)self.tabBarController;
        tab.selectIndex = 2;
        [self.navigationController popToRootViewControllerAnimated:YES];
    });

}

#pragma mark ==UICollectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section==0) {
        return 1;
    }else{
        return 3;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cells = nil;
    if (indexPath.section==0) {
        LSGoodsDetailTitleCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSGoodsDetailTitleCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGoodsDetailTitleCell alloc]init];
        }
        cell.delegate = self;
        cell.model = _dataModel;
        cells = cell;
    }else if (indexPath.section == 1||indexPath.section == 2){
      LSGoodDetailLikeCell *cell = [collectionView
         dequeueReusableCellWithReuseIdentifier:@"LSGoodDetailLikeCell"
                                   forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGoodDetailLikeCell alloc]init];
        }
        cell.model = _dataModel;
        cells = cell;
    }
    return cells;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reuseV = nil;
    if (indexPath.section == 0) {
        if (kind == UICollectionElementKindSectionHeader) {
            LSGoodPicturesHeaderView *header = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                  withReuseIdentifier:@"LSGoodPicturesHeaderView"
                                         forIndexPath:indexPath];
            if (!header) {
                header = [[LSGoodPicturesHeaderView alloc]init];
            }
            header.imageArr = _dataModel.imageArr;
            reuseV = header;
        }else{
            LSGoodSizeChooseView *footerV = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                  withReuseIdentifier:@"LSGoodSizeChooseView"
                                         forIndexPath:indexPath];
            if (!footerV) {
                footerV = [[LSGoodSizeChooseView alloc]init];
            }
            footerV.detail = @"数量 1";
            footerV.delegate = self;
            reuseV = footerV;
        }
    }else if (indexPath.section==1 || indexPath.section==2){
        if (kind == UICollectionElementKindSectionHeader) {
            LSGoodDetailLikeHeadView *header = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                  withReuseIdentifier:@"LSGoodDetailLikeHeadView"
                                         forIndexPath:indexPath];
            if (!header) {
                header = [[LSGoodDetailLikeHeadView alloc]init];
            }
            if (indexPath.section==1) {
                header.title = @"猜你喜欢";
                header.delegate = self;
            }else{
                header.title = @"搭配套餐推荐";
            }
            reuseV = header;
        }else{
            if (indexPath.section==2) {
                LSGoodDetailBottomFreshView *footer = [collectionView
                   dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                      withReuseIdentifier:@"LSGoodDetailBottomFreshView"
                                             forIndexPath:indexPath];
                if (!footer) {
                    footer = [[LSGoodDetailBottomFreshView alloc]init];
                }
                footer.selectType = [NSString stringWithFormat:@"%ld",_selectType];
                reuseV = footer;
            }
        }
    }
    return reuseV;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

//y
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//x
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
        if (indexPath.section==0) {
            if (IsNilString(_dataModel.endTime)) {
                return CGSizeMake(__kWidth, AutoWidth(120));
            }
            return CGSizeMake(__kWidth, AutoWidth(142));
        }else{
            return CGSizeMake(__kWidth/3, AutoWidth(190));
        }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
        if (section==0) {
            return CGSizeMake(__kWidth, AutoWidth(311));
        }else {
            return CGSizeMake(__kWidth, AutoWidth(40));
        }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
        if (section == 0) {
            return CGSizeMake(__kWidth, AutoWidth(58));
        }else if (section==2){
            return CGSizeMake(__kWidth, AutoWidth(82));
        }else{
            return CGSizeZero;
        }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
        if (indexPath.section==1) {
            NSLog(@"喜欢");
        }else if (indexPath.section==2){
            NSLog(@"推荐");
        }

}

#pragma mark ==LSGoodsDetailTitleCellDelegate==
- (void)chooseShare {
    NSLog(@"分享");
}

#pragma mark ==LSGoodSizeChooseViewDelegate==
- (void)chooseGoodType {
    NSLog(@"选择规格");
    [self.view addSubview:self.goodSizeCheckV];
    [self.view bringSubviewToFront:_goodSizeCheckV];
    _goodSizeCheckV.data = _dataModel;
    _goodSizeCheckV.model = _checkModel;
}

#pragma mark ==LSGoodDetailLikeHeadViewDelegate==
- (void)changeLikeNext{
    NSLog(@"换一批");
}

#pragma mark ==YGoodDetailBottomActionViewDelegate==
- (void)chooseGoodAction:(NSInteger)index isCollect:(BOOL)sender{
    switch (index) {
        case 0:
        {
            NSLog(@"%@",sender?@"收藏":@"不收藏");
        }
            break;
        case 1:
        {
            NSLog(@"加入购物车");
        }
            break;
        case 2:
        {
            NSLog(@"立即购买");
        }
            break;
        default:
            break;
    }
}
#pragma mark ==LSGoodSizeListViewDelegete==
- (void)changeGoodCount:(BOOL)sender {
    NSInteger num = [_checkModel.num integerValue];
    if (sender) {
        num++;
    }else{
        num--;
    }
    _checkModel.num =[NSString stringWithFormat:@"%ld",num];
    _goodSizeCheckV.model = _checkModel;
}

- (void)addShopCart {
    NSLog(@"加入购物车");
}

- (void)payNow {
    NSLog(@"理解支付");
}

- (void)chooseGoodCheckType:(NSInteger)index{
    NSLog(@"%ld",index);
    _checkModel.type = _dataModel.typeArr[index];
}

/**
 *  每次拖拽都会回调
 *  @param decelerate YES时，为滑动减速动画，NO时，没有滑动减速动画
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat offset = _mainV.contentOffset.y;
    if (offset >=_mainV.contentSize.height-__kHeight+114&&!isDrop) {
        [UIView animateWithDuration:0.4 animations:^{
            _backV.transform = CGAffineTransformTranslate(_backV.transform, 0, 114-__kHeight);
            isDrop=YES;
        }];
    }
}

#pragma mark ==LSGoodDetailBottomTypesViewDelegate==
- (void)makeDetailClearFrame {
    [UIView animateWithDuration:0.4 animations:^{
        _backV.transform = CGAffineTransformIdentity;
        isDrop=NO;
    }];
}

- (void)chooseTypeIndex:(NSInteger)sender{
    _selectType = sender;
    [_mainV reloadData];
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
