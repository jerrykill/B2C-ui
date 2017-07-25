//
//  LSShopCartHeadView.h
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSShopCartHeadViewDelegate <NSObject>

- (void)AllEdit:(BOOL)sender;

@end

@interface LSShopCartHeadView : UICollectionReusableView

@property (weak,nonatomic) id<LSShopCartHeadViewDelegate>delegate;

@end
