//
//  LSGoodDetailNumCell.h
//  爱股轩
//
//  Created by imac on 2017/4/19.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSGoodDetailNumCellDelegate <NSObject>

- (void)changeGoodNum:(BOOL)sender;

@end

@interface LSGoodDetailNumCell : UICollectionViewCell


@property (strong,nonatomic) NSString *num;

@property (strong,nonatomic) NSString *stock;

@property (weak,nonatomic) id<LSGoodDetailNumCellDelegate>delegate;

@end
