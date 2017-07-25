//
//  LSSpecialHeadView.h
//  爱股轩
//
//  Created by imac on 2017/4/10.
//  Copyright © 2017年 联系QQ:1084356436. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LSSpecialHeadViewDelegate <NSObject>

- (void)chooseClassIndex:(NSInteger)index;

@end

@interface LSSpecialHeadView : UICollectionReusableView

@property (strong,nonatomic) NSArray *titleArr;

@property (strong,nonatomic) NSString *testName;

@property (weak,nonatomic) id<LSSpecialHeadViewDelegate>delegate;

@end
