//
//  HQLMomentsImageLayoutView.h
//  HQLMomentsImageLayoutView
//
//  Created by weplus on 2017/7/8.
//  Copyright © 2017年 weplus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HQLMomentsImageView.h"

@class HQLMomentsImageLayoutView;

@protocol HQLMomentsImageLayoutViewDelegate <NSObject>

@required
- (NSInteger)numberOfItemsInMomentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView;
- (HQLImageType)momentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView typeOfItemWithIndex:(NSInteger)itemIndex;
- (void)momentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView renderItem:(HQLMomentsImageView *)item atIndex:(NSInteger)itemIndex;

@optional
- (void)momentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView didClickItem:(HQLMomentsImageView *)item atIndex:(NSInteger)itemIndex;
// 当item的数量为1的时候调用这个代理
- (CGSize)sizeOfItemWhenItemCountEqualOneInMomentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView;
// 每个item的大小(如果实现了这个代理，horizonMargin将无效)
- (CGSize)sizeOfItemsInMomentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView;

// View的高度将不受控制
- (void)momentsImageLayoutViewFrameDidChange:(HQLMomentsImageLayoutView *)momentsImageLayoutView;

@end

@interface HQLMomentsImageLayoutView : UIView

@property (assign, nonatomic) NSInteger numberOfRow; // 每行显示的个数 - itemSize 会根据个数来确定
@property (assign, nonatomic) CGFloat itemHorizonMargin; // default 3
@property (assign, nonatomic) CGFloat itemVerticalMargin; // default 3
@property (assign, nonatomic) id <HQLMomentsImageLayoutViewDelegate>delegate;

- (void)reloadData;

@end
