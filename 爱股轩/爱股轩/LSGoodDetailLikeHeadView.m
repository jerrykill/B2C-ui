//
//  LSGoodDetailLikeHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailLikeHeadView.h"

@interface LSGoodDetailLikeHeadView ()

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIButton *nextButton;

@end

@implementation LSGoodDetailLikeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.lineIV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.nextButton];

}

#pragma mark ==懒加载==
- (UIImageView *)lineIV {
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(120), AutoWidth(17))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = LH_RGBCOLOR(224, 40, 40);
        _titleLabel.font = MFont(AutoWidth(14));
    }
    return _titleLabel;
}

- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-AutoWidth(50), AutoWidth(11), AutoWidth(50), AutoWidth(20))];
        _nextButton.titleLabel.font = MFont(AutoWidth(12));
        [_nextButton setTitle:@"换一批" forState:BtnNormal];
        [_nextButton setTitleColor:LH_RGBCOLOR(102, 102, 102) forState:BtnNormal];
        [_nextButton addTarget:self action:@selector(changeNext) forControlEvents:BtnTouchUpInside];
    }
    return _nextButton;
}

- (void)changeNext {
    [self.delegate changeLikeNext];
}

- (void)setTitle:(NSString *)title {
    if ([title isEqualToString:@"搭配套餐推荐"]) {
        _titleLabel.textColor = __DTextColor;
        _nextButton.hidden = YES;
    }
    _titleLabel.text = title;
}




@end
