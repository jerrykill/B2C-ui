//
//  LSGroupPopularityCell.h
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGoodsModel.h"

@protocol LSGroupPopularityCellDelegate <NSObject>

- (void)chooseBuy:(NSInteger)sender;

@end

@interface LSGroupPopularityCell : UICollectionViewCell

@property (strong,nonatomic) YGoodsModel *model;

@property (weak,nonatomic) id<LSGroupPopularityCellDelegate>delegate;



@end
