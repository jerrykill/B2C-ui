//
//  LSShopCartViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/5.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopCartViewController.h"
#import "LSShopCartNaviView.h"
#import "LSGoodHotCell.h"
#import "LSShopCartHeadView.h"
#import "LSShopCartClearView.h"
#import "LSShopCartEditView.h"
#import "LSShopLikeHeadView.h"
#import "LSShopGoodCell.h"
#import "LSShopGoodEditCell.h"

@interface LSShopCartViewController ()<LSShopCartNaviViewDelegate,LSShopCartHeadViewDelegate,LSShopCartClearViewDelegate,LSShopCartEditViewDelegate,LSShopGoodCellDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LSShopGoodEditCellDelegate>

@property (strong,nonatomic) LSShopCartNaviView *naviV;

@property (strong,nonatomic) UICollectionView *mainV;

@property (strong,nonatomic) LSShopCartClearView *clearV;

@property (strong,nonatomic) LSShopCartEditView *editV;

@property (assign,nonatomic) BOOL isEdit;

@property (strong,nonatomic) LSShopCartGoodModel *dataModel;

@end

@implementation LSShopCartViewController

- (void)getdata{
    _dataModel = [[LSShopCartGoodModel alloc]init];
    NSMutableArray  *list = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        LSShopGoodModel *good = [[LSShopGoodModel alloc]init];
        good.goodNum = @"1";
        good.goodtitle = @"张清华《一堂课拿掉你的人性操作弱点》光盘+教程";
        good.price = @"45.00";
        good.goodUrl = @"";
        [list addObject:good];
    }
    _dataModel.couponMoney = @"0.00";
    _dataModel.dataArr= list;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self getdata];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.naviV];
    [self.view addSubview:self.mainV];
    [self.view addSubview:self.clearV];
    [self.view addSubview:self.editV];

    //注册cell
    [_mainV registerClass:[LSShopGoodCell class] forCellWithReuseIdentifier:@"LSShopGoodCell"];
    [_mainV registerClass:[LSShopCartHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LSShopCartHeadView"];
    [_mainV registerClass:[LSShopGoodEditCell class] forCellWithReuseIdentifier:@"LSShopGoodEditCell"];

    [_mainV registerClass:[LSGoodHotCell class] forCellWithReuseIdentifier:@"LSGoodHotCell"];
    [_mainV registerClass:[LSShopLikeHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LSShopLikeHeadView"];
}

#pragma mark ==懒加载==
- (LSShopCartNaviView *)naviV{
    if (!_naviV) {
        _naviV = [[LSShopCartNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
        _naviV.title = @"我的购物车";
    }
    return _naviV;
}

- (UICollectionView *)mainV{
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-114-AutoWidth(50)) collectionViewLayout:flowLayout];
        _mainV.backgroundColor = __BackColor;
        _mainV.delegate = self;
        _mainV.dataSource = self;
    }
    return _mainV;
}

- (LSShopCartClearView *)clearV{
    if (!_clearV) {
        _clearV = [[LSShopCartClearView alloc]initWithFrame:CGRectMake(0, CGRectYH(_mainV), __kWidth, AutoWidth(50))];
        _clearV.delegate = self;
    }
    return _clearV;
}

- (LSShopCartEditView *)editV{
    if (!_editV) {
        _editV = [[LSShopCartEditView alloc]initWithFrame:CGRectMake(0, CGRectYH(_mainV), __kWidth, AutoWidth(50))];
        _editV.delegate = self;
        _editV.hidden = YES;
    }
    return _editV;
}

#pragma mark ==LSShopCartNaviViewDelegate==
- (void)lookMessageCenter{
    NSLog(@"消息中心");
}


#pragma mark ==UICollectionviewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (_isEdit) {
        return 1;
    }
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return _dataModel.dataArr.count;
    }else{
        return 4;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cells= nil;
    if (indexPath.section==0) {
        LSShopGoodModel *model = _dataModel.dataArr[indexPath.row];
        if (!_isEdit) {
            LSShopGoodCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSShopGoodCell"
                                          forIndexPath:indexPath];
            if (!cell) {
                cell = [[LSShopGoodCell alloc]init];
            }
            cell.tag = indexPath.row;
            cell.delegate = self;
            cell.model = model;
            cells = cell;
        }else{
            LSShopGoodEditCell *cell = [collectionView
                    dequeueReusableCellWithReuseIdentifier:@"LSShopGoodEditCell"
                                              forIndexPath:indexPath];
            if (!cell) {
                cell = [[LSShopGoodEditCell alloc]init];
            }
            cell.tag = indexPath.row;
            cell.delegate = self;
            cell.model = model;
            cells = cell;
        }
    }else{
        LSGoodHotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSGoodHotCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGoodHotCell alloc]init];
        }
        YGoodsModel  *model = [[YGoodsModel alloc]init];
        model.goodUrl = @"";
        model.goodTitle = @"得力 0037 回形针别针加厚电镀表层曲别针（200枚/筒）";
        model.goodMoney = @"10.09";
        cell.model = model;
        cells = cell;
    }
    return cells;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseV = nil;
    if (indexPath.section==0) {
        LSShopCartHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LSShopCartHeadView" forIndexPath:indexPath];
        header.delegate = self;
        reuseV = header;
    }else{
        LSShopLikeHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LSShopLikeHeadView" forIndexPath:indexPath];
        reuseV = header;
    }
    return reuseV;
}
//内容距离屏幕边缘的距离 参数顺序是top,left,bottom,right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section==1) {
        return AutoWidth(4);
    }
    return 0;
}
//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section==1) {
        return AutoWidth(4);
    }
    return 0;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(__kWidth, AutoWidth(100));
    }else{
        return CGSizeMake((__kWidth-AutoWidth(4))/2, AutoWidth(250));
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(__kWidth, AutoWidth(55));
    }else{
        return CGSizeMake(__kWidth, AutoWidth(60));
    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        NSLog(@"商品");
    }else{
        NSLog(@"喜欢");
    }
}

