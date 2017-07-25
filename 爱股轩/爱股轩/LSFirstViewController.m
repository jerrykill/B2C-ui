//
//  LSFirstViewController.m
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSFirstViewController.h"
#import "LSFirstNaviView.h"
#import "LSAdWarnHeadView.h"
#import "YADClassCell.h"
#import "LSHeadSectionTitleView.h"
#import "LSTeacherCollectionViewCell.h"
#import "LSTeacherMoreFooterView.h"
#import "LSCourseCell.h"
#import "LSClearanceTimeView.h"
#import "LSTimeBoxViewCell.h"
#import "LSScoreCell.h"
#import "LSGoodHotCell.h"
#import "LSBottomLightView.h"


#import "LSLoginViewController.h"
#import "LSAnnouncementViewController.h"
#import "LSTeacherListViewController.h"
#import "LSGroupOnTimeViewController.h"
#import "LSGoodsDetailViewController.h"
#import "LSGoodSearchViewController.h"

@interface LSFirstViewController ()<LSFirstNaviViewDelegate,LSAdWarnHeadViewDelegate,LSTeacherMoreFooterViewDelegate,LSCourseCellDelegate,LSClearanceTimeViewDelegate,LSTimeBoxViewCellDelegate,LSScoreCellDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) LSFirstNaviView *naviV;

@property (strong,nonatomic) UICollectionView *mainV;

@end

@implementation LSFirstViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = YES;
    LSTabBarViewController *tab = (LSTabBarViewController*)self.tabBarController;
    tab.tabBarV.hidden = NO;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBar.hidden = NO;
    LSTabBarViewController *tab = (LSTabBarViewController*)self.tabBarController;
    tab.tabBarV.hidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self getNavigationUI];
    [self initView];
}


- (void)getNavigationUI{
    [self.view addSubview:self.naviV];
}

