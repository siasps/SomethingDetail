//
//  SubviewsTableView_2.m
//  SomethingDetail
//
//  Created by peng on 2018/8/27.
//  Copyright © 2018年 peng. All rights reserved.
//

#import "SubviewsTableView_2.h"

@implementation SubviewsTableView_2

- (void)setTopView:(TopView *)topView
{
    _topView = topView;
    
    self.dataSource = self;
    self.delegate = self;
    //self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.scrollIndicatorInsets = UIEdgeInsetsMake(self.topView.height, 0, 0, 0);
    self.backgroundColor = RGB_COLOR_String(@"#F3F4F5");
    
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.topView.height)];
    self.tableHeaderView = tableHeaderView;
    
    if (@available(iOS 11.0, *)){
        self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    //self.mj_header = [MJRefreshJBHeader headerWithRefreshingTarget:self refreshingAction:@selector(refrushHeaderData)];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    return [[UIView alloc] init];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseFirstTableViewCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseFirstTableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseFirstTableViewCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - firstTableView的代理方法scrollViewDidScroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat placeHolderHeight = self.topView.height - self.topView.itemHeight;
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    //    if (offsetY >= 0 && offsetY <= placeHolderHeight) {
    //        self.topView.y = -offsetY;
    //    }
    //    else if (offsetY > placeHolderHeight) {
    //        self.topView.y = - placeHolderHeight;
    //    }
    //    else if (offsetY <0) {
    //        self.topView.y =  - offsetY;
    //    }
    
    //NSLog(@"-------%f",offsetY);
    
    if (offsetY > placeHolderHeight) {
        self.topView.y = - placeHolderHeight +offsetY;
    }
    
    
}
@end
