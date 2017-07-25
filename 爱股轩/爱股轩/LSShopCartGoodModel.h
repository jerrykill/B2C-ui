//
//  LSShopCartGoodModel.h
//  爱股轩
//
//  Created by imac on 2017/4/12.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LSShopGoodModel;

@interface LSShopCartGoodModel : NSObject
/**实付价格*/
@property (strong,nonatomic) NSString *truePay;
/**总价*/
@property (strong,nonatomic) NSString *totalMoney;
/**优惠价格*/
@property (strong,nonatomic) NSString *couponMoney;
/**选中个数*/
@property (strong,nonatomic) NSString *chooseCount;
/**全选*/
@property (assign,nonatomic) BOOL allChoose;

@property (strong,nonatomic) NSMutableArray <LSShopGoodModel*>*dataArr;

@end

@interface LSShopGoodModel : NSObject
/**选中状态*/
@property (assign,nonatomic) BOOL isChoose;
/**商品id*/
@property (strong,nonatomic) NSString *goodId;
/**商品名称*/
@property (strong,nonatomic) NSString *goodtitle;
/**商品图片*/
@property (strong,nonatomic) NSString *goodUrl;
/**商品数量*/
@property (strong,nonatomic) NSString *goodNum;
/**商品价格*/
@property (strong,nonatomic) NSString *price;


@end
