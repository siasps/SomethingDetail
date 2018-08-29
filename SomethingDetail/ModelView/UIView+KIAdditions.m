//
//  UIView+KIAdditions.m
//  SomethingDetail
//
//  Created by peng on 2018/8/28.
//  Copyright © 2018年 peng. All rights reserved.
//

#import "UIView+KIAdditions.h"

@implementation UIView (KIAdditions)

//位于view下面，间距为padding
- (void)underView:(UIView *)view padding:(CGFloat)padding{
    CGRect superRect = view.frame;
    
    CGRect rect = self.frame;
    
    CGRect currRect = CGRectMake(superRect.origin.x,
                                 CGRectGetMaxY(superRect) + padding,
                                 rect.size.width,
                                 rect.size.height);
    self.frame = currRect;
}

//垂直居中对齐 view：相对view padding：间距
- (void)verticalAllignment:(UIView *)view{
    CGRect superRect = view.frame;
    
    CGRect rect = self.frame;
    
    CGRect currRect = CGRectMake((superRect.size.width - rect.size.width)/2 + superRect.origin.x,
                                 rect.origin.y,
                                 rect.size.width,
                                 rect.size.height);
    self.frame = currRect;
}


- (void)setOriginX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}


@end
