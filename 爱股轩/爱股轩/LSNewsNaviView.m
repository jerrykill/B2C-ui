//
//  LSNewsNaviView.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSNewsNaviView.h"
#import "LSNaviSearchView.h"


@interface LSNewsNaviView ()<LSNaviSearchViewDelegate>

@property (strong,nonatomic) UIImageView *backIV;

@property (strong,nonatomic) UIImageView *logoIV;

@property (strong,nonatomic) UIButton *newsButton;

@property (strong,nonatomic) LSNaviSearchView *searchV;

@end

@implementation LSNewsNaviView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.backIV];
    [self sendSubviewToBack:self.backIV];
    [self addSubview:self.logoIV];
    [self addSubview:self.searchV];
    [self addSubview:self.newsButton];
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
        _searchV = [[LSNaviSearchView alloc]initWithFrame:CGRectMake(50, 25, __kWidth-105, 32)];
        _searchV.delegate = self;
        _searchV.userInteractionEnabled = YES;
    }
    return _searchV;
}

- (UIButton *)newsButton{
    if (!_newsButton) {
        _newsButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectXW(_searchV)+8, 25, 35, 32)];
        _newsButton.backgroundColor= [UIColor clearColor];
        _newsButton.titleLabel.font = MFont(9);
        [_newsButton setTitle:@"消息中心" forState:BtnNormal];
        [_newsButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_newsButton setImage:MImage(@"news_icon") forState:BtnNormal];
        _newsButton.titleEdgeInsets = UIEdgeInsetsMake(23, -20, 0, 0);
        _newsButton.imageEdgeInsets = UIEdgeInsetsMake(0, 8, 12, 0);
        [_newsButton addTarget:self action:@selector(lookMessage) forControlEvents:BtnTouchUpInside];
    }
    return _newsButton;
}

- (void)lookMessage{
    [self.delegate goinMessageCenter];
}

#pragma mark ==LSNaviSearchViewDelegate==
-(void)startSearch{
    [self.delegate startSeach];
}

@end
