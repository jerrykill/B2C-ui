//
//  LSAdWarnHeadView.m
//  爱股轩
//
//  Created by imac on 2017/4/6.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSAdWarnHeadView.h"
#import "YAdHeadView.h"
#import "LSAnnouncementView.h"

@interface LSAdWarnHeadView ()<YAdHeadViewDelegate,LSAnnouncementViewDelegate>
{
    CGRect _frame;
}

@property (strong,nonatomic) YAdHeadView *adHeadV;

@property (strong,nonatomic) LSAnnouncementView *announcementV;

@end

@implementation LSAdWarnHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        _frame= frame;
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.adHeadV];
    [self addSubview:self.announcementV];
}

#pragma mark ==懒加载==
- (YAdHeadView *)adHeadV{
    if (!_adHeadV) {
        _adHeadV = [[YAdHeadView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, AutoWidth(165))];
        _adHeadV.delegate = self;
    }
    return _adHeadV;
}

- (LSAnnouncementView *)announcementV{
    if (!_announcementV) {
        _announcementV = [[LSAnnouncementView alloc]initWithFrame:CGRectMake(0, CGRectYH(_adHeadV), _frame.size.width, 40)];
        _announcementV.delegate = self;
    }
    return _announcementV;
}

#pragma mark ==YAdHeadViewDelegate==
- (void)chooseAD:(NSString *)url{
    [self.delegate clickAdPicture:url];
}

#pragma mark ==LSAnnouncementViewDelegate==
- (void)chooseWarn:(NSInteger)index{
    [self.delegate chooseWarnIndex:index];
}

- (void)getMore{
    [self.delegate chooseMore];
}

- (void)setTitleArr:(NSArray<YWarnModel *> *)titleArr{
    _announcementV.titleArr = titleArr;
}

- (void)setImageArr:(NSArray<YHeadImage *> *)imageArr{
    _adHeadV.dataArr = imageArr;
}


@end
