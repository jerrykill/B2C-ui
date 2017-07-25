//
//  LSGoodSizeChooseView.h
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSGoodSizeChooseViewDelegate <NSObject>

- (void)chooseGoodType;

@end

@interface LSGoodSizeChooseView : UICollectionReusableView

@property (strong,nonatomic) NSString *detail;

@property (weak,nonatomic) id<LSGoodSizeChooseViewDelegate>delegate;

@end
