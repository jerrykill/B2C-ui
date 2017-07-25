//
//  LSTeachCourseView.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeachCourseView.h"

@interface LSTeachCourseView ()

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UIImageView *headIV;

@end

@implementation LSTeachCourseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleLabel];
    [self addSubview:self.logoIV];
    [self addSubview:self.headIV];
}

#pragma mark ==懒加载==
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(10), AutoWidth(110), AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = BFont(AutoWidth(17));
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(10), CGRectYH(_titleLabel)+AutoWidth(4), AutoWidth(50), AutoWidth(15))];
        _logoIV.backgroundColor =LH_RandomColor;
    }
    return _logoIV;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(15), CGRectYH(_logoIV)+AutoWidth(10), AutoWidth(100), AutoWidth(140))];
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

- (void)setLogoName:(NSString *)logoName{

}

- (void)setImageName:(NSString *)imageName{

}


@end
