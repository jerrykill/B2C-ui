//
//  LSGoodSearchNaviView.m
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodSearchNaviView.h"
#import "LSGoodSearchView.h"

@interface LSGoodSearchNaviView ()<LSGoodSearchViewDelegate>

@property (strong,nonatomic) LSGoodSearchView *searchV;

@property (strong,nonatomic) UIButton *cancelbutton;

@end

@implementation LSGoodSearchNaviView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       self.gradientColor = @"yes";
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.searchV];
    [self addSubview:self.cancelbutton];
}

#pragma mark ==懒加载==
- (LSGoodSearchView *)searchV {
    if (!_searchV) {
        _searchV = [[LSGoodSearchView alloc]initWithFrame:CGRectMake(AutoWidth(10), 25, __kWidth-60, 32)];
        _searchV.isEdit = YES;
        _searchV.delegate = self;
        _searchV.userInteractionEnabled = YES;
    }
    return _searchV;
}

- (UIButton *)cancelbutton {
    if (!_cancelbutton) {
        _cancelbutton = [[UIButton alloc]initWithFrame:CGRectMake(__kWidth-50, 25, 50, 32)];
        _cancelbutton.titleLabel.font = MFont(14);
        _cancelbutton.backgroundColor = [UIColor clearColor];
        [_cancelbutton setTitle:@"取消" forState:BtnNormal];
        [_cancelbutton setTitleColor:[UIColor whiteColor] forState:BtnNormal];
        [_cancelbutton addTarget:self action:@selector(chooseCancel) forControlEvents:BtnTouchUpInside];
    }
    return _cancelbutton;
}

- (void)chooseCancel {
    [self.delegate chooseBack];
}


#pragma mark ==LSGoodSearchViewDelegate==
- (void)goodSearch:(NSString *)sender {
    [self.delegate goodNameSeach:sender];
}



@end
