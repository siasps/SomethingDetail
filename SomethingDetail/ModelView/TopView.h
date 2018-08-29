//
//  TopView.h
//  SomethingDetail
//
//  Created by peng on 2018/8/27.
//  Copyright © 2018年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView

@property (assign, nonatomic) CGFloat itemHeight;

@property (assign, nonatomic, getter=getSelectedItemIndex) NSInteger selectedItemIndex;

@property (nonatomic ,weak) id delegate;

-(instancetype)initWithFrame:(CGRect)frame itemHeight:(CGFloat)itemHeight;


@end


@protocol TopViewDelegate <NSObject>

- (void)moveSlideViewWithIndex:(NSInteger)index;


@end
