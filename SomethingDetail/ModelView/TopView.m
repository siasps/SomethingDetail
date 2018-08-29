//
//  TopView.m
//  SomethingDetail
//
//  Created by peng on 2018/8/27.
//  Copyright © 2018年 peng. All rights reserved.
//

#import "TopView.h"


@interface TopView()

@property (nonatomic ,strong) UIView *titleView;
@property (nonatomic ,strong) UIView *topView;

@end

@implementation TopView

-(instancetype)initWithFrame:(CGRect)frame itemHeight:(CGFloat)itemHeight;
{
    self = [super initWithFrame:frame];
    if (self) {
        _itemHeight = itemHeight;
        self.backgroundColor = [UIColor blueColor];
        
//        [self initBrandInfomation];
        [self initNavgation];
        
    }
    return self;
}

-(void)initNavgation
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height -self.itemHeight, SCREEN_WIDTH, self.itemHeight)];
    topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:topView];
    _topView = topView;
    UIView *titleView = [[UIView alloc]init];
    titleView.frame = CGRectMake(15, self.frame.size.height -self.itemHeight, SCREEN_WIDTH -30, self.itemHeight);
    titleView.backgroundColor = [UIColor clearColor];
    [self addSubview:titleView];
    _titleView = titleView;
    
    for (NSInteger i=0; i<4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:RGB_COLOR_String(@"#656667") forState:UIControlStateNormal];
        [button setTitleColor:RGB_COLOR_String(@"#FB474A") forState:UIControlStateSelected];
        button.tag = 600+i;
        [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        
        CGFloat origin_x = 0;
        CGFloat width    = _titleView.frame.size.width/4;
        button.frame = CGRectMake(origin_x +width*i, 5, width, 40);
        
        if (i==0) {
            [button setTitle:@"首页" forState:UIControlStateNormal];
            button.selected = YES;
            
            UIView *slideView = [[UIView alloc]init];
            slideView.frame = CGRectMake(0, 0, width, 2.0);
            slideView.backgroundColor = RGB_COLOR_String(@"#FB474A");
            [slideView underView:button padding:-2];
            [slideView verticalAllignment:button];
            slideView.tag = 605;
            [titleView addSubview:slideView];
            
        }else if (i==1){
            
            [button setTitle:@"全部商品" forState:UIControlStateNormal];
        }else if (i == 2){
            [button setTitle:@"品牌故事" forState:UIControlStateNormal];
            
        }else if (i == 3){
            [button setTitle:@"用户点评" forState:UIControlStateNormal];
            
        }
        [titleView addSubview:button];
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.itemHeight -0.5f, SCREEN_WIDTH, 0.5f)];
    lineView.backgroundColor = [UIColor grayColor];
    [topView addSubview:lineView];
    
}

- (void)titleButtonClick:(UIButton *)button{
    UIButton *button1 = (UIButton *)[_titleView viewWithTag:600];
    UIButton *button2 = (UIButton *)[_titleView viewWithTag:601];
    UIButton *button3 = (UIButton *)[_titleView viewWithTag:602];
    UIButton *button4 = (UIButton *)[_titleView viewWithTag:603];
    UIButton *button5 = (UIButton *)[_titleView viewWithTag:604];
    button1.selected = NO;
    button2.selected = NO;
    button3.selected = NO;
    button4.selected = NO;
    button5.selected = NO;
    button.selected = YES;
    
    if (button1.selected) {
        [self moveSlideWithIndex:0];
        if (self.delegate && [self.delegate respondsToSelector:@selector(moveSlideViewWithIndex:)]) {
            [self.delegate moveSlideViewWithIndex:0];
        }
        
    }else if (button2.selected){
        [self moveSlideWithIndex:1];
        if (self.delegate && [self.delegate respondsToSelector:@selector(moveSlideViewWithIndex:)]) {
            [self.delegate moveSlideViewWithIndex:1];
        }
    }else if (button3.selected){
        [self moveSlideWithIndex:2];
        if (self.delegate && [self.delegate respondsToSelector:@selector(moveSlideViewWithIndex:)]) {
            [self.delegate moveSlideViewWithIndex:2];
        }
    }else if (button4.selected){
        [self moveSlideWithIndex:3];
        if (self.delegate && [self.delegate respondsToSelector:@selector(moveSlideViewWithIndex:)]) {
            [self.delegate moveSlideViewWithIndex:3];
        }
        
    }else if (button5.selected){
        [self moveSlideWithIndex:4];
        if (self.delegate && [self.delegate respondsToSelector:@selector(moveSlideViewWithIndex:)]) {
            [self.delegate moveSlideViewWithIndex:4];
        }
        
    }else{
        
    }
    
    
}
-(void)moveSlideWithIndex:(NSInteger)index
{
    UIView *slideView = (UIView *)[_titleView viewWithTag:605];
    
    //    if ((index == 0 && slideView.x < KIApplicationWidth/3.0)
    //        || (index ==1 && KIApplicationWidth/3.0 < slideView.x && slideView.x < 2*KIApplicationWidth/3.0)
    //        || (index ==2 && slideView.x > 2*KIApplicationWidth/3.0)) {
    //        return;
    //    }
    
    CGFloat width = _titleView.frame.size.width/4;
    CGFloat origin_x =  index *width;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [slideView setWidth:width];
        [slideView setOriginX:origin_x];
        //        _mainScrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
        
    } completion:^(BOOL finished) {
        
    }];
}

@end
