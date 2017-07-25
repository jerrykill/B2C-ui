//
//  YADClassCell.m
//  优胜办公
//
//  Created by imac on 2016/11/23.
//  Copyright © 2016年 联系QQ:1084356436. All rights reserved.
//

#import "YADClassCell.h"

@interface YADClassCell(){
    CGFloat _width;
}

@property (strong,nonatomic) UIImageView *headIV;

@property (strong,nonatomic) UILabel *titleLb;

@end

@implementation YADClassCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _width = frame.size.width;
        [self addSubview:self.headIV];
        [self addSubview:self.titleLb];
        
    }
    return self;
}

-(void)setData:(YHeadClass *)data{
    _data = data;
    _headIV.image = MImage(_data.imageName);
    _titleLb.text = _data.title;
}

#pragma mark ==懒加载==
-(UIImageView *)headIV{
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:
                   CGRectMake((_width-AutoWidth(64))/2, AutoWidth(13), AutoWidth(64), AutoWidth(64))];
        _headIV.layer.cornerRadius = AutoWidth(32);
        _headIV.backgroundColor = LH_RandomColor;
    }
    return _headIV;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:
                    CGRectMake(0, CGRectYH(_headIV)+AutoWidth(5), _width, 20)];
        _titleLb.textColor = __DTextColor;
        _titleLb.font = MFont(AutoWidth(15));
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}


@end
