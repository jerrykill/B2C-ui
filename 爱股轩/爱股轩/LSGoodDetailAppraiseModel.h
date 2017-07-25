//
//  LSGoodDetailAppraiseModel.h
//  爱股轩
//
//  Created by imac on 2017/4/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSGoodDetailAppraiseModel : NSObject
/**用户图标*/
@property (strong,nonatomic) NSString *imageUrl;
/**用户昵称*/
@property (strong,nonatomic) NSString *nickName;
/**购买日期*/
@property (strong,nonatomic) NSString *buyTime;
/**评价日期*/
@property (strong,nonatomic) NSString *evalueTime;
/**评价内容*/
@property (strong,nonatomic) NSString *evalueInfo;
/**图集*/
@property (strong,nonatomic) NSMutableArray *imageArr;


@end
