//
//  LSGoodDetailAppraiseView.m
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailAppraiseView.h"
#import "LSGoodEvalueCell.h"
#import "LSGoodDetailAppraiseSectionView.h"

@interface LSGoodDetailAppraiseView ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *mainV;

@property (strong,nonatomic) NSMutableArray *dataArr;

@property (strong,nonatomic) LSGoodDetailAppraiseSectionView *sectionV;

@property (strong, nonatomic) UILabel *bottomMsgLabel;

@end

@implementation LSGoodDetailAppraiseView

- (void)getData{
    _dataArr = [NSMutableArray array];
    for (int i=0; i<4; i++) {
        LSGoodDetailAppraiseModel *model = [[LSGoodDetailAppraiseModel alloc]init];
        model.nickName = @"测试";
        model.evalueTime = @"2017-04-01";
        model.buyTime = @"217-03-23";
        model.evalueInfo = @"东西到了。换上开车感觉轻松好多，质量非常不错！以后会常来";
        if (i>1) {
            model.imageArr = [NSMutableArray arrayWithArray:@[@"",@"",@""]];
        }
        [_dataArr addObject:model];
    }

}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self getData];
        [self initView];

    }
    return self;
}

- (void)initView{
    [self addSubview:self.mainV];
    [_mainV addSubview:self.bottomMsgLabel];
}

#pragma mark ==懒加载==
- (UITableView *)mainV {
    if (!_mainV) {
        _mainV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-114-AutoWidth(38))];
        _mainV.backgroundColor = __BackColor;
        _mainV.delegate = self;
        _mainV.dataSource = self;
        _mainV.separatorColor = [UIColor clearColor];
    }
    return _mainV;
}

- (LSGoodDetailAppraiseSectionView *)sectionV {
    if (!_sectionV) {
        _sectionV = [[LSGoodDetailAppraiseSectionView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(45))];

    }
    return _sectionV;
}

-(UILabel *)bottomMsgLabel{
    if (!_bottomMsgLabel) {
        _bottomMsgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -40, __kWidth, 40)];
        _bottomMsgLabel.font = [UIFont systemFontOfSize:13.0f];
        _bottomMsgLabel.textAlignment = NSTextAlignmentCenter;
        _bottomMsgLabel.text = @"下拉返回商品详情";
    }
    return _bottomMsgLabel;
}

#pragma mark ==UItableViewDelegate==
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSGoodEvalueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LSGoodEvalueCell"];
    if (!cell) {
        cell = [[LSGoodEvalueCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LSGoodEvalueCell"];
    }
    LSGoodDetailAppraiseModel *model =_dataArr[indexPath.row];
    cell.model = model;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.sectionV.count =[NSString stringWithFormat:@"%ld", _dataArr.count];
    return _sectionV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LSGoodDetailAppraiseModel *model = _dataArr[indexPath.row];
    CGSize size = [model.evalueInfo boundingRectWithSize:CGSizeMake(__kWidth-AutoWidth(20), MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:MFont(AutoWidth(12))} context:nil].size;
    NSInteger t=0;
    if (model.imageArr.count) {
        t=1;
    }
    CGFloat heights = size.height+AutoWidth(85)+t*AutoWidth(70);
    NSLog(@"%.2f",heights);
    return heights;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AutoWidth(45);
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat offset = scrollView.contentOffset.y;
    if (offset<-40) {
        [self.delegate uploadToHead];
    }
}

@end
