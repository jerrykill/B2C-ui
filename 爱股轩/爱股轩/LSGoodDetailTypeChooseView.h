//
//  LSGoodDetailTypeChooseView.h
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSGoodDetailTypeChooseViewDelegate <NSObject>

- (void)chooseDetailType:(NSInteger)sender;

@end

@interface LSGoodDetailTypeChooseView : BaseView

@property (assign,nonatomic) NSInteger selectType;

@property (weak,nonatomic) id<LSGoodDetailTypeChooseViewDelegate>delegate;

@end
