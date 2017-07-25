//
//  LSPersonWalletCell.m
//  爱股轩
//
//  Created by imac on 2017/4/12.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSPersonWalletCell.h"
#import "LSPersonWalletView.h"

@interface LSPersonWalletCell ()

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UIImageView *leftIV;

@property (strong,nonatomic) UIImageView *rightIV;

@property (strong,nonatomic) LSPersonWalletView *userV;

@property (strong,nonatomic) LSPersonWalletView *stockV;

@property (strong,nonatomic) LSPersonWalletView *integralV;

@end

@implementation LSPersonWalletCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.lineIV];
    [self addSubview:self.leftIV];
    [self addSubview:self.rightIV];
    [self addSubview:self.userV];
    [self addSubview:self.stockV];
    [self addSubview:self.integralV];
}
#pragma mark == 懒加载==
- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (UIImageView *)leftIV{
    if (!_leftIV) {
        _leftIV = [[UIImageView alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(4))/3, AutoWidth(10), AutoWidth(2), AutoWidth(45))];
        _leftIV.backgroundColor = __BackColor;
    }
    return _leftIV;
}

- (UIImageView *)rightIV{
    if (!_rightIV) {
        _rightIV = [[UIImageView alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(4))/3*2+AutoWidth(2), AutoWidth(10), AutoWidth(2), AutoWidth(45))];
        _rightIV.backgroundColor = __BackColor;
    }
    return _rightIV;
}

- (LSPersonWalletView *)userV{
    if (!_userV) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseUser)];
        _userV = [[LSPersonWalletView alloc]initWithFrame:CGRectMake(0, AutoWidth(1), (__kWidth-AutoWidth(4))/3, AutoWidth(64))];
        [_userV addGestureRecognizer:tap];
        _userV.special = @"19990.00";
        _userV.title = @"账户余额";
    }
    return _userV;
}

- (LSPersonWalletView *)stockV{
    if (!_stockV) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseStock)];
        _stockV = [[LSPersonWalletView alloc]initWithFrame:CGRectMake(CGRectXW(_leftIV), AutoWidth(1), (__kWidth-AutoWidth(4))/3, AutoWidth(64))];
        [_stockV addGestureRecognizer:tap];
        _stockV.normal = @"10000";
        _stockV.title = @"股币";
    }
    return _stockV;
}

- (LSPersonWalletView *)integralV{
    if (!_integralV) {
         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chooseIntegral)];
        _integralV = [[LSPersonWalletView alloc]initWithFrame:CGRectMake(CGRectXW(_rightIV), AutoWidth(1), (__kWidth-AutoWidth(4))/3, AutoWidth(64))];
        [_integralV addGestureRecognizer:tap];
        _integralV.normal = @"10000";
        _integralV.title = @"积分";
    }
    return _integralV;
}


#pragma mark ==账户余额==
- (void)chooseUser{
    [self.delegate lookUseMoney];
}

#pragma mark ==股币==
- (void)chooseStock{
    [self.delegate lookStockMoney];
}

#pragma mark ==积分==
- (void)chooseIntegral{
    [self.delegate lookIntegral];
}


@end
