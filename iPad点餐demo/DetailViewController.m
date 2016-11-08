//
//  DetailViewController.m
//  iPad点餐demo
//
//  Created by lucid on 16/10/19.
//  Copyright © 2016年 Gooou. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()
@property (nonatomic,strong)UIBarButtonItem *splitViewBarButtonItem;
//@property (nonatomic,strong) UIPopoverController *masterPopover;
//@property (nonatomic,strong)UIPopoverController *iMasterPopOver;



- (void)setSplitViewBarButtonItem:(UIBarButtonItem *)barButtonItem;


@end

@implementation DetailViewController
@synthesize color;

//随机颜色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"详情窗口";
    
    self.splitViewController.delegate = self;
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)change{
//    self.view.backgroundColor = [UIColor redColor];
    self.title =@"123";
    NSLog(@"hahahhahahah");
    
    
    
}


#pragma mark -
#pragma mark SplitViewDelegate

- (void)splitViewController: (UISplitViewController*)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem
       forPopoverController: (UIPopoverController*)pc
{
//    barButtonItem.title = @"Master View";
//    [self.navigationItem setRightBarButtonItem:barButtonItem animated:YES];
//    self.masterPopover = pc;
    barButtonItem.title = @"Courses";
    NSLog(@"隐藏主窗口");
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
}





// Called when the view is shown  again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"显示主窗口");
    if (barButtonItem == self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = nil;

    }

}

- (void)splitViewController:(UISplitViewController *)svc
          popoverController:(UIPopoverController *)pc
  willPresentViewController:(UIViewController *)aViewController
{
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        NSLog(@"ERR_POPOVER_IN_LANDSCAPE");
    }
}
//iPhone刚打开时，只显示detail，如果要让它先显示master，需要实现UISplitViewControllerDelegate的方法
//- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
//    
//    return YES;
//    
//}


@end
