//
//  DetailCollectionViewCell.m
//  SplitVCDemo
//
//  Created by lucid on 16/11/14.
//  Copyright © 2016年 Gooou. All rights reserved.
//

#import "DetailCollectionViewCell.h"

@implementation DetailCollectionViewCell
@synthesize lab;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        
        lab.font = [UIFont boldSystemFontOfSize:32];
        [self addSubview:lab];
                
        
    }
    
    return self;
}


//- (void)prepareForReuse{
//    [super prepareForReuse];
//    if (self.selected == YES) {
//        NSLog(@"瞿丽欢是个sb");
//    }
//    
//}

@end
