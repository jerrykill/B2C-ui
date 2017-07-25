//
//  YGoodDetailView.h
//  优胜办公
//
//  Created by imac on 2016/12/14.
//  Copyright © 2016年 联系QQ:1084356436. All rights reserved.
//

#import "BaseView.h"

@protocol YGoodDetailViewDelegate <NSObject>

-(void)getGoodHead;

@end

@interface YGoodDetailView : BaseView

@property (strong,nonatomic) NSString *goodsUrlStr;

@property (weak,nonatomic) id<YGoodDetailViewDelegate>delegate;

@end
