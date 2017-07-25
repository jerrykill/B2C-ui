//
//  LSCoureseTypeButton.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSCourseTypeButton.h"

@interface LSCourseTypeButton ()
{
    CGRect _frame;
}

@end

@implementation LSCourseTypeButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _frame = frame;
        [self addSubview:self.lineIV];
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = MFont(AutoWidth(15));
        [self setTitleColor:__DTextColor forState:BtnNormal];
        [self setTitleColor:__DefaultColor forState:BtnStateSelected];
    }
    return self;
}

#pragma mark ==懒加载==
- (UIImageView *)lineIV{
    if (!_lineIV) {
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, _frame.size.height-AutoWidth(4), _frame.size.width, AutoWidth(4))];
        _lineIV.image = MImage(@"button_bg");
        _lineIV.contentMode = UIViewContentModeScaleAspectFill;
        _lineIV.hidden = YES;
    }
    return _lineIV;
}

@end
