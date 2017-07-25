//
//  LSGoodDetailEvalueHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailEvalueHeadView.h"


@interface LSGoodDetailEvalueHeadView ()

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *timeLabel;

@end

@implementation LSGoodDetailEvalueHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.headIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.timeLabel];
}

#pragma mark ==懒加载==
- (UIImageView *)headIV {
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(11), AutoWidth(15), AutoWidth(15))];
        _headIV.layer.cornerRadius = 7.5;
        _headIV.image = MImage(@"evalue_ico");
    }
    return _headIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectXW(_headIV)+AutoWidth(10), AutoWidth(10), AutoWidth(170), AutoWidth(15))];
        _titleLabel.font = MFont(AutoWidth(11));
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = __LightTextColor;
        _titleLabel.text = @"雷***星";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(80), AutoWidth(10), AutoWidth(70), AutoWidth(15))];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.font = MFont(AutoWidth(12));
        _timeLabel.textColor = __LightTextColor;
        _timeLabel.text = @"2017-04-01";
    }
    return _timeLabel;
}




@end
