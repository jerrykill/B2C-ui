//
//  LSShopCartEditView.h
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSShopCartEditViewDelegate <NSObject>

- (void)editChoose:(BOOL)sender;

- (void)editShare;

- (void)editCollect;

@end

@interface LSShopCartEditView : BaseView

@property (assign,nonatomic) BOOL allChoose;

@property (weak,nonatomic) id<LSShopCartEditViewDelegate>delegate;

@end
