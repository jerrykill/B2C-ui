//
//  LSGroupOnTimeViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGroupOnTimeViewController.h"
#import "LSGoodHotCell.h"
#import "LSGroupOnHeadView.h"
#import "LSGroupPopularityCell.h"
#import "LSGroupHeadTitleView.h"

@interface LSGroupOnTimeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LSGroupOnHeadViewDelegate,LSGroupPopularityCellDelegate>

@property (strong,nonatomic) UICollectionView *mainV;

@property (strong,nonatomic) NSTimer *timer;

@property (assign,nonatomic) NSInteger activiTime;


@end

@implementation LSGroupOnTimeViewController

- (void)getdata{
    _activiTime = 123456;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduce) userInfo:nil repeats:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"限时团购";
    [self getdata];
    [self initView];
}

- (void)initView {
    [self.view addSubview:self.mainV];

    //注册
    [_mainV registerClass:[LSGroupPopularityCell class] forCellWithReuseIdentifier:@"LSGroupPopularityCell"];
    [_mainV registerClass:[LSGroupOnHeadView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"LSGroupOnHeadView"];
    [_mainV registerClass:[LSGoodHotCell class]
        forCellWithReuseIdentifier:@"LSGoodHotCell"];
    [_mainV registerClass:[LSGroupHeadTitleView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"LSGroupHeadTitleView"];
}

#pragma mark ==懒加载==
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

#pragma mark ==UIColllectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 4;
    }else{
        return 4;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cells= nil;
    if (indexPath.section==0) {
        LSGroupPopularityCell *cell = [collectionView
           dequeueReusableCellWithReuseIdentifier:@"LSGroupPopularityCell"
                                     forIndexPath:indexPath];
        if (!cell) {
            cell = [[LSGroupPopularityCell alloc]init];
        }
        cell.tag = indexPath.row;
        YGoodsModel *model = [[YGoodsModel alloc]init];
        model.goodTitle = @"爱股轩学习终端 每日解盘直播（学习终端 +PC端MINI）";
        model.goodOldMoney = @"2980.00";
        model.activeMoney = @"2888.00";
        model.activeTime =[NSString stringWithFormat:@"%ld",_activiTime];
        cell.model = model;
        cell.delegate = self;
        cells = cell;
    }else{
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
        cells = cell;
    }

    return cells;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseV = nil;
    if (indexPath.section==0) {
        if (kind == UICollectionElementKindSectionHeader) {
            LSGroupOnHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                   withReuseIdentifier:@"LSGroupOnHeadView"
                                          forIndexPath:indexPath];
            NSMutableArray *data = [NSMutableArray array];
            YHeadImage *image = [[YHeadImage alloc]init];
            image.imageUrl = @"kjsdb";
            [data addObject:image];
            header.imageArr = data;
            header.delegate = self;
            reuseV = header;
        }
    }else{
        if (kind == UICollectionElementKindSectionHeader) {
            LSGroupHeadTitleView *header = [collectionView
                dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                   withReuseIdentifier:@"LSGroupHeadTitleView"
                                          forIndexPath:indexPath];
            reuseV = header;
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
    if (section==1) {
        return AutoWidth(4);
    }
    return 0;
}

//y 间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section==1) {
        return AutoWidth(4);
    }
    return AutoWidth(10);
}

-  (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return CGSizeMake(__kWidth, AutoWidth(190));
    }
    return CGSizeMake((__kWidth-AutoWidth(4))/2, AutoWidth(250));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(__kWidth, AutoWidth(250));
    }else{
        return CGSizeMake(__kWidth, AutoWidth(40));
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
}

#pragma mark ==LSGroupOnHeadViewDelegate==
- (void)chooseAdPic:(NSString *)url{
    NSLog(@"点击图片");
}

#pragma mark ==LSGroupPopularityCellDelegate==
- (void)chooseBuy:(NSInteger)sender{
    NSLog(@"立即购买");
}

#pragma mark ==倒计时==
- (void)reduce{
    _activiTime--;
    NSIndexSet *set = [[NSIndexSet alloc]initWithIndex:0];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_mainV reloadSections:set];
    });

}

- (void)dealloc{
    //取消定时器
    [_timer invalidate];
    _timer = nil;

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
