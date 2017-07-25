//
//  LSGoodDetailBottomTypesView.h
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSGoodDetailBottomTypesViewDelegate <NSObject>

- (void)makeDetailClearFrame;

- (void)chooseTypeIndex:(NSInteger)sender;

@end


@interface LSGoodDetailBottomTypesView : BaseView

@property (weak,nonatomic) id<LSGoodDetailBottomTypesViewDelegate>delegate;

@end
