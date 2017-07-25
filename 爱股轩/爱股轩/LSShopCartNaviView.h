//
//  LSShopCartNaviView.h
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSShopCartNaviViewDelegate <NSObject>

- (void)lookMessageCenter;

@end

@interface LSShopCartNaviView : BaseView

@property (weak,nonatomic) id<LSShopCartNaviViewDelegate>delegate;

@property (strong,nonatomic) NSString *title;

@end
