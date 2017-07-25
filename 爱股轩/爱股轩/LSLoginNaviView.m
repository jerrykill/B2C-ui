//
//  LSLoginNaviView.m
//  爱股轩
//
//  Created by imac on 2017/4/13.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSLoginNaviView.h"

@interface LSLoginNaviView ()

@property (strong,nonatomic) UIButton *backButton;

@property (strong,nonatomic) UILabel *titleLabel;


@property (strong,nonatomic) UIImageView *lineIV;

@end

@implementation LSLoginNaviView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.backButton];
        [self addSubview:self.titleLabel];
        [self addSubview:self.lineIV];
    }
    return self;
}

#pragma mark ==懒加载==
- (UIButton *)backButton{
    if (!_backButton) {
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 29, 30, 25)];
        _backButton.titleLabel.font = MFont(14);
        [_backButton setTitle:@"取消" forState:BtnNormal];
        [_backButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnNormal];
        [_backButton addTarget:self action:@selector(chooseBack) forControlEvents:BtnTouchUpInside];
    }
    return _backButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((__kWidth-120)/2, 32, 120, 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = BFont(18);
        _titleLabel.textColor = __DTextColor;
    }
    return _titleLabel;
}

- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 63, __kWidth, 1)];
        _lineIV.backgroundColor = LH_RGBCOLOR(225, 225, 225);
        _lineIV.hidden = YES;
    }
    return _lineIV;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

- (void)setCancel:(NSString *)cancel{
    [_backButton setTitle:cancel forState:BtnNormal];
    _lineIV.hidden = NO;
}

- (void)chooseBack{
    [self.delegate naviBack];
}

@end