- (void)initView{
    [self.view addSubview:self.mainV];

    //注册cell和ReuseableView
    [_mainV registerClass:[YADClassCell class]
            forCellWithReuseIdentifier:@"YADClassCell"];
    [_mainV registerClass:[LSAdWarnHeadView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"LSAdWarnHeadView"];
    [_mainV registerClass:[LSBottomLightView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:@"LSBottomLightView"];

    [_mainV registerClass:[LSHeadSectionTitleView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"LSHeadSectionTitleView"];
    [_mainV registerClass:[LSTeacherCollectionViewCell class] forCellWithReuseIdentifier:@"LSTeacherCollectionViewCell"];
    [_mainV registerClass:[LSTeacherMoreFooterView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:@"LSTeacherMoreFooterView"];

    [_mainV registerClass:[LSCourseCell class]
            forCellWithReuseIdentifier:@"LSCourseCell"];

    [_mainV registerClass:[LSClearanceTimeView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"LSClearanceTimeView"];
    [_mainV registerClass:[LSTimeBoxViewCell class]
            forCellWithReuseIdentifier:@"LSTimeBoxViewCell"];

    [_mainV registerClass:[LSScoreCell class]
            forCellWithReuseIdentifier:@"LSScoreCell"];

    [_mainV registerClass:[LSGoodHotCell class]
            forCellWithReuseIdentifier:@"LSGoodHotCell"];
}


#pragma mark ==懒加载==
- (LSFirstNaviView *)naviV{
    if (!_naviV) {
        _naviV  = [[LSFirstNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
    }
    return _naviV;
}

- (UICollectionView *)mainV{
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]
                      initWithFrame:CGRectMake(0, 64, __kWidth, __kHeight-114)
               collectionViewLayout:flowLayout];
        _mainV.backgroundColor = __BackColor;
        _mainV.delegate = self;
        _mainV.dataSource = self;
    }
    return _mainV;
}


#pragma mark ==LSFirstNaviViewDelegate==
- (void)startSearchAction{
    NSLog(@"开始搜索");
    LSGoodSearchViewController *vc = [[LSGoodSearchViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)makeQRCode{
    NSLog(@"扫一扫");
    LSLoginViewController *vc = [[LSLoginViewController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)lookMessage{
    NSLog(@"查看消息");
}
#pragma mark ==UICollectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 4;
    }else if (section==1){
        return 5;
    }else if (section==2||section==3||section==4){
        return 1;
    }else{
        return 4;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *goodCell = nil;
    if (indexPath.section==0) {
        YADClassCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"YADClassCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[YADClassCell alloc]init];
        }
         YHeadClass *class =[[YHeadClass alloc]init];
         class.title = @"测试分类";
         cell.data = class;
         goodCell = cell;
    }else if (indexPath.section==1){
        LSTeacherCollectionViewCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSTeacherCollectionViewCell"
                                      forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSTeacherCollectionViewCell alloc]init];
        }
        cell.title = @"老师名";
        goodCell = cell;
    }else if (indexPath.section==2){
        LSCourseCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSCourseCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSCourseCell alloc]init];
        }
        cell.delegate = self;
        goodCell = cell;
    }else if (indexPath.section==3){
        LSTimeBoxViewCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSTimeBoxViewCell"
                                   forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSTimeBoxViewCell alloc]init];
        }
        cell.delegate = self;
        NSMutableArray *dataArr = [NSMutableArray array];
        for (int i=0; i<5; i++) {
            YGoodsModel *model = [[YGoodsModel alloc]init];
            model.goodTitle = @"传美A4 复印纸";
            model.goodMoney = @"10.00";
            model.goodOldMoney = @"19.00";
            model.goodUrl = @"";
            model.activeName = @"superCoupon";
            [dataArr addObject:model];
        }
        cell.dataArr = dataArr;
        goodCell = cell;
    }else if (indexPath.section==4){
        LSScoreCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSScoreCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSScoreCell alloc]init];
        }
        cell.delegate = self;
        goodCell = cell;
    }else{
        LSGoodHotCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSGoodHotCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGoodHotCell alloc]init];
        }
        YGoodsModel *model = [[YGoodsModel alloc]init];
        model.goodTitle = @"传美A4 复印纸";
        model.goodMoney = @"10.00";
        model.goodOldMoney = @"19.00";
        cell.model = model;
        goodCell = cell;
    }
    return goodCell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseV =nil;
    if (indexPath.section==0) {
        if (kind == UICollectionElementKindSectionHeader) {
            LSAdWarnHeadView *header = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                  withReuseIdentifier:@"LSAdWarnHeadView"
                                         forIndexPath:indexPath];
            header.delegate = self;
            NSMutableArray *headArr =[NSMutableArray array];
            for (int i =0; i<3; i++) {
                YHeadImage *head = [[YHeadImage alloc]init];
                head.imageName = @"";
                head.imageUrl = @"";
                [headArr addObject:head];
            }
            header.imageArr = headArr;
            NSMutableArray *titleArr = [NSMutableArray array];
            for (int i=0; i<3; i++) {
                YWarnModel *model = [[YWarnModel alloc]init];
                model.warnTitle = @"测试看看";
                model.warnId = @"";
                [titleArr addObject:model];
            }
            header.titleArr = titleArr;
            reuseV = header;
        }else if (kind == UICollectionElementKindSectionFooter){
            LSBottomLightView *footer = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                  withReuseIdentifier:@"LSBottomLightView"
                                         forIndexPath:indexPath];
            reuseV = footer;
        }
    }else if (indexPath.section == 1){
        if (kind ==UICollectionElementKindSectionHeader) {
            LSHeadSectionTitleView *header = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                  withReuseIdentifier:@"LSHeadSectionTitleView"
                                         forIndexPath:indexPath];
            header.imageName = @"tlt_home_01";
            reuseV = header;
        }else if (kind == UICollectionElementKindSectionFooter){
            LSTeacherMoreFooterView *footer = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                  withReuseIdentifier:@"LSTeacherMoreFooterView"
                                         forIndexPath:indexPath];
            footer.delegate = self;
            reuseV = footer;
        }
    }else if (indexPath.section==3){
        if (kind == UICollectionElementKindSectionHeader) {
            LSClearanceTimeView *header = [collectionView
               dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                  withReuseIdentifier:@"LSClearanceTimeView"
                                         forIndexPath:indexPath];
            header.time = @"123456";
            header.delegate = self;
            reuseV = header;
        }
    }else if (indexPath.section==4){
        if (kind == UICollectionElementKindSectionHeader) {
            LSHeadSectionTitleView *header = [collectionView
                                              dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                              withReuseIdentifier:@"LSHeadSectionTitleView"
                                              forIndexPath:indexPath];
            header.imageName = @"tlt_home_03";
            reuseV = header;
        }
    }else if (indexPath.section==5){
        if (kind == UICollectionElementKindSectionHeader) {
            LSHeadSectionTitleView *header = [collectionView
                                              dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                              withReuseIdentifier:@"LSHeadSectionTitleView"
                                              forIndexPath:indexPath];
            header.imageName = @"tlt_home_04";
            header.type = @"is ";
            reuseV = header;
        }
    }
    return reuseV;
}


