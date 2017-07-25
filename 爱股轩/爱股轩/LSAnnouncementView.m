//
//  LSAnnouncementView.m
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSAnnouncementView.h"
#import "YWarnTitleView.h"


@interface LSAnnouncementView ()<YWarnTitleViewDelegate>
{
    CGRect _frame;
}

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) YWarnTitleView *warnTitleV;

@property (strong,nonatomic) UIButton *moreBtn;

@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSAnnouncementView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _frame=frame;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.logoIV];
    [self addSubview:self.warnTitleV];
    [self addSubview:self.moreBtn];
}

#pragma mark ==懒加载==
- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(8), AutoWidth(100), AutoWidth(23))];
        _logoIV.image = MImage(@"warnlogo");
        _logoIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _logoIV;
}

- (YWarnTitleView *)warnTitleV{
    if (!_warnTitleV) {
        _warnTitleV = [[YWarnTitleView alloc]initWithFrame:CGRectMake(AutoWidth(125), AutoWidth(10), _frame.size.width-AutoWidth(125)-65, AutoWidth(20))];
        _warnTitleV.delegate = self;
    }
    return _warnTitleV;
}

- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-65, AutoWidth(8), 65, 20)];
        _moreBtn.titleLabel.font = MFont(AutoWidth(15));
        [_moreBtn setTitle:@"更多" forState:BtnNormal];
        [_moreBtn setTitleColor:__TextColor forState:BtnNormal];
        [_moreBtn addTarget:self action:@selector(getMore) forControlEvents:BtnTouchUpInside];
    }
    return _moreBtn;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 39, __kWidth, 1)];
        _lineIV.backgroundColor= __BackColor;
    }
    return _lineIV;
}

- (void)getMore{
    [self.delegate getMore];
}

-(void)setTitleArr:(NSArray<YWarnModel *> *)titleArr{
    _titleArr = titleArr;
    _warnTitleV.titleArr = _titleArr;
}
#pragma mark ==YWarnTitleViewDelegate==
- (void)chooseWarnTitle:(NSInteger)index{
    [self.delegate chooseWarn:index];
}


- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, [UIColor lightGrayColor].CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 0.5);
    CGContextMoveToPoint(currentContext, AutoWidth(115), 3);
    CGContextAddLineToPoint(currentContext, AutoWidth(115), _frame.size.height-3);
    CGFloat arr[] = {3,1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 1);
    CGContextDrawPath(currentContext, kCGPathStroke);


    CGContextRef currentContext2 = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext2, [UIColor lightGrayColor].CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext2, 0.5);
    CGContextMoveToPoint(currentContext2, _frame.size.width-65, 3);
    CGContextAddLineToPoint(currentContext2, _frame.size.width-65, _frame.size.height-3);
    CGFloat arr1[] = {3,1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext2, 0, arr1, 1);
    CGContextDrawPath(currentContext2, kCGPathStroke);
    
}

@end
