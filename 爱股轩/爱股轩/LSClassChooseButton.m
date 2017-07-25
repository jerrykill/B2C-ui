//
//  LSClassChooseButton.m
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSClassChooseButton.h"

@interface LSClassChooseButton ()



@end

@implementation LSClassChooseButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat height = frame.size.height;
        CGFloat width = frame.size.width;
        _lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, height-1, width, 1)];
        [self addSubview:_lineIV];
        _lineIV.backgroundColor =LH_RGBCOLOR(237, 237, 237);
    }
    return self;
}

@end
