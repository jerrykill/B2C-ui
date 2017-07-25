//
//  LSCourseCell.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSCourseCell.h"
#import "LSTeachCourseView.h"
#import "LSComputerPackageView.h"
#import "LSBookOrChatView.h"

@interface LSCourseCell ()

@property (strong,nonatomic) LSTeachCourseView *teachV;

@property (strong,nonatomic) LSComputerPackageView *packageV;

@property (strong,nonatomic) LSBookOrChatView *bookV;

@property (strong,nonatomic) LSBookOrChatView *chatV;

@end

@implementation LSCourseCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.teachV];
    [self addSubview:self.packageV];
    [self addSubview:self.bookV];
    [self addSubview:self.chatV];
}

#pragma mark ==懒加载==
- (LSTeachCourseView *)teachV{
    if (!_teachV) {
        _teachV = [[LSTeachCourseView alloc]initWithFrame:CGRectMake(0, 0, AutoWidth(125), AutoWidth(200))];
        _teachV.title = @"郭海培课程";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCoureseView)];
        [_teachV addGestureRecognizer:tap];
    }
    return _teachV;
}

- (LSComputerPackageView *)packageV{
    if (!_packageV) {
        _packageV = [[LSComputerPackageView alloc]initWithFrame:CGRectMake(CGRectXW(_teachV)+1, 0, __kWidth-AutoWidth(125)-1, AutoWidth(77))];
        _packageV.title = @"学习终端套餐";
        _packageV.detail = @"超值套餐";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPackageView)];
        [_packageV addGestureRecognizer:tap];
    }
    return _packageV;
}

- (LSBookOrChatView *)bookV{
    if (!_bookV) {
        _bookV = [[LSBookOrChatView alloc]initWithFrame:CGRectMake(CGRectXW(_teachV)+1, CGRectYH(_packageV)+1, (__kWidth-AutoWidth(125)-2)/2, AutoWidth(123)-1)];
        _bookV.title = @"爱股轩书籍";
        _bookV.detail = @"书中自有黄金屋";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBookView)];
        [_bookV addGestureRecognizer:tap];
    }
    return _bookV;
}

- (LSBookOrChatView *)chatV{
    if (!_chatV) {
        _chatV = [[LSBookOrChatView alloc]initWithFrame:CGRectMake(CGRectXW(_bookV)+1, CGRectYH(_packageV)+1, (__kWidth-AutoWidth(125)-2)/2, AutoWidth(123)-1)];
        _chatV.title = @"爱股轩点券";
        _chatV.detail = @"在线问答";
        _chatV.isLast = @"1";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapChatView)];
        [_chatV addGestureRecognizer:tap];
    }
    return _chatV;
}

- (void)tapCoureseView{
    [self.delegate chooseCoureseView:0];
}

- (void)tapPackageView{
    [self.delegate chooseCoureseView:1];
}

- (void)tapBookView{
    [self.delegate chooseCoureseView:2];
}

- (void)tapChatView{
    [self.delegate chooseCoureseView:3];
}


@end