-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}

//y
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section==5) {
        return AutoWidth(4);
    }else{
        return 0;
    }
}
//x
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section==5) {
        return AutoWidth(4);
    }else{
        return 0;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(__kWidth/4, AutoWidth(116));
    }else if (indexPath.section==1){
        return CGSizeMake(__kWidth/5, AutoWidth(100));
    }else if (indexPath.section==2){
        return CGSizeMake(__kWidth, AutoWidth(200));
    }else if (indexPath.section==3){
        return CGSizeMake(__kWidth, AutoWidth(180));
    }else if (indexPath.section==4){
        return CGSizeMake(__kWidth, __kWidth);
    }else{
        return CGSizeMake((__kWidth-AutoWidth(4))/2, AutoWidth(250));
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(__kWidth, AutoWidth(202));
    }else if (section==1){
        return CGSizeMake(__kWidth, AutoWidth(40));
    }else if (section==3){
        return CGSizeMake(__kWidth, AutoWidth(50));
    }else if (section ==4){
        return CGSizeMake(__kWidth, AutoWidth(35));
    }else if (section==5){
        return CGSizeMake(__kWidth, AutoWidth(42));
    }else{
        return CGSizeZero;
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(__kWidth, AutoWidth(10));
    }else if (section ==1){
        return CGSizeMake(__kWidth, AutoWidth(50));
    }else{
        return CGSizeZero;
    }
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        NSLog(@"分类");
    }else if (indexPath.section==1){
        NSLog(@"名师");
    }else if (indexPath.section==5){
        NSLog(@"商品");
        LSGoodsDetailViewController *vc = [[LSGoodsDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark ==LSAdWarnHeadViewDelegate==
- (void)chooseMore{
    NSLog(@"更多");
    LSAnnouncementViewController *vc = [[LSAnnouncementViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickAdPicture:(NSString *)url{
    NSLog(@"选择图片");
}

-(void)chooseWarnIndex:(NSInteger)index{
    NSLog(@"警告%ld",(long)index);
}

#pragma mark ==LSTeacherMoreFooterViewDelegate==
-(void)lookMoreTeacher{
    NSLog(@"更多讲师");
    LSTeacherListViewController *vc = [[LSTeacherListViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark ==LSCourseCellDelegate==
-(void)chooseCoureseView:(NSInteger)index{
    NSLog(@"课程类型%ld",(long)index);
}
#pragma mark ==LSClearanceTimeViewDelegate==
-(void)chooseTimeMore{
    NSLog(@"查看更多限时活动");
    LSGroupOnTimeViewController *vc = [[LSGroupOnTimeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark ==LSTimeBoxViewCellDelegate==
-(void)chooseTimeActivityGood:(YGoodsModel *)model{
    NSLog(@"%@",model.goodTitle);
}
#pragma mark ==LSScoreCellDelegate==
- (void)integralChooseAction:(NSInteger)index{
    NSLog(@"积分活动：%ld",(long)index);
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
