//
//  DetailViewController.m
//  iPad点餐demo
//
//  Created by lucid on 16/10/19.
//  Copyright © 2016年 Gooou. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"
#import "UIImageView+AFNetworking.h"
#import "DetailCollectionViewCell.h"
@interface DetailViewController ()
@property (nonatomic,strong)UIBarButtonItem *splitViewBarButtonItem;
//@property (nonatomic,strong) UIPopoverController *masterPopover;
//@property (nonatomic,strong)UIPopoverController *iMasterPopOver;

@property (nonatomic,retain) UICollectionView *mPicCollectionView;

- (void)setSplitViewBarButtonItem:(UIBarButtonItem *)barButtonItem;


@end

@implementation DetailViewController

static NSString * const reuseidentifier = @"cell";
@synthesize color;
@synthesize mPicCollectionView;
//随机颜色
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title =@"详情窗口";
    
    self.splitViewController.delegate = self;
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
    self.navigationItem.leftItemsSupplementBackButton = YES;
    
    
    //@“”常量池
    NSString *str1 = @"hh";
    NSString *str2 = @"hh";
    str1==str2 ?  NSLog(@"same"):NSLog(@"dif");
    
    NSString *str3 = [NSString stringWithFormat:@"hh"];
    NSString *str4 = [NSString stringWithFormat:@"hhhhhhhh"];
    str1==str3 ?  NSLog(@"same"):NSLog(@"dif");
    NSLog(@"str1:%p;\n str2:%p;\n str3:%p;\n str4:%p;",str1,str2,str3,str4);
    
    //新特性要求App内访问的网络必须使用HTTPS协议。
    //但是现在使用的是HTTP协议，使用私有加密方式保证数据安全。现在也不能马上改成HTTPS协议传输。在Info.plist中添加NSAppTransportSecurity类型Dictionary。
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    NSURL *url = [NSURL URLWithString:@"http://202.200.112.149:8008/PiclistImage/05060001.jpg"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [imageView setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"image"] success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        imageView.image = image;
        [imageView setImage:image];
        [imageView setNeedsDisplay];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"图片加载失败:%@",error);
    }];
    
    [self.view addSubview:imageView];
    
    [self initCollectionView];
    
}

- ( void )initCollectionView
{
    
    //先实例化一个层
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100,100);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //创建一屏的视图大小
    mPicCollectionView = [[UICollectionView alloc ] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout :layout];
    mPicCollectionView.backgroundColor = [UIColor whiteColor];
    mPicCollectionView.dataSource = self;
    mPicCollectionView.delegate = self;
    mPicCollectionView.bounces = NO;
    mPicCollectionView.scrollEnabled = YES;
    mPicCollectionView.showsHorizontalScrollIndicator = NO;
    [mPicCollectionView setCollectionViewLayout:layout];
    [mPicCollectionView registerClass:[DetailCollectionViewCell class] forCellWithReuseIdentifier:reuseidentifier];
    [self.view addSubview :mPicCollectionView];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)change{
    self.title =@"123";
    NSString *str1 = [NSString stringWithFormat:@"hh"];
    NSLog(@"hahahhahahah");
    NSLog(@"str1:%p",str1);
    
    
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

#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 200;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell = [mPicCollectionView dequeueReusableCellWithReuseIdentifier:reuseidentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[DetailCollectionViewCell alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    }
    cell.backgroundColor = randomColor;
    
    
    cell.lab.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 100, 100)];
//    label.text = [NSString stringWithFormat:@"%ld",indexPath.row+1];
//    label.tag = indexPath.row;
//    label.font = [UIFont boldSystemFontOfSize:32];
//    [cell.contentView addSubview:label];
//    NSLog(@"是第%ld个label",label.tag);
//    if (cell.selected == YES) {
//        NSLog(@"%ld是个sb",indexPath.row);
//        cell.backgroundColor = [UIColor redColor];
//    }
    
    return cell;
}

// 和UITableView类似，UICollectionView也可设置段头段尾
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if([kind isEqualToString:UICollectionElementKindSectionHeader])
//    {
//        UICollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerId forIndexPath:indexPath];
//        if(headerView == nil)
//        {
//            headerView = [[UICollectionReusableView alloc] init];
//        }
//        headerView.backgroundColor = [UIColor grayColor];
//        
//        return headerView;
//    }
//    else if([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        UICollectionReusableView *footerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerId forIndexPath:indexPath];
//        if(footerView == nil)
//        {
//            footerView = [[UICollectionReusableView alloc] init];
//        }
//        footerView.backgroundColor = [UIColor lightGrayColor];
//        
//        return footerView;
//    }
//    
//    return nil;
//}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    
}




#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){300,300};
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return (CGSize){ScreenWidth,44};
//}
//
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
//{
//    return (CGSize){ScreenWidth,22};
//}




#pragma mark ---- UICollectionViewDelegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 点击高亮
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell = (DetailCollectionViewCell*)[mPicCollectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.selected = YES;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DetailCollectionViewCell *cell = (DetailCollectionViewCell*)[mPicCollectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = randomColor;
    cell.selected = NO;

}
// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


// 长按某item，弹出copy和paste的菜单
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

// 使copy和paste有效
- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if ([NSStringFromSelector(action) isEqualToString:@"copy:"] || [NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        return YES;
    }
    
    return NO;
}

//
- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(nullable id)sender
{
    if([NSStringFromSelector(action) isEqualToString:@"copy:"])
    {
        NSLog(@"-------------执行拷贝-------------");
        
    }
    else if([NSStringFromSelector(action) isEqualToString:@"paste:"])
    {
        NSLog(@"-------------执行粘贴-------------");
    }
}



@end
