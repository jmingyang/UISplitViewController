//
//  DetailViewController.h
//  iPad点餐demo
//
//  Created by lucid on 16/10/19.
//  Copyright © 2016年 Gooou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UISplitViewControllerDelegate,UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout>
-(void)change;
@property (strong, nonatomic) UIColor *color;
@end
