//
//  LSGoodSizeListView.h
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"
#import "LSGoodDetailModel.h"
#import "LSGoodModel.h"

@protocol LSGoodSizeListViewDelegate <NSObject>

- (void)changeGoodCount:(BOOL)sender;

- (void)addShopCart;

- (void)payNow;

- (void)chooseGoodCheckType:(NSInteger)index;

@end

@interface LSGoodSizeListView : BaseView

@property (strong,nonatomic) LSGoodDetailModel *data;

@property (strong,nonatomic) LSGoodModel *model;

@property (weak,nonatomic) id<LSGoodSizeListViewDelegate>delegate;

@end
