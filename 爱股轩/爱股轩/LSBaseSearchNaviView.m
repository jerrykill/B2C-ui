//
//  LSBaseSearchNaviView.m
//  爱股轩
//
//  Created by imac on 2017/4/21.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSBaseSearchNaviView.h"
#import "LSGoodSearchView.h"

@interface LSBaseSearchNaviView ()<LSGoodSearchViewDelegate>

@property (strong,nonatomic) UIButton *backButton;

@property (strong,nonatomic) LSGoodSearchView *searchV;

@property (strong,nonatomic) UIButton *rightButton;

@end

@implementation LSBaseSearchNaviView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.gradientColor = @"yes";
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.backButton];
    [self addSubview:self.searchV];
    [self addSubview:self.rightButton];
}

#pragma mark ==懒加载==
-  (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc]initWithFrame:CGRectMake(11, 30, 23, 23)];
        _backButton.layer.cornerRadius = 12.5;
        [_backButton setImage:MImage(@"back") forState:BtnNormal];
        [_backButton addTarget:self action:@selector(chooseBack) forControlEvents:BtnTouchUpInside];
    }
    return _backButton;
}

- (LSGoodSearchView *)searchV {
    if (!_searchV) {
        _searchV = [[LSGoodSearchView alloc]initWithFrame:CGRectMake(CGRectXW(_backButton)+16, 25, __kWidth-100, 32)];
        _searchV.isEdit = _isEdit;
        _searchV.delegate = self;
        _searchV.userInteractionEnabled = YES;
    }
    return _searchV;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-35, 29, 25, 25)];
        [_rightButton setImage:MImage(@"more") forState:BtnNormal];
        _rightButton.titleLabel.font = MFont(15);
        [_rightButton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_rightButton addTarget:self action:@selector(chooseRight) forControlEvents:BtnTouchUpInside];
    }
    return _rightButton;
}

- (void)chooseBack {
    [self.delegate backAction];
}

- (void)chooseRight {
    [self.delegate rightAction];
}

- (void)setSearchText:(NSString *)searchText {
    _searchV.searchText = searchText;
}

#pragma mark ==LSGoodSearchViewDelegate==
- (void)startEdit {
    [self.delegate startSearch];
}


- (void)goodSearch:(NSString *)sender {
    [self.delegate searchAction:sender];
}

@end
