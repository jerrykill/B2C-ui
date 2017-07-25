//
//  LSGoodsDetailTitleCell.h
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSGoodDetailModel.h"

@protocol LSGoodsDetailTitleCellDelegate <NSObject>

- (void)chooseShare;

@end

@interface LSGoodsDetailTitleCell : UICollectionViewCell

@property (strong,nonatomic) LSGoodDetailModel *model;

@property (weak,nonatomic) id<LSGoodsDetailTitleCellDelegate>delegate;

@end
