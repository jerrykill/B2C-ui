//
//  LSGoodSearchViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodSearchViewController.h"
#import "LSGoodSearchNaviView.h"
#import "YHotSearchHeadView.h"
#import "YHistoryClearView.h"
#import "YSearchPushCell.h"
#import "JKHistory.h"

#import "LSGoodsFilterViewController.h"

@interface LSGoodSearchViewController ()<LSGoodSearchNaviViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,YHistoryClearViewDelegate>

@property (strong,nonatomic) LSGoodSearchNaviView *naviV;

@property (strong,nonatomic) UICollectionView *mainV;

@property (strong,nonatomic) NSMutableArray *historyArr;

@end

@implementation LSGoodSearchViewController

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

- (void)getdata {
    _historyArr = [NSMutableArray array];
    _historyArr = [JKHistory getHistory];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self getdata];
    [self.view addSubview:self.naviV];
    [self.view bringSubviewToFront:_naviV];
    [self initView];
}


- (void)initView {
    [self.view addSubview:self.mainV];

    //注册
    [_mainV registerClass:[YSearchPushCell class] forCellWithReuseIdentifier:@"YSearchPushCell"];
    [_mainV registerClass:[YHotSearchHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YHotSearchHeadView"];
    [_mainV registerClass:[YHistoryClearView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"YHistoryClearView"];
}

#pragma mark ==懒加载==
- (LSGoodSearchNaviView *)naviV {
    if (!_naviV) {
        _naviV = [[LSGoodSearchNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
    }
    return _naviV;
}

#pragma mark ==懒加载==
- (UICollectionView *)mainV {
    if (!_mainV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-64) collectionViewLayout:layout];
        _mainV.backgroundColor = __BackColor;
        _mainV.delegate = self;
        _mainV.dataSource = self;
    }
    return _mainV;
}


#pragma mark ==LSGoodSearchNaviViewDelegate==
- (void)goodNameSeach:(NSString *)sender {
    NSLog(@"搜索：%@",sender);
    [JKHistory Savetext:sender];
}

- (void)chooseBack {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ==UICollectionViewDelegate==
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 6;
    }else{
        return _historyArr.count;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YSearchPushCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YSearchPushCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[YSearchPushCell alloc]init];
    }
    if (indexPath.section ==0) {
        cell.title = @"热门搜索";
    }else{
        NSInteger index = _historyArr.count-indexPath.row-1;
        cell.title = _historyArr[index];
    }
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseV = nil;
    if (indexPath.section == 0) {
        if (kind == UICollectionElementKindSectionHeader) {
            YHotSearchHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YHotSearchHeadView" forIndexPath:indexPath];
            //            if (!header) {
            //                header = [[YHotSearchHeadView alloc]init];
            //            }
            header.image = @"search_hot";
            header.title = @"热门搜索";
            reuseV = header;
        }
    }else if(indexPath.section == 1){
        if (kind == UICollectionElementKindSectionHeader) {
            YHotSearchHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YHotSearchHeadView" forIndexPath:indexPath];
            //            if (!header) {
            //                header = [[YHotSearchHeadView alloc]init];
            //            }
            header.image = @"";
            header.title = @"历史搜索";
            reuseV = header;
        }
        if (kind == UICollectionElementKindSectionFooter){
            YHistoryClearView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"YHistoryClearView" forIndexPath:indexPath];
            if (!footer) {
                footer = [[YHistoryClearView alloc]init];
            }
            footer.delegate = self;
            reuseV = footer;
        }
    }
    return reuseV;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((__kWidth-40)/3, 40);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(__kWidth, 50);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 1) {
        return CGSizeMake(__kWidth, 50);
    }else{
        return CGSizeZero;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LSGoodsFilterViewController *vc= [[LSGoodsFilterViewController alloc]init];
    vc.searchText = _historyArr[indexPath.row];
    vc.searchEdit = NO;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark ==YHistoryClearViewDelegate==
-(void)clear{
    NSLog(@"清除历史");
    [JKHistory clearHistory];
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
