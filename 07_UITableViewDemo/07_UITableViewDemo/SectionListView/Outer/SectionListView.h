//
//  SectionListView.h
//  07_UITableViewDemo
//
//  Created by lzn on 15/8/11.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 1.封装控件时,最后是继承 UIView
 2.例如:如果继承 UITableView ,注意是否需要屏蔽 delegate 属性
 
 //暴力屏蔽
 - (void)setDelegate:(id<UITableViewDelegate>)delegate
 {
    //(1) _delegate = self;
    //(2) [super setDelegate:self];
 }
 
 
 */


@interface SectionListView : UIView

//通过类方法创建控件,唯一确定程序的创建入口
//目的:控制程序的运行逻辑
+ (instancetype)createWithFrame:(CGRect)frame;

- (void)reloadDataWithArray:(NSArray *)sectionArray;

@end
