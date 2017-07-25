//
//  LSPersonWalletView.m
//  爱股轩
//
//  Created by imac on 2017/4/12.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSPersonWalletView.h"

@interface LSPersonWalletView ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *detailLabel;

@end

@implementation LSPersonWalletView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
    }
    return self;
}

#pragma mark ==懒加载==
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, AutoWidth(15), (__kWidth-AutoWidth(4))/3, AutoWidth(20))];
        _titleLabel.textColor = __DTextColor;
        _titleLabel.font = MFont(AutoWidth(15));
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectYH(_titleLabel)+AutoWidth(5), (__kWidth-AutoWidth(4))/3, AutoWidth(15))];
        _detailLabel.textColor = LH_RGBCOLOR(117, 117, 117);
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.font = MFont(AutoWidth(12));
    }
    return _detailLabel;
}

- (void)setTitle:(NSString *)title{
    _detailLabel.text = title;
}

- (void)setNormal:(NSString *)normal{
    _titleLabel.text = normal;
}

- (void)setSpecial:(NSString *)special{
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"¥%@",special]];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(14)) range:NSMakeRange(0, 1)];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(15)) range:NSMakeRange(1, attr.length-4)];
    [attr addAttribute:NSFontAttributeName value:MFont(AutoWidth(14)) range:NSMakeRange(attr.length-3, 3)];
    [attr addAttribute:NSForegroundColorAttributeName value:LH_RGBCOLOR(150, 150, 150) range:NSMakeRange(0, 1)];
    _titleLabel.attributedText = attr;

}

@end
