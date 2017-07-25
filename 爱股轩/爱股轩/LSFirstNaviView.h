//
//  LSFirstNaviView.h
//  优胜办公
//
//  Created by imac on 2017/3/31.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSFirstNaviViewDelegate <NSObject>
/**搜索*/
- (void)startSearchAction;
/**扫一扫*/
- (void)makeQRCode;
/**查看消息*/
- (void)lookMessage;

@end

@interface LSFirstNaviView : BaseView

@property (weak,nonatomic) id<LSFirstNaviViewDelegate>delegate;

@end
