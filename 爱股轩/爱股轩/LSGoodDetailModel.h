//
//  LSGoodDetailModel.h
//  爱股轩
//
//  Created by imac on 2017/4/18.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSGoodDetailModel : NSObject
/**商品名称*/
@property (strong,nonatomic) NSString *goodTitle;
/**商品id*/
@property (strong,nonatomic) NSString *goodId;
/**图片*/
@property (strong,nonatomic) NSString *goodUrl;
/**商品滚动栏图片集*/
@property (strong,nonatomic) NSArray *imageArr;
/**原价*/
@property (strong,nonatomic) NSString *goodMoney;
/**活动价格*/
@property (strong,nonatomic) NSString *activityMoney;
/**活动结束时间*/
@property (strong,nonatomic) NSString *endTime;
/**库存*/
@property (strong,nonatomic) NSString *stock;
/**规格数组*/
@property (strong,nonatomic) NSArray *typeArr;

@end
