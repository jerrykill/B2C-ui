//
//  LSOrderTypeButton.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSOrderTypeButton.h"


@implementation LSOrderTypeButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;

        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, height-1, width, 1)];
        [self addSubview:_lineIV];
        _lineIV.userInteractionEnabled = NO;
        _lineIV.backgroundColor = [UIColor whiteColor];

        self.titleLabel.font = MFont(15);
        [self setTitleColor:__DefaultColor forState:BtnStateSelected];
        [self setTitleColor:LH_RGBCOLOR(120, 120, 120) forState:BtnNormal];
    }
    return self;
}

@end
