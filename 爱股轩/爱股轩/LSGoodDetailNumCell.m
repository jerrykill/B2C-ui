//
//  LSGoodDetailNumCell.m
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailNumCell.h"
#import "LSChangeCountView.h"

@interface LSGoodDetailNumCell ()<LSChangeCountViewDelegate>

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *stockLabel;

@property (strong,nonatomic) LSChangeCountView *numV;

@property (strong,nonatomic) UIImageView *bottomIV;

@end

@implementation LSGoodDetailNumCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.lineIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.stockLabel];
    [self addSubview:self.numV];
    [self addSubview:self.bottomIV];
}

#pragma mark ==懒加载==
- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(20), 0, __kWidth-AutoWidth(40), AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(24), AutoWidth(20), AutoWidth(70), AutoWidth(20))];
        _titleLabel.textColor = __DTextColor;
        _titleLabel.font = MFont(AutoWidth(16));
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"数量";
    }
    return _titleLabel;
}

- (UILabel *)stockLabel {
    if (!_stockLabel) {
        _stockLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_titleLabel)+AutoWidth(9), AutoWidth(28), AutoWidth(118), AutoWidth(15))];
        _stockLabel.textAlignment = NSTextAlignmentRight;
        _stockLabel.font = MFont(AutoWidth(12));
        _stockLabel.textColor = LH_RGBCOLOR(165, 165, 165);
    }
    return _stockLabel;
}

- (LSChangeCountView *)numV {
    if (!_numV) {
        _numV = [[LSChangeCountView alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(145), AutoWidth(15), AutoWidth(118), AutoWidth(39))];
        _numV.delegate = self;
        _numV.layer.cornerRadius = AutoWidth(3);
        _numV.layer.borderWidth = AutoWidth(1);
        _numV.layer.borderColor = __BackColor.CGColor;
    }
    return _numV;
}

- (UIImageView *)bottomIV {
    if (!_bottomIV) {
        _bottomIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(20), AutoWidth(68),__kWidth-AutoWidth(40), AutoWidth(1))];
        _bottomIV.backgroundColor = __BackColor;
    }
    return _bottomIV;
}

#pragma mark ==LSChangeCountViewDelegate==
- (void)changeCount:(BOOL)sender{
    [self.delegate changeGoodNum:sender];
}


- (void)setNum:(NSString *)num {
    _numV.count = num;
}

- (void)setStock:(NSString *)stock {
    _stock = stock;
    _stockLabel.text = [NSString stringWithFormat:@"库存：%@件",_stock];
}

@end
