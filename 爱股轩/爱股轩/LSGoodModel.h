//
//  LSGoodModel.h
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSGoodModel : NSObject
/**商品id*/
@property (strong,nonatomic) NSString *goodId;
/**商品名称*/
@property (strong,nonatomic) NSString *goodName;
/**商品原价*/
@property (strong,nonatomic) NSString *goodPrice;
/**数量*/
@property (strong,nonatomic) NSString *num;
/**活动价格*/
@property (strong,nonatomic) NSString *activityMoney;
/**图片*/
@property (strong,nonatomic) NSString *goodUrl;
/**库存*/
@property (strong,nonatomic) NSString *stock;
/**规格*/
@property (strong,nonatomic) NSString *type;
/**评价数*/
@property (strong,nonatomic) NSString *evaluteCount;
/**交易成功数*/
@property (strong,nonatomic) NSString *dealCount;

@end
