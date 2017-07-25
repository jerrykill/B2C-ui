//
//  LSGoodDetailAppraiseSectionView.m
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailAppraiseSectionView.h"

@interface LSGoodDetailAppraiseSectionView ()

@property (strong,nonatomic) UILabel *titleLabel;

@end

@implementation LSGoodDetailAppraiseSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self addSubview:self.titleLabel];
    }
    return self;
}


#pragma mark ==懒加载==
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(10), __kWidth-AutoWidth(30), AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = MFont(AutoWidth(16));
        _titleLabel.textColor = __DTextColor;
        _titleLabel.text = @"评价";
    }
    return _titleLabel;
}

- (void)setCount:(NSString *)count {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"评价（%@）",count]];
    [attr addAttribute:NSForegroundColorAttributeName value:__DefaultColor range:NSMakeRange(2, attr.length-2)];
    _titleLabel.attributedText = attr;
}


@end
