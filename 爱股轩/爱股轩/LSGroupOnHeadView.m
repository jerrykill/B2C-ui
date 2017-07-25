//
//  LSGroupOnHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGroupOnHeadView.h"
#import "YAdHeadView.h"

@interface LSGroupOnHeadView ()<YAdHeadViewDelegate>

@property (strong,nonatomic) YAdHeadView *adHeadV;

@property (strong,nonatomic) UIImageView *headIV;

@end

@implementation LSGroupOnHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.adHeadV];
    [self addSubview:self.headIV];
}

#pragma mark ==懒加载==
- (YAdHeadView *)adHeadV {
    if (!_adHeadV) {
        _adHeadV = [[YAdHeadView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(210))];
        _adHeadV.delegate = self;
    }
    return _adHeadV;
}

- (UIImageView *)headIV {
    if (!_headIV) {
        _headIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectYH(_adHeadV), __kWidth, AutoWidth(40))];
        _headIV.image = MImage(@"h2_tlt_01");
        _headIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headIV;
}

#pragma mark ==YAdHeadViewDelegate==
- (void)chooseAD:(NSString *)url{
    [self.delegate chooseAdPic:url];
}


- (void)setImageArr:(NSArray<YHeadImage *> *)imageArr{
    _adHeadV.dataArr = imageArr;
}





@end