#pragma mark ==LSShopCartHeadViewDelegate==
- (void)AllEdit:(BOOL)sender{
    NSLog(@"%@",sender?@"全编辑":@"不编辑");
    if (sender) {
        _isEdit = YES;
        _clearV.hidden = YES;
        _editV.hidden = NO;
    }else{
        _isEdit = NO;
        _clearV.hidden = NO;
        _editV.hidden = YES;
    }
    [_mainV reloadData];
}

#pragma mark ==LSShopCartClearViewDelegate==
- (void)clearPay{
    NSLog(@"结算");
}

- (void)chooseAll:(BOOL)sender{
    NSLog(@"%@",sender?@"全选":@"不选");
    _dataModel.allChoose = sender;
    _editV.allChoose = sender;
    for (int i=0; i<_dataModel.dataArr.count; i++) {
        LSShopGoodModel *model = _dataModel.dataArr[i];
        model.isChoose = sender;
        [_dataModel.dataArr replaceObjectAtIndex:i withObject:model];
    }
    [_mainV reloadData];
    [self clearTotal];

}


#pragma mark ==LSShopGoodCellDelegate==
- (void)choose:(BOOL)sender index:(NSInteger)tag{
    NSLog(@"%ld%@",(long)tag,sender?@"选中":@"不选");
    LSShopGoodModel *model =_dataModel.dataArr[tag];
    model.isChoose = sender;
    [_dataModel.dataArr replaceObjectAtIndex:tag withObject:model];
    [_mainV reloadData];
    [self checkAllchoose];
    [self clearTotal];
}

#pragma mark ==LSShopGoodEditCellDelegate==
- (void)chooseEdit:(BOOL)sender index:(NSInteger)tag{
   NSLog(@"%ld%@",(long)tag,sender?@"选中":@"不选");
    LSShopGoodModel *model =_dataModel.dataArr[tag];
    if (sender) {
        model.isChoose = YES;
    }else{
        model.isChoose = NO;
    }
    [_dataModel.dataArr replaceObjectAtIndex:tag withObject:model];
    [_mainV reloadData];
    [self checkAllchoose];
    [self clearTotal];
}

- (void)goodCount:(BOOL)sender changeIndex:(NSInteger)tag{
    LSShopGoodModel *model = _dataModel.dataArr[tag];
    NSInteger num = [model.goodNum integerValue];
    if (sender) {
        num++;
    }else{
        if (num>1) {
            num--;
        }
    }
    model.goodNum = [NSString stringWithFormat:@"%ld",(long)num];
    [_dataModel.dataArr replaceObjectAtIndex:tag withObject:model];
    [_mainV reloadData];
    [self clearTotal];
}

- (void)deleteGood:(NSInteger)index{
    [_dataModel.dataArr removeObjectAtIndex:index];
    [_mainV reloadData];
    [self clearTotal];
}


#pragma mark ==LSShopCartEditViewDelegate==
- (void)editShare{
    NSLog(@"分享");
}
- (void)editChoose:(BOOL)sender{
    NSLog(@"%@",sender?@"全选":@"不选");
    _dataModel.allChoose = sender;
    _clearV.allchoose = sender;
    for (int i=0; i<_dataModel.dataArr.count; i++) {
        LSShopGoodModel *model = _dataModel.dataArr[i];
        model.isChoose = sender;
        [_dataModel.dataArr replaceObjectAtIndex:i withObject:model];
    }
    [_mainV reloadData];
    [self clearTotal];
}

- (void)editCollect{
    NSLog(@"收藏");
}
#pragma mark ==结算所有价格==
- (void)clearTotal{
    __block  CGFloat totleMoney = 0;
    __block  NSInteger count = 0;
    [_dataModel.dataArr enumerateObjectsUsingBlock:^(LSShopGoodModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.isChoose) {
            totleMoney += [obj.price floatValue]*[obj.goodNum integerValue];
            count ++;
        }
    }];
    _dataModel.totalMoney = [NSString stringWithFormat:@"%.2f",totleMoney];
    _dataModel.chooseCount = [NSString stringWithFormat:@"%ld",(long)count];
    _clearV.model = _dataModel;
    if (_dataModel.dataArr.count!=0) {
        _naviV.title = [NSString stringWithFormat:@"我的购物车(%ld)",(unsigned long)_dataModel.dataArr.count];
    }else{
        _naviV.title = @"我的购物车";
    }

}

#pragma mark ==检测是否全选==
- (void)checkAllchoose{
    __block BOOL all = YES;
    [_dataModel.dataArr enumerateObjectsUsingBlock:^(LSShopGoodModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj.isChoose) {
            all = NO;
        }
    }];
    _dataModel.allChoose = all;
    _editV.allChoose = all;
    _clearV.allchoose = all;
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
