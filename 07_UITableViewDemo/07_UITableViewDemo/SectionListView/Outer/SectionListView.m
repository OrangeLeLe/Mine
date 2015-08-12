//
//  SectionListView.m
//  07_UITableViewDemo
//
//  Created by lzn on 15/8/11.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "SectionListView.h"
#import "SectionListModel.h"

@interface SectionListView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;
//tableView的数据源
@property(nonatomic,strong) NSArray *sectionArray;

@end

@implementation SectionListView


- (void)reloadDataWithArray:(NSArray *)sectionArray {
    self.sectionArray = sectionArray;
    [self.tableView insertSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.sectionArray.count)] withRowAnimation:UITableViewRowAnimationFade];
    //[self.tableView reloadData];
}


#pragma mark - Inner
//创建内容 view
- (void)makeContentView:(CGRect)hostViewBounds
{
    self.tableView = [[UITableView alloc] initWithFrame:hostViewBounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    //tableView和主人 view 等大
    //跟随主人 view frame 的变化而变化
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    //向 tableView 注册 cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SectionListModel *model = self.sectionArray[section];
    return model.cellCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SectionListModel *model = self.sectionArray[indexPath.section];
    return model.cellHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    SectionListModel *model = self.sectionArray[section];
    return model.sectionTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    SectionListModel *model = self.sectionArray[indexPath.section];
    cell.textLabel.text = model.dataArray[indexPath.row];
    return cell;
}

#pragma mark - Outer
+ (instancetype)createWithFrame:(CGRect)frame
{
    //先创建主人控件
    SectionListView *hostView = [[SectionListView alloc] init];
    hostView.frame = frame;
    [hostView makeContentView:hostView.bounds];
    return hostView;
}

@end
