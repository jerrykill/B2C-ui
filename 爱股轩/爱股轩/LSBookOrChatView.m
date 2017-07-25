
//
//  LSBookOrChatView.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSBookOrChatView.h"

@interface LSBookOrChatView ()
{
    CGRect _frame;
}

@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UILabel *detailLabel;

@property (strong,nonatomic) UIImageView *headIV;

@end

@implementation LSBookOrChatView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _frame =frame;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.titleLabel];
    [self addSubview:self.detailLabel];
    [self addSubview:self.headIV];
}

#pragma mark ==懒加载==
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, AutoWidth(10), _frame.size.width, AutoWidth(20))];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = LH_RGBCOLOR(103, 60, 234);
        _titleLabel.font = BFont(AutoWidth(16));

    }
    return _titleLabel;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectYH(_titleLabel)+AutoWidth(4), _frame.size.width, AutoWidth(16))];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = LH_RGBCOLOR(111, 111, 111);
        _detailLabel.font = MFont(AutoWidth(14));
    }
    return _detailLabel;
}

- (UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake((_frame.size.width-AutoWidth(64))/2, CGRectYH(_detailLabel)+AutoWidth(6), AutoWidth(64), AutoWidth(62))];
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

-(void)setDetail:(NSString *)detail{
    _detailLabel.text = detail;
}

- (void)setImageName:(NSString *)imageName{

}

- (void)setIsLast:(NSString *)isLast{
    _titleLabel.textColor = LH_RGBCOLOR(255, 37, 0);
}

@end
