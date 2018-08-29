//
//  UIView+KIAdditions.h
//  SomethingDetail
//
//  Created by peng on 2018/8/28.
//  Copyright © 2018年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (KIAdditions)

//垂直居中对齐 view：相对view padding：间距
- (void)verticalAllignment:(UIView *)view;

//位于view下面，间距为padding
- (void)underView:(UIView *)view padding:(CGFloat)padding;

- (void)setOriginX:(CGFloat)x;

@end
