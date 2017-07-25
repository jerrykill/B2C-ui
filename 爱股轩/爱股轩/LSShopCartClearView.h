//
//  LSShopCartClearView.h
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"
#import "LSShopCartGoodModel.h"


@protocol LSShopCartClearViewDelegate <NSObject>

- (void)clearPay;

- (void)chooseAll:(BOOL)sender;

@end

@interface LSShopCartClearView : BaseView

@property (assign,nonatomic) BOOL allchoose;

@property (strong,nonatomic) LSShopCartGoodModel *model;

@property (weak,nonatomic) id<LSShopCartClearViewDelegate>delegate;

@end
