//
//  LSTeacherCourseTypeChooseView.m
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSTeacherCourseTypeChooseView.h"
#import "LSCourseTypeButton.h"

@interface LSTeacherCourseTypeChooseView ()

@property (strong,nonatomic) LSCourseTypeButton *courseButton;

@property (strong,nonatomic) LSCourseTypeButton *bookButton;

@end

@implementation LSTeacherCourseTypeChooseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self  = [super initWithFrame: frame]) {
        self.backgroundColor = __BackColor;
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.courseButton];
    [self addSubview:self.bookButton];
    
}

#pragma mark ==懒加载==
- (LSCourseTypeButton *)courseButton{
    if (!_courseButton) {
        _courseButton = [[LSCourseTypeButton alloc]initWithFrame:CGRectMake(0, AutoWidth(2), AutoWidth(186.5), AutoWidth(38))];
        _courseButton.tag = 1;
        [_courseButton setTitle:@"培训课程" forState:BtnNormal];
        [_courseButton setTitle:@"培训课程" forState:BtnStateSelected];
        [_courseButton addTarget:self action:@selector(chooseType:) forControlEvents:BtnTouchUpInside];
        _courseButton.selected = YES;
        _courseButton.lineIV.hidden = NO;
    }
    return _courseButton;
}

- (LSCourseTypeButton *)bookButton {
    if (!_bookButton) {
        _bookButton = [[LSCourseTypeButton alloc]initWithFrame:CGRectMake(CGRectXW(_courseButton)+AutoWidth(2), AutoWidth(2), AutoWidth(186.5), AutoWidth(38))];
        _bookButton.tag = 2;
        [_bookButton setTitle:@"股票书籍" forState:BtnNormal];
        [_bookButton setTitle:@"股票书籍" forState:BtnStateSelected];
        [_bookButton addTarget:self action:@selector(chooseType:) forControlEvents:BtnTouchUpInside];
    }
    return _bookButton;
}


- (void)chooseType:(LSCourseTypeButton*)sender{
    if (sender.tag ==1) {
        _courseButton.selected = YES;
        _courseButton.lineIV.hidden = NO;
        _bookButton.selected = NO;
        _bookButton.lineIV.hidden = YES;
        _courseButton.userInteractionEnabled = NO;
        _bookButton.userInteractionEnabled = YES;
    }else{
        _courseButton.selected = NO;
        _courseButton.lineIV.hidden = YES;
        _bookButton.selected = YES;
        _bookButton.lineIV.hidden = NO;
        _courseButton.userInteractionEnabled = YES;
        _bookButton.userInteractionEnabled = NO;
    }
    [self.delegate chooseCourse:(sender.tag-1)];
}

@end
