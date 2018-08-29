//
//  UIColor+KIAdditions.h
//  SomethingDetail
//
//  Created by peng on 2018/8/28.
//  Copyright © 2018年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KIAdditions)

+ (UIColor *) colorWithHexString: (NSString *) hexString;

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

@end
