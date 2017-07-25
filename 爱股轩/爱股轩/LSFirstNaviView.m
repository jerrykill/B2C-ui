//
//  LSFirstNaviView.m
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSFirstNaviView.h"
#import "LSNaviSearchView.h"

@interface LSFirstNaviView ()<LSNaviSearchViewDelegate>

@property (strong,nonatomic) UIImageView *backIV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) LSNaviSearchView *searchV;

@property (strong,nonatomic) UIButton *qrCodeButton;

@property (strong,nonatomic) UIButton *messageButton;

@end

@implementation LSFirstNaviView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.backIV];
        [self sendSubviewToBack:_backIV];
        [self addSubview:self.logoIV];
        [self addSubview:self.searchV];
        [self addSubview:self.qrCodeButton];
        [self addSubview:self.messageButton];
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

- (UIImageView *)logoIV{
    if (!_logoIV) {
        _logoIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 33, 22)];
        _logoIV.image = MImage(@"logo_top");
        _logoIV.backgroundColor = [UIColor clearColor];
        _logoIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _logoIV;
}

- (LSNaviSearchView *)searchV{
    if (!_searchV) {
        _searchV = [[LSNaviSearchView alloc]initWithFrame:CGRectMake(50, 25, __kWidth-135, 32)];
        _searchV.delegate = self;
    }
    return _searchV;
}

- (UIButton *)qrCodeButton{
    if (!_qrCodeButton) {
        _qrCodeButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_searchV)+2.5, 25, 35, 32)];
        _qrCodeButton.backgroundColor = [UIColor clearColor];
        _qrCodeButton.titleLabel.font = MFont(9);
        [_qrCodeButton setTitle:@"扫一扫" forState:BtnNormal];
        [_qrCodeButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_qrCodeButton setImage:MImage(@"scan_icon") forState:BtnNormal];
        _qrCodeButton.titleEdgeInsets = UIEdgeInsetsMake(23, -20, 0, 0);
        _qrCodeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 12, 0);
        [_qrCodeButton addTarget:self action:@selector(chooseQR) forControlEvents:BtnTouchUpInside];
    }
    return _qrCodeButton;
}

- (UIButton *)messageButton{
    if (!_messageButton) {
        _messageButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_qrCodeButton)+2.5, 25, 35, 32)];
        _messageButton.backgroundColor = [UIColor clearColor];
        _messageButton.titleLabel.font = MFont(9);
        [_messageButton setTitle:@"消息中心" forState:BtnNormal];
        [_messageButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_messageButton setImage:MImage(@"news_icon") forState:BtnNormal];
        _messageButton.titleEdgeInsets = UIEdgeInsetsMake(23, -20, 0, 0);
        _messageButton.imageEdgeInsets = UIEdgeInsetsMake(0, 8, 12, 0);
        [_messageButton addTarget:self action:@selector(chooseMessage) forControlEvents:BtnTouchUpInside];
    }
    return _messageButton;
}


- (void)chooseQR{
    [self.delegate makeQRCode];
}

- (void)chooseMessage{
    [self.delegate lookMessage];
}
#pragma mark ==LSNaviSearchViewDelegate==
-(void)startSearch{
    [self.delegate startSearchAction];
}


@end
