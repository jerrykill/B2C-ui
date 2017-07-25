//
//  LSGoodPicturesHeaderView.m
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "LSGoodPicturesHeaderView.h"

@interface LSGoodPicturesHeaderView ()<UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *scrollV;

@property (strong,nonatomic) UIPageControl *pageControl;

@end

@implementation LSGoodPicturesHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.scrollV];
    [self addSubview:self.pageControl];
}

#pragma mark ==懒加载==
- (UIScrollView *)scrollV {
    if (!_scrollV) {
        _scrollV  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, AutoWidth(311))];
        _scrollV.contentSize = CGSizeMake(__kWidth, 0);
        _scrollV.delegate = self;
        _scrollV.scrollEnabled = YES;
        _scrollV.bounces = YES;
        _scrollV.pagingEnabled = YES;
        _scrollV.showsVerticalScrollIndicator = NO;
        _scrollV.showsHorizontalScrollIndicator = NO;
    }
    return _scrollV;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, CGRectYH(_scrollV)-10, __kWidth, 10)];
        _pageControl.numberOfPages = _imageArr.count;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = LH_RGBCOLOR(166, 67, 15);
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

- (void)setImageArr:(NSArray *)imageArr{
    _imageArr= imageArr;
    _pageControl.numberOfPages = _imageArr.count;
    for (id obj in _scrollV.subviews) {
        [obj removeFromSuperview];
    }
    for (int i=0; i<_imageArr.count; i++) {
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i*__kWidth, 0, __kWidth, AutoWidth(311))];
        imageV.contentMode = UIViewContentModeScaleAspectFill;
        imageV.backgroundColor = LH_RandomColor;
//        [imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HomeADUrl,_imageArr[i]]]];
        [_scrollV addSubview:imageV];
    }
    _scrollV.contentSize = CGSizeMake(__kWidth*_imageArr.count, 0);
}


#pragma mark ==UIScrollViewDelegate==
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = _scrollV.contentOffset;
    NSInteger index = round(point.x/__kWidth);
    if (index == _imageArr.count) {
        index = 0;
    }
    _pageControl.currentPage = index;
}
  

@end
