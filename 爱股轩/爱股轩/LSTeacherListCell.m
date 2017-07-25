//
//  LSTeacherListCell.m
//  爱股轩
//
//  Created by imac on 2017/4/14.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherListCell.h"

@interface LSTeacherListCell ()

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UILabel *titleLabel;

@end

@implementation LSTeacherListCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.headIV];
    
    [self addSubview:self.titleLabel];
}

#pragma mark ==懒加载==
- (UIImageView *)headIV {
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(15), AutoWidth(15), AutoWidth(80), AutoWidth(80))];
        _headIV.layer.cornerRadius = AutoWidth(40);
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectYH(_headIV)+AutoWidth(5), AutoWidth(110), AutoWidth(22))];
        _titleLabel.font = MFont(AutoWidth(17));
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = __DTextColor;
    }
    return _titleLabel;
}

- (void)setTitle:(NSString *)title {
    _titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName {
    [_headIV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,imageName]]];
}


@end
