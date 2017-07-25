//
//  YGoodDetailView.m
//  优胜办公
//
//  Created by imac on 2016/12/14.
//  Copyright © 2016年 联系QQ:1084356436. All rights reserved.
//

#import "YGoodDetailView.h"
#import <WebKit/WebKit.h>

@interface YGoodDetailView()<UIScrollViewDelegate,WKNavigationDelegate>
{
 UIActivityIndicatorView *activityIndicator;
    CGRect _frame;
}


@property (strong,nonatomic) WKWebView *webV;

@property (strong, nonatomic) UILabel *bottomMsgLabel;

@property (nonatomic) BOOL isHead;

@end

@implementation YGoodDetailView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _frame=frame;
        [self addSubview:self.webV];

    }
    return self;
}

#pragma mark ==懒加载==
-(WKWebView *)webV{
    if (!_webV) {
        _webV = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
        _webV.navigationDelegate = self;
        [_webV.scrollView addSubview:self.bottomMsgLabel];
        _webV.scrollView.delegate = self;
    }
    return _webV;
}

-(UILabel *)bottomMsgLabel{
    if (!_bottomMsgLabel) {
        _bottomMsgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -40, __kWidth, 40)];
        _bottomMsgLabel.font = [UIFont systemFontOfSize:13.0f];
        _bottomMsgLabel.textAlignment = NSTextAlignmentCenter;
        _bottomMsgLabel.text = @"下拉返回商品详情";
    }
    return _bottomMsgLabel;
}


-(void)setGoodsUrlStr:(NSString *)goodsUrlStr{
    _goodsUrlStr = goodsUrlStr;
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_goodsUrlStr]];
    [_webV loadRequest:request];
}

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"开始加载");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"返回加载");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"加载失败");
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    CGFloat offset = scrollView.contentOffset.y;
    if (offset<40) {
        [self.delegate getGoodHead];
    }
}



@end
