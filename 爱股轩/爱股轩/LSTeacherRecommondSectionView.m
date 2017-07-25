//
//  LSTeacherRecommondSectionView.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherRecommondSectionView.h"

@interface LSTeacherRecommondSectionView ()<LSTeacherCourseTypeChooseViewDelegate>

@property (strong,nonatomic) LSTeacherRecommendHeadView *headV;

@property (strong,nonatomic) LSTeacherCourseTypeChooseView *chooseV;

@end

@implementation LSTeacherRecommondSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.headV];
        [self addSubview:self.chooseV];
    }
    return self;
}

- (LSTeacherRecommendHeadView *)headV{
    if (!_headV) {
        _headV = [[LSTeacherRecommendHeadView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(98))];
        
    }
    return _headV;
}

- (LSTeacherCourseTypeChooseView *)chooseV {
    if (!_chooseV) {
        _chooseV = [[LSTeacherCourseTypeChooseView alloc]initWithFrame:CGRectMake(0, CGRectYH(_headV), __kWidth, AutoWidth(45))];
        _chooseV.delegate = self;
    }
    return _chooseV;
}

#pragma mark ==LSTeacherCourseTypeChooseViewDelegate==
- (void)chooseCourse:(NSInteger)sender{
    [self.delegate chooseCourseType:sender];
}

- (void)setModel:(LSTeacherModel *)model{
    _headV.model = model;
}


@end
