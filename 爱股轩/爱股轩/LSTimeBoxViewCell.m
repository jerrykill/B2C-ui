//
//  LSTimeBoxViewCell.m
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTimeBoxViewCell.h"
#import "LSBoxGoodView.h"


@interface LSTimeBoxViewCell ()<UIScrollViewDelegate>
{
    CGRect _frame;
}

@property (strong,nonatomic) UIScrollView *scrollV;

@end

@implementation LSTimeBoxViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _frame = frame;
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.scrollV];
}

#pragma mark ==懒加载==
- (UIScrollView *)scrollV{
    if (!_scrollV) {
        _scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
        _scrollV.contentSize = _frame.size;
        _scrollV.scrollEnabled = YES;
        _scrollV.bounces = YES;
        _scrollV.showsVerticalScrollIndicator = NO;
        _scrollV.showsHorizontalScrollIndicator = NO;
    }
    return _scrollV;
}

-(void)setDataArr:(NSMutableArray<YGoodsModel *> *)dataArr{
    _dataArr = dataArr;
    for (id obj in _scrollV.subviews) {
        [obj removeFromSuperview];
    }
    for (int i=0; i<_dataArr.count; i++) {
        YGoodsModel *model = _dataArr[i];
        LSBoxGoodView *goodV = [[LSBoxGoodView alloc]initWithFrame:CGRectMake(i*AutoWidth(135), 0, AutoWidth(135), AutoWidth(170))];
        [_scrollV addSubview:goodV];
        goodV.model = model;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseGD:)];
        [goodV addGestureRecognizer:tap];
        goodV.userInteractionEnabled = YES;
    }
    _scrollV.contentSize = CGSizeMake(AutoWidth(135)*_dataArr.count, 0);
}

-(void)chooseGD:(UITapGestureRecognizer *)tap{
    LSBoxGoodView *boxV = (LSBoxGoodView*)tap.view;
    [self.delegate chooseTimeActivityGood:boxV.model];
}

@end
