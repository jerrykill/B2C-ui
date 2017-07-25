//
//  LSShopGoodEditCell.h
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSShopCartGoodModel.h"

@protocol LSShopGoodEditCellDelegate <NSObject>

- (void)goodCount:(BOOL)sender changeIndex:(NSInteger)tag;

- (void)chooseEdit:(BOOL)sender index:(NSInteger)tag;

- (void)deleteGood:(NSInteger)index;

@end

@interface LSShopGoodEditCell : UICollectionViewCell

@property (strong,nonatomic) LSShopGoodModel *model;

@property (weak,nonatomic) id<LSShopGoodEditCellDelegate>delegate;

@end
