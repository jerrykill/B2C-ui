//
//  LSGroupOnHeadView.h
//  爱股轩
//
//  Created by imac on 2017/4/17.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YHeadImage.h"

@protocol LSGroupOnHeadViewDelegate <NSObject>

- (void)chooseAdPic:(NSString *)url;

@end

@interface LSGroupOnHeadView : UICollectionReusableView

@property (strong,nonatomic) NSArray <YHeadImage*>*imageArr;

@property (weak,nonatomic) id<LSGroupOnHeadViewDelegate>delegate;

@end
