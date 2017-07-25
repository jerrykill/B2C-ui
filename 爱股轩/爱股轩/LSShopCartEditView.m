//
//  LSShopCartEditView.m
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSShopCartEditView.h"

@interface LSShopCartEditView ()

@property (strong,nonatomic) UIImageView *lineIV;

@property (strong,nonatomic) UIButton *allChooseButton;

@property (strong,nonatomic) UIButton *shareButton;

@property (strong,nonatomic) UIButton *collectButton;

@end

@implementation LSShopCartEditView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.lineIV];
    [self addSubview:self.allChooseButton];
    [self addSubview:self.shareButton];
    [self addSubview:self.collectButton];
}

#pragma mark ==懒加载==
- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(147), AutoWidth(1))];
        _lineIV.backgroundColor = __BackColor;
    }
    return _lineIV;
}

- (UIButton *)allChooseButton{
    if (!_allChooseButton) {
        _allChooseButton = [[UIButton alloc]initWithFrame:CGRectMake(AutoWidth(10), AutoWidth(15), AutoWidth(90), AutoWidth(22))];
        _allChooseButton.titleLabel.font = MFont(AutoWidth(14));
        [_allChooseButton setTitle:@"全选" forState:BtnNormal];
        [_allChooseButton setTitle:@"取消全选" forState:BtnStateSelected];
        [_allChooseButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnNormal];
        [_allChooseButton setTitleColor:LH_RGBCOLOR(153, 153, 153) forState:BtnStateSelected];
        [_allChooseButton setImage:MImage(@"off") forState:BtnNormal];
        [_allChooseButton setImage:MImage(@"on") forState:BtnStateSelected];
        _allChooseButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, AutoWidth(70));
        _allChooseButton.titleEdgeInsets = UIEdgeInsetsMake(0, -AutoWidth(5), 0, 0);
        [_allChooseButton addTarget:self action:@selector(chooseAll:) forControlEvents:BtnTouchUpInside];
    }
    return _allChooseButton;
}

- (UIButton *)shareButton{
    if (!_shareButton) {
        _shareButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_lineIV), 0, AutoWidth(92), AutoWidth(50))];
        _shareButton.backgroundColor = LH_RGBCOLOR(255, 114, 0);
        _shareButton.titleLabel.font =MFont(AutoWidth(18));
        [_shareButton setTitle:@"分享" forState:BtnNormal];
        [_shareButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_shareButton addTarget:self action:@selector(chooseShare) forControlEvents:BtnTouchUpInside];
    }
    return _shareButton;
}

- (UIButton *)collectButton{
    if (!_collectButton) {
        _collectButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_shareButton), 0, AutoWidth(136), AutoWidth(50))];
        _collectButton.titleLabel.font = MFont(AutoWidth(18));
        _collectButton.backgroundColor = HEXCOLOR(0xce0a14);
        [_collectButton setTitle:@"移入收藏夹" forState:BtnNormal];
        [_collectButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_collectButton addTarget:self action:@selector(chooseCollect) forControlEvents:BtnTouchUpInside];
    }
    return _collectButton;
}

- (void)chooseAll:(UIButton*)sender{
    sender.selected = !sender.selected;
    [self.delegate editChoose:sender.selected];
}

- (void)chooseShare{
    [self.delegate editShare];
}

- (void)chooseCollect{
    [self.delegate editCollect];
}

- (void)setAllChoose:(BOOL)allChoose{
    _allChooseButton.selected = allChoose;
}

@end
