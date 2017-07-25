//
//  LSTimeBoxViewCell.h
//  爱股轩
//
//  Created by imac on 2017/4/7.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGoodsModel.h"

@protocol LSTimeBoxViewCellDelegate <NSObject>

- (void)chooseTimeActivityGood:(YGoodsModel*)model;

@end

@interface LSTimeBoxViewCell : UICollectionViewCell

@property (strong,nonatomic) NSMutableArray <YGoodsModel*>*dataArr;

@property (weak,nonatomic) id<LSTimeBoxViewCellDelegate>delegate;

@end

