//
//  LSShopGoodCell.h
//  爱股轩
//
//  Created by imac on 2017/4/11.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSShopCartGoodModel.h"

@protocol LSShopGoodCellDelegate <NSObject>

- (void)choose:(BOOL)sender index:(NSInteger)tag;

@end

@interface LSShopGoodCell : UICollectionViewCell

@property (strong,nonatomic) LSShopGoodModel *model;

@property (weak,nonatomic) id<LSShopGoodCellDelegate>delegate;

@end
