//
//  LSCLassViewController.m
//  爱股轩
//
//  Created by imac on 2017/4/5.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSCLassViewController.h"
#import "LSNewsNaviView.h"
#import "LSClassFirstCell.h"
#import "YClassSectionView.h"
#import "LSNormalClassCell.h"
#import "LSSpecialHeadView.h"

@interface LSCLassViewController ()<LSNewsNaviViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LSSpecialHeadViewDelegate>

@property (strong,nonatomic) LSNewsNaviView *naviV;

@property (strong,nonatomic) UITableView *tableV;

@property (strong,nonatomic) UICollectionView *mainV;

@end

@implementation LSCLassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self initNaviV];
    [self initView];
}

- (void)initNaviV{
    [self.view addSubview:self.naviV];

}

- (void)initView{
    [self.view addSubview:self.tableV];
    [self.view addSubview:self.mainV];

    //注册cell
    [_mainV registerClass:[LSNormalClassCell class] forCellWithReuseIdentifier:@"LSNormalClassCell"];
    [_mainV registerClass:[YClassSectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YClassSectionView"];
    [_mainV registerClass:[LSSpecialHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LSSpecialHeadView"];

}

#pragma mark ==懒加载==
- (LSNewsNaviView *)naviV{
    if (!_naviV) {
        _naviV = [[LSNewsNaviView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _naviV.delegate = self;
    }
    return _naviV;
}

- (UITableView *)tableV{
    if (!_tableV) {
        _tableV  = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 64, AutoWidth(90), __kHeight-64-50)];
        _tableV.backgroundColor = [UIColor whiteColor];
        _tableV.separatorColor = [UIColor clearColor];
        _tableV.delegate = self;
        _tableV.dataSource = self;
    }
    return _tableV;
}

- (UICollectionView *)mainV{
    if (!_mainV) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        _mainV = [[UICollectionView alloc]initWithFrame:CGRectMake(CGRectXW(_tableV), 64, __kWidth-AutoWidth(90), __kHeight-114) collectionViewLayout:flowLayout];
        _mainV.delegate = self;
        _mainV.dataSource = self;
        _mainV.backgroundColor= __BackColor;
    }
    return _mainV;
}

#pragma mark ==LSNewsNaviViewDelegate==
- (void)startSeach{
    NSLog(@"开始搜索");
}

- (void)goinMessageCenter{
    NSLog(@"消息中心");
}

#pragma mark ==UITableViewDelegate==
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSClassFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSClassFirstCell"];
    if (!cell) {
        cell = [[LSClassFirstCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSClassFirstCell"];
    }
    cell.tag = indexPath.row;
    if (indexPath.row==0) {
        cell.lineIV.backgroundColor = __DefaultColor;
        cell.backgroundColor = __BackColor;
    }
    cell.title = @"测试分类";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AutoWidth(90);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    for ( int i=0; i<4; i++) {
        LSClassFirstCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (cell.tag == indexPath.row) {
            cell.lineIV.backgroundColor = __DefaultColor;
            cell.backgroundColor = __BackColor;
        }else{
            cell.lineIV.backgroundColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor whiteColor];
        }
    }
}

#pragma mark ==UICollectionViewDelegate==
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else{
        return 9;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LSNormalClassCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LSNormalClassCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LSNormalClassCell alloc]init];
    }
    if (indexPath.section==0) {
        cell.title = @"课程";
    }else{
        cell.title = @"某名师";
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reuseV;
    if (indexPath.section==0) {
        if (kind == UICollectionElementKindSectionHeader) {
            YClassSectionView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"YClassSectionView" forIndexPath:indexPath];
            header.title = @"推荐课程";
            reuseV =header;
        }
    }else{
        if (kind==UICollectionElementKindSectionHeader) {
            LSSpecialHeadView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"LSSpecialHeadView" forIndexPath:indexPath];
            header.titleArr = @[@"线上课程",@"线下课程"];
            header.testName = @"名师线上课程";
            header.delegate = self;
            reuseV = header;
        }
    }
    return reuseV;
}


//内容距离屏幕边缘的距离 参数顺序是top,left,bottom,right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, AutoWidth(7), 0, AutoWidth(7));
}

//x 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return AutoWidth(5);
}

//y 间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return AutoWidth(5);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(AutoWidth(86), AutoWidth(115));
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(AutoWidth(260), AutoWidth(35));
    }else{
        return CGSizeMake(AutoWidth(260), AutoWidth(75));
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld,%ld",(long)indexPath.section,indexPath.row);
}

#pragma mark ==LSSpecialHeadViewDelegate==
- (void)chooseClassIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
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
