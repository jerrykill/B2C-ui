//
//  LSGoodDetailBottomTypesView.m
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodDetailBottomTypesView.h"
#import "LSGoodDetailTypeChooseView.h"
#import "YGoodDetailView.h"
#import "YGoodDetailSpecificationView.h"
#import "LSGoodDetailAppraiseView.h"

@interface LSGoodDetailBottomTypesView ()<LSGoodDetailTypeChooseViewDelegate,YGoodDetailSpecificationViewDelegate,YGoodDetailViewDelegate,LSGoodDetailAppraiseViewDelegate>

@property (strong,nonatomic) LSGoodDetailTypeChooseView *typeV;

//图文详情
@property (strong,nonatomic) YGoodDetailView *deatilVew;
//规格参数
@property (strong,nonatomic) YGoodDetailSpecificationView *specificationView;
//商品评价
@property (strong,nonatomic) LSGoodDetailAppraiseView *appraiseV;

@end

@implementation LSGoodDetailBottomTypesView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}


- (void)initView {
    [self addSubview:self.typeV];
    [self addSubview:self.deatilVew];
    [self addSubview:self.specificationView];
    _specificationView.hidden = YES;
    [self addSubview:self.appraiseV];
    _appraiseV.hidden = YES;

}
#pragma mark ==懒加载==
-(LSGoodDetailTypeChooseView *)typeV{
    if (!_typeV) {
        _typeV = [[LSGoodDetailTypeChooseView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(38))];
        _typeV.delegate = self;
    }
    return _typeV;
}

-(YGoodDetailView *)deatilVew{
    if (!_deatilVew) {
        _deatilVew = [[YGoodDetailView alloc]initWithFrame:CGRectMake(0, AutoWidth(40), __kWidth, __kHeight-114-AutoWidth(40))];
        _deatilVew.goodsUrlStr = @"https://www.baidu.com";
        _deatilVew.delegate =self;
    }
    return _deatilVew;
}

-(YGoodDetailSpecificationView *)specificationView{
    if (!_specificationView) {
        _specificationView = [[YGoodDetailSpecificationView alloc]initWithFrame:CGRectMake(0, AutoWidth(40), __kWidth, __kHeight-114-AutoWidth(40))];
        _specificationView.delegate = self;
    }
    return _specificationView;
}

- (LSGoodDetailAppraiseView *)appraiseV {
    if (!_appraiseV) {
        _appraiseV = [[LSGoodDetailAppraiseView alloc]initWithFrame:CGRectMake(0, AutoWidth(40), __kWidth, __kHeight-AutoWidth(40)-114)];
        _appraiseV.delegate = self;
    }
    return _appraiseV;
}

#pragma mark ==YGoodDetailViewDelegate==
-(void)getGoodHead{
    [self.delegate makeDetailClearFrame];
}
#pragma mark ==YGoodDetailSpecificationViewDelegate==
-(void)getFresh{
    [self.delegate makeDetailClearFrame];
}

#pragma mark ==LSGoodDetailAppraiseViewDelegate==
- (void)uploadToHead {
    [self.delegate makeDetailClearFrame];
}


#pragma mark ==LSGoodDetailTypeChooseViewDelegate==
- (void)chooseDetailType:(NSInteger)sender {
    switch (sender) {
        case 0:
        {
            _deatilVew.hidden = NO;
            _specificationView.hidden = YES;
            _appraiseV.hidden = YES;
        }
            break;
        case 1:
        {
            _deatilVew.hidden = YES;
            _specificationView.hidden = NO;
            _appraiseV.hidden = YES;
//            _consultView.hidden = YES;
        }
            break;
        case 2:
        {
            _deatilVew.hidden = YES;
            _specificationView.hidden = YES;
            _appraiseV.hidden = NO;
//            _consultView.hidden = YES;
        }
            break;
        case 3:{
            _deatilVew.hidden = YES;
            _specificationView.hidden = YES;
            _appraiseV.hidden = YES;
//            _consultView.hidden = NO;
        }
            break;
        default:
            break;

    }
    [self.delegate chooseTypeIndex:sender];
}

@end
