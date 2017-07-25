//
//  LSPersonCenterViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/5.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSPersonCenterViewController.h"
#import "LSPersonHeadCell.h"
#import "YPersonOrderCell.h"
#import "YPersonDetailHeadView.h"
#import "LSPersonWalletCell.h"
#import "YPersonActionCell.h"

@interface LSPersonCenterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LSPersonWalletCellDelegate,LSPersonHeadCellDelegate,YPersonDetailHeadViewDelegate>

@property (strong,nonatomic) UICollectionView *mainV;

@property (strong,nonatomic) NSArray *orderTitleArr;

@property (strong,nonatomic) NSArray *orderImageArr;

@property (strong,nonatomic) NSArray *actionTitleArr;

@property (strong,nonatomic) NSArray *actionImageArr;

@end

@implementation LSPersonCenterViewController

- (void)getdata{
    _orderTitleArr = @[@"待付款",@"待处理",@"待收货",@"待评论",@"返修/退换"];
    _orderImageArr = @[@"Orders_01",@"Orders_02",@"Orders_03",@"Orders_04",@"Orders_05"];
    _actionTitleArr = @[@"我的收藏",@"收货地址",@"客服中心",@"足迹",@"成为分销商",@"爱股轩官网",@"关于爱股轩",@"意见反馈"];
    _actionImageArr = @[@"my_ico_01",@"my_ico_02",@"my_ico_03",@"my_ico_04",@"my_ico_05",@"my_ico_06",@"my_ico_07",@"my_ico_08"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self getdata];
    [self initView];
}

- (void)initView{
    [self.view addSubview:self.mainV];

    //注册
    [_mainV registerClass:[LSPersonHeadCell class]
        forCellWithReuseIdentifier:@"LSPersonHeadCell"];
    [_mainV registerClass:[YPersonDetailHeadView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"YPersonDetailHeadView"];
    [_mainV registerClass:[LSPersonWalletCell class]
        forCellWithReuseIdentifier:@"LSPersonWalletCell"];
    [_mainV registerClass:[YPersonOrderCell class]
        forCellWithReuseIdentifier:@"YPersonOrderCell"];
    [_mainV registerClass:[YPersonActionCell class] forCellWithReuseIdentifier:@"YPersonActionCell"];

    [_mainV registerClass:[UICollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
               withReuseIdentifier:@"footer"];
}

#pragma mark ==懒加载==
- (UICollectionView *)mainV{
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-50) collectionViewLayout:flowLayout];
        _mainV.delegate = self;
        _mainV.dataSource = self;
        _mainV.backgroundColor = __BackColor;
    }
    return _mainV;
}

#pragma mark ==UICollectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }else if (section==1){
        return 5;
    }else if (section==2){
        return 1;
    }else{
        return 8;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cells = nil;
    if (indexPath.section == 0) {
        LSPersonHeadCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSPersonHeadCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSPersonHeadCell alloc]init];
        }
        cell.delegate = self;
        cells = cell;
    }else if (indexPath.section == 1){
        YPersonOrderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YPersonOrderCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[YPersonOrderCell alloc]init];
        }
        cell.title = _orderTitleArr[indexPath.row];
        cell.imageName = _orderImageArr[indexPath.row];
        cells = cell;
    }else if (indexPath.section == 2){
        LSPersonWalletCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSPersonWalletCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSPersonWalletCell alloc]init];
        }
        cell.delegate = self;
        cells = cell;
    }else{
        YPersonActionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YPersonActionCell" forIndexPath:indexPath];
        if (!cell) {
            cell = [[YPersonActionCell alloc]init];
        }
        cell.title = _actionTitleArr[indexPath.row];
        cell.imageName = _actionImageArr[indexPath.row];
        cells = cell;
    }
    return cells;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseV= nil;
    if (indexPath.section==1) {
        if (kind == UICollectionElementKindSectionHeader) {
            YPersonDetailHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YPersonDetailHeadView" forIndexPath:indexPath];
            if (!header) {
                header = [[YPersonDetailHeadView alloc]init];
            }
            header.title = @"我的订单";
            header.detail = @"查看订单";
            header.tag = 0;
            header.delegate = self;
            reuseV = header;
        }else{
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            if (!footer) {
                footer = [[UICollectionReusableView alloc]init];
            }
            footer.backgroundColor = __BackColor;
            reuseV =footer;
        }
    }else if (indexPath.section == 2){
        if (kind == UICollectionElementKindSectionHeader) {
            YPersonDetailHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YPersonDetailHeadView" forIndexPath:indexPath];
            if (!header) {
                header = [[YPersonDetailHeadView alloc]init];
            }
            header.title = @"我的钱包";
            header.detail = @"查看详情";
            header.tag = 1;
            header.delegate = self;
            reuseV = header;
        }else{
            UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
            if (!footer) {
                footer = [[UICollectionReusableView alloc]init];
            }
            footer.backgroundColor = __BackColor;
            reuseV =footer;
        }
    }
    return reuseV;
}

//内容距离屏幕边缘的距离 参数顺序是top,left,bottom,right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section==3) {
        return 1;
    }else{
        return 0;
    }
}

//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 3) {
        return 1;
    }else{
        return 0;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(__kWidth, __kWidth/2);
    }else if (indexPath.section==1){
        return CGSizeMake(__kWidth/5, AutoWidth(70));
    }else if (indexPath.section==2){
        return CGSizeMake(__kWidth, AutoWidth(65));
    }else{
        return CGSizeMake((__kWidth-3)/4, AutoWidth(100));
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==1||section==2) {
        return CGSizeMake(__kWidth, AutoWidth(48));
    }else{
        return CGSizeZero;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section==1||section==2) {
        return CGSizeMake(__kWidth, AutoWidth(5));
    }else{
        return CGSizeZero;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        NSLog(@"订单%ld",(long)indexPath.row);
    }else if (indexPath.section==3){
        NSLog(@"操作%ld",(long)indexPath.row);
    }
}
#pragma mark ==LSPersonHeadCellDelegate==
- (void)goinMessageCenter{
    NSLog(@"消息中心");
}

- (void)lookSetting{
    NSLog(@"设置");
}

- (void)userManager{
    NSLog(@"账户管理");
}

#pragma mark ==LSPersonWalletCellDelegate==
- (void)lookUseMoney{
    NSLog(@"账户余额");
}

- (void)lookStockMoney{
    NSLog(@"股币");
}

- (void)lookIntegral{
    NSLog(@"积分");
}

#pragma mark ==YPersonDetailHeadViewDelegate==
-(void)headDetailActionType:(NSInteger)tag{
    if (tag) {
        NSLog(@"查看详情");
    }else{
        NSLog(@"查看订单");
    }
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
