//
//  LSShopCartNaviView.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopCartNaviView.h"

@interface LSShopCartNaviView ()

@property (strong,nonatomic) UILabel *titleLb;

@property (strong,nonatomic) UIButton *messageBtn;

@property (strong,nonatomic) UIImageView *backIV;

@end

@implementation LSShopCartNaviView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        [self addSubview:self.backIV];
        [self sendSubviewToBack:_backIV];
        [self addSubview:self.titleLb];
        [self addSubview:self.messageBtn];
    }
    return self;
}

#pragma mark ==懒加载==
- (UIImageView *)backIV{
    if (!_backIV) {
        _backIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, 64)];
        _backIV.image = MImage(@"top_bg");

    }
    return _backIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(200))/2, 32, AutoWidth(200), 20)];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = BFont(18);
        _titleLb.textColor = [UIColor whiteColor];
    }
    return _titleLb;
}

- (UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-40, 29, 25, 25)];
        [_messageBtn setImage:MImage(@"news_Cart") forState:BtnNormal];
        [_messageBtn addTarget:self action:@selector(chooseMessage) forControlEvents:BtnTouchUpInside];
    }
    return _messageBtn;
}

- (void)chooseMessage{
    [self.delegate lookMessageCenter];
}

- (void)setTitle:(NSString *)title{
    _titleLb.text = title;
}


@end



