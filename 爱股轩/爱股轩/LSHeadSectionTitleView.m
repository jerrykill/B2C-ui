//
//  LSHeadSectionTitleView.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSHeadSectionTitleView.h"

@interface LSHeadSectionTitleView ()
{
    CGRect _frame;
}

@property (strong,nonatomic) UIImageView *backIV;


@end

@implementation LSHeadSectionTitleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _frame = frame;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.backIV];

}

#pragma mark ==懒加载==
- (UIImageView *)backIV{
    if (!_backIV) {
        _backIV =[[UIImageView alloc]initWithFrame:CGRectMake((__kWidth-AutoWidth(148))/2, (_frame.size.height-AutoWidth(16))/2, AutoWidth(148), AutoWidth(16))];
        _backIV.contentMode = UIViewContentModeScaleToFill;
    }
    return _backIV;
}

- (void)setImageName:(NSString *)imageName{
    _backIV.image = MImage(imageName);
}

- (void)setType:(NSString *)type{
    self.backgroundColor = __BackColor;
}


@end


