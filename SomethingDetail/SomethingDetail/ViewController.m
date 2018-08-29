//
//  ViewController.m
//  SomethingDetail
//
//  Created by peng on 2018/8/27.
//  Copyright © 2018年 peng. All rights reserved.
//

#import "ViewController.h"
#import "SubviewsTableView_1.h"
#import "SubviewsTableView_2.h"
#import "SubviewsTableView_3.h"
#import "SubviewsTableView_4.h"
#import "TopView.h"

#define kItemheight 45

@interface ViewController ()<UIScrollViewDelegate,TopViewDelegate>

@property (nonatomic ,strong) UIScrollView *mainScrollView;
@property (nonatomic ,strong) TopView *topView;

@property (nonatomic ,strong) SubviewsTableView_1 *subview_1;
@property (nonatomic ,strong) SubviewsTableView_2 *subview_2;
@property (nonatomic ,strong) SubviewsTableView_3 *subview_3;
@property (nonatomic ,strong) SubviewsTableView_4 *subview_4;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initMianScrollView];

}


- (void)initMianScrollView
{
    
    _topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 230) itemHeight:kItemheight];
    _topView.delegate = self;
    
    _mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_SAFE_HEIGHT -50);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.delegate = self;
    _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:_mainScrollView];
    _mainScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*4, _mainScrollView.height);
    _mainScrollView.pagingEnabled = YES;
    //    _mainScrollVihttp://www.baidu.com/ew.bounces = NO;
    _mainScrollView.scrollEnabled = NO;
    
    
    CGRect rect_1 = CGRectMake(0, 0, SCREEN_WIDTH, _mainScrollView.frame.size.height);
    _subview_1 = [[SubviewsTableView_1 alloc] initWithFrame:rect_1 style:UITableViewStyleGrouped];
    //_subview_1.touchDelegate = self;
    [_subview_1 setTopView:_topView];
    
    [_mainScrollView addSubview:_subview_1];
    
    CGRect rect_2 = CGRectMake(SCREEN_WIDTH*1, 0, SCREEN_WIDTH, _mainScrollView.frame.size.height);
    _subview_2 = [[SubviewsTableView_2 alloc] initWithFrame:rect_2 style:UITableViewStyleGrouped];
    //_subview_2.clickDelegate = self;
    [_subview_2 setTopView:_topView];
    //[_subview_2 requestDataWithShopId:_shop_id];
    [_mainScrollView addSubview:_subview_2];
    
    CGRect rect_3 = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, _mainScrollView.frame.size.height);
    _subview_3 = [[SubviewsTableView_3 alloc] initWithFrame:rect_3 style:UITableViewStyleGrouped];
    [_subview_3 setTopView:_topView];
    //[_subview_3 requestDataWithShopId:_shop_id];
    [_mainScrollView addSubview:_subview_3];
    
    CGRect rect_4 = CGRectMake(SCREEN_WIDTH*3, 0, SCREEN_WIDTH, _mainScrollView.frame.size.height);
    _subview_4 = [[SubviewsTableView_4 alloc] initWithFrame:rect_4 style:UITableViewStyleGrouped];
    [_subview_4 setTopView:_topView];
    //[_subview_4 requestDataWithShopId:_shop_id];
    [_mainScrollView addSubview:_subview_4];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, SCREEN_HEIGHT -50, SCREEN_WIDTH, 50);
    button.backgroundColor = RGB_COLOR_String(@"#FB474A");
    button.titleLabel.font = [UIFont systemFontOfSize:15*SCREEN_SCALE];
    [button setTitle:@"立即预约" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(appointmentButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    [_subview_1 addSubview:_topView];
    
    
}

-(void)appointmentButtonClick{
    
}

- (void)moveSlideViewWithIndex:(NSInteger)index;
{
    
    
    [self.view addSubview:_topView];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _mainScrollView.contentOffset = CGPointMake(SCREEN_WIDTH*index, 0);
        _topView.selectedItemIndex = index;
        
     
        
    } completion:^(BOOL finished) {
        
        
        if (index == 0) {
            
            [_subview_1 addSubview:_topView];
            
        }else if (index == 1){
            
            [_subview_2 addSubview:_topView];
            
        }
        
//        if (index == 1) {
//            if (_subview_2.dataArray.count == 0) {
//                [_subview_2 getDataWithCache:NO];
//            }
//
//        }else if (index == 2){
//
//            if (_subview_3.dataArray.count == 0) {
//                [_subview_3 getDataWithCache:NO];
//            }
//
//        }else if (index == 3){
//            if (_subview_4.dataArray.count == 0) {
//                [_subview_4 getDataWithCache:NO];
//            }
//        }
    }];
}



@end
