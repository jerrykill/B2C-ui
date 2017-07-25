//
//  LSGoodDetailSizeCell.h
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSGoodDetailSizeCellDelegate <NSObject>

- (void)chooseGoodSize:(NSInteger)index;

@end

@interface LSGoodDetailSizeCell : UICollectionViewCell

@property (strong,nonatomic) NSArray *btnArr;

@property (weak,nonatomic) id<LSGoodDetailSizeCellDelegate>delegate;

@end
