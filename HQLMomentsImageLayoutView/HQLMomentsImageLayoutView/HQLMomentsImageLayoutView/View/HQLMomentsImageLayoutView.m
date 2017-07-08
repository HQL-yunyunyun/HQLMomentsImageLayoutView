//
//  HQLMomentsImageLayoutView.m
//  HQLMomentsImageLayoutView
//
//  Created by weplus on 2017/7/8.
//  Copyright © 2017年 weplus. All rights reserved.
//

#import "HQLMomentsImageLayoutView.h"

#define kDefaultNumberOfRow 3
#define kDefaultMargin 3

@interface HQLMomentsImageLayoutView ()

@property (strong, nonatomic) NSMutableArray *itemArray;

@end

@implementation HQLMomentsImageLayoutView

#pragma mark - event

- (void)reloadData {
    if (!self.itemArray) {
        self.itemArray = [NSMutableArray array];
    }
    [self.itemArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.itemArray removeAllObjects];
    
    NSInteger itemCount = 0;
    if ([self.delegate respondsToSelector:@selector(numberOfItemsInMomentsImageLayoutView:)]) {
        itemCount = [self.delegate numberOfItemsInMomentsImageLayoutView:self];
        if (itemCount < 0) {
            itemCount = 0;
        }
    }
    if (itemCount == 0) {
        return;
    }
    
    if (self.itemHorizonMargin < 0) {
        self.itemHorizonMargin = kDefaultMargin;
    }
    if (self.itemVerticalMargin < 0) {
        self.itemVerticalMargin = kDefaultMargin;
    }
    
    CGFloat width = self.frame.size.width;
    
    self.numberOfRow = self.numberOfRow < 0 ? kDefaultNumberOfRow : self.numberOfRow;
    
    CGSize itemSize = CGSizeMake((width - self.itemHorizonMargin * (self.numberOfRow - 1)) / self.numberOfRow, (width - self.itemHorizonMargin * (self.numberOfRow - 1)) / self.numberOfRow);
    
    if (itemCount == 1) {
        if ([self.delegate respondsToSelector:@selector(sizeOfItemWhenItemCountEqualOneInMomentsImageLayoutView:)]) {
            itemSize = [self.delegate sizeOfItemWhenItemCountEqualOneInMomentsImageLayoutView:self];
        }
    }
    
    // 实际每行显示的个数
    NSInteger numberOfRow = (itemCount % (self.numberOfRow - 1) == 0) && (itemCount != (self.numberOfRow - 1)) ? self.numberOfRow - 1 : self.numberOfRow;
    
    for (NSInteger i = 0; i < itemCount; i++) {
        HQLMomentsImageView *imageView = [[HQLMomentsImageView alloc] init];
        if ([self.delegate respondsToSelector:@selector(momentsImageLayoutView:typeOfItemWithIndex:)]) {
            imageView.type = [self.delegate momentsImageLayoutView:self typeOfItemWithIndex:i];
        }
        
        CGFloat viewX = (i % numberOfRow) * (itemSize.width + self.itemHorizonMargin);
        CGFloat viewY = (i / numberOfRow) * (itemSize.height + self.itemVerticalMargin);
        imageView.frame = CGRectMake(viewX, viewY, itemSize.width, itemSize.height);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [imageView addGestureRecognizer:tap];
        
        [self addSubview:imageView];
        [self.itemArray addObject:imageView];
        
        if ([self.delegate respondsToSelector:@selector(momentsImageLayoutView:renderItem:atIndex:)]) {
            [self.delegate momentsImageLayoutView:self renderItem:imageView atIndex:i];
        }
    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, CGRectGetMaxY([self.itemArray.lastObject frame]));
    if ([self.delegate respondsToSelector:@selector(momentsImageLayoutViewFrameDidChange:)]) {
        [self.delegate momentsImageLayoutViewFrameDidChange:self];
    }
}

- (void)tapGesture:(UIGestureRecognizer *)gesture {
    NSInteger index = [self.itemArray indexOfObject:gesture.view];
    if ([self.delegate respondsToSelector:@selector(momentsImageLayoutView:didClickItem:atIndex:)]) {
        [self.delegate momentsImageLayoutView:self didClickItem:(HQLMomentsImageView *)gesture.view atIndex:index];
    }
}

@end
