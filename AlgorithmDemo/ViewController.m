//
//  ViewController.m
//  AlgorithmDemo
//
//  Created by 于朝盼 on 2019/4/24.
//  Copyright © 2019 于朝盼. All rights reserved.
//

#import "ViewController.h"
#import "SortViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)   UITableView *tableView;
@property (nonatomic, strong)   NSArray *list;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _list = @[@"冒泡排序",@"快速排序",@"选择排序",@"归并排序"];
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = _list[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SortViewController *SVC = [[SortViewController alloc]init];
    SVC.titleStr = _list[indexPath.row];
    SVC.style = indexPath.row;
    [self presentViewController:SVC animated:YES completion:nil];
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    
    }
    return _tableView;
}

@end
