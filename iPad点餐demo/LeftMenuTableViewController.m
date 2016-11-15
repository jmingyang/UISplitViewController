//
//  LeftMenuTableViewController.m
//  iPad点餐demo
//
//  Created by lucid on 16/10/19.
//  Copyright © 2016年 Gooou. All rights reserved.
//

#import "LeftMenuTableViewController.h"
#import "leftTableViewCell.h"
#import "DetailViewController.h"
#import "AFAppDotNetAPIClient.h"
#import "XmlParser.h"
@interface LeftMenuTableViewController ()

@end

@implementation LeftMenuTableViewController
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]


#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"主窗口";
    
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.frame = CGRectMake(0, 0, 300, 375);
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    leftTableViewCell *cell = [[leftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.lab.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
//    cell.selectionStyle = NO;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dv = [[DetailViewController alloc]init ];

    
//    [dv change];

    dv.view.backgroundColor = randomColor;
    dv.title = [NSString stringWithFormat:@"第%ld个view",indexPath.row+1];
    
    if (!self.splitViewController) {
        [self.navigationController pushViewController:dv animated:YES];
    }else{
        [self.splitViewController showDetailViewController:dv sender:nil];
        //    [self.splitViewController showViewController:dv sender:nil];
    
    }
    
    
}


@end
