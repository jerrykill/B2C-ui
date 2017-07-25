//
//  LSGoodDetailAppraiseView.h
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol LSGoodDetailAppraiseViewDelegate <NSObject>

- (void)uploadToHead;

@end

@interface LSGoodDetailAppraiseView : BaseView

@property (weak,nonatomic) id<LSGoodDetailAppraiseViewDelegate>delegate;

@end
