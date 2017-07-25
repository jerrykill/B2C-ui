//
//  LSGoodDetailLikeHeadView.h
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSGoodDetailLikeHeadViewDelegate <NSObject>

- (void)changeLikeNext;

@end

@interface LSGoodDetailLikeHeadView : UICollectionReusableView

@property (strong,nonatomic) NSString *title;

@property (weak,nonatomic) id<LSGoodDetailLikeHeadViewDelegate>delegate;

@end
