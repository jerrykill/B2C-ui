//
//  YGetAttribute.h
//  优胜办公
//
//  Created by imac on 2017/1/20.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGetAttribute : NSObject

+(CGSize)getSpaceHeight:(NSString*)text size:(CGSize)size rowHeight:(CGFloat)heght font:(UIFont*)font;

+(NSAttributedString *)getSpaceString:(NSString*)text size:(CGSize)size rowHeight:(CGFloat)heght font:(UIFont*)font;

@end
