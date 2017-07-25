//
//  LSNewsNaviView.h
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSNewsNaviViewDelegate <NSObject>

- (void)goinMessageCenter;

- (void)startSeach;

@end

@interface LSNewsNaviView : BaseView

@property (weak,nonatomic) id<LSNewsNaviViewDelegate>delegate;

@end
