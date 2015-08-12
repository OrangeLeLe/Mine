//
//  SectionListModel.m
//  07_UITableViewDemo
//
//  Created by lzn on 15/8/11.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "SectionListModel.h"

@implementation SectionListModel

- (void)makeContentWithType:(SectionListType)type
{
    _type = type;
    switch (type) {
        case SectionListTypeListen:
        {
            _sectionTitle = @"aaaaa";
            _cellHeight = 200;
        }
            break;
        case SectionListTypeSpeak:
        {
            _sectionTitle = @"bbbb";
            _cellHeight = 50;
        }
            break;
        case SectionListTypeRead:
        {
            _sectionTitle = @"ccc";
            _cellHeight = 20;
        }
            break;
            
        default:
            break;
    }
}

+ (instancetype)createWithType:(SectionListType)type
{
    SectionListModel *model = [[SectionListModel alloc] init];
    [model makeContentWithType:type];
    return model;
}

@end
