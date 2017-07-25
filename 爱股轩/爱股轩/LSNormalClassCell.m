//
//  LSNormalClassCell.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSNormalClassCell.h"

@interface LSNormalClassCell ()

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UILabel *titleLb;


@end

@implementation LSNormalClassCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];

    }
    return self;
}

- (void)initView{

}

#pragma mark ==懒加载==
- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(AutoWidth(6), AutoWidth(5), AutoWidth(75), AutoWidth(75))];
        _logoIV.backgroundColor = LH_RandomColor;
    }
    return _logoIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake(AutoWidth(6), CGRectYH(_logoIV)+AutoWidth(2), AutoWidth(75), AutoWidth(18))];
        _titleLb.textColor = __TextColor;
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = MFont(AutoWidth(14));
    }
    return _titleLb;
}

- (void)setTitle:(NSString *)title{
    _titleLb.text = title;
}

- (void)setImageName:(NSString *)imageName{
  
}


@end
