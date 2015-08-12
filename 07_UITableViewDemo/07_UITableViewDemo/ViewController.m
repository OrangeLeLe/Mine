//
//  ViewController.m
//  07_UITableViewDemo
//
//  Created by lzn on 15/8/11.
//  Copyright (c) 2015年 NowFuture. All rights reserved.
//

#import "ViewController.h"
#import "SectionListView.h"
#import "SectionListModel.h"

@interface ViewController ()
{
    SectionListView *_listView;
}
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _listView = [SectionListView createWithFrame:self.view.bounds];
    [self.view addSubview:_listView];
    
//    _listView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"请求数据" style:UIBarButtonItemStyleDone target:self action:@selector(clickBtn:)];
    self.navigationItem.rightBarButtonItem = btn;
  
}

- (void)clickBtn:(id)sender {
    //假数据
    SectionListModel *listen = [SectionListModel createWithType:SectionListTypeListen];
    listen.dataArray = @[@"1",@"2",@"3",@"4"];
    listen.cellCount = (int)listen.dataArray.count;
    
    SectionListModel *speak = [SectionListModel createWithType:SectionListTypeSpeak];
    speak.dataArray = @[@"1A",@"2B"];
    speak.cellCount = (int)speak.dataArray.count;
    
    SectionListModel *read = [SectionListModel createWithType:SectionListTypeRead];
    read.dataArray = @[@"a",@"b",@"c",@"d"];
    read.cellCount = (int)read.dataArray.count;
    [_listView reloadDataWithArray:@[read,speak,listen,read,speak,listen,read,speak,listen]];
    
}



@end
