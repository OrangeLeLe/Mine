//
//  SectionListModel.h
//  07_UITableViewDemo
//
//  Created by lzn on 15/8/11.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1.1个分组代表一个 model
 2.几个分组就有几个 model
 3.这些 model 可以组装成一个数组
 */

typedef NS_ENUM(NSInteger, SectionListType) {
    SectionListTypeListen,
    SectionListTypeSpeak,
    SectionListTypeRead
};

@interface SectionListModel : NSObject

//对应分组 title
@property(nonatomic,strong,readonly) NSString *sectionTitle;
//对应分组 cell 的高度
@property(nonatomic,assign,readonly) float cellHeight;
//对应分组 cell 的数量,便捷访问
@property(nonatomic,assign) int cellCount;
//对应分组的数据源
@property(nonatomic,strong) NSArray *dataArray;
//只读的分组的类型
@property(nonatomic,assign,readonly) SectionListType type;

+ (instancetype)createWithType:(SectionListType)type;

@end
