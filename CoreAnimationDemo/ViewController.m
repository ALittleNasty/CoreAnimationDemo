//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by ALittleNasty on 2017/2/15.
//  Copyright © 2017年 vcredit. All rights reserved.
//

#import "ViewController.h"

#import "BasicAnimationController.h"
#import "CAKeyframeAnimationController.h"
#import "CAAnimationGroupController.h"
#import "CATransitionController.h"

static NSString *cellID = @"UITableViewCellIdentifier";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.f];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor magentaColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{ 
    UIViewController *pushedVC = nil;
    
    switch (indexPath.row) {
            case 0: {
                pushedVC = [[BasicAnimationController alloc] init];
            }
            break;
            case 1: {
                pushedVC = [[CAKeyframeAnimationController alloc] init];
            }
            break;
            case 2: {
                pushedVC = [[CAAnimationGroupController alloc] init];
            }
            break;
            case 3: {
                pushedVC = [[CATransitionController alloc] init];
            }
            break;
            
        default:
            break;
    }
    
    pushedVC.title = self.dataArray[indexPath.row];
    pushedVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:pushedVC animated:YES];
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        
        _dataArray = @[@"CABasicAnimation", @"CAKeyframeAnimation", @"CAAnimationGroup", @"CATransition"];
    }
    
    return _dataArray;
}


@end
