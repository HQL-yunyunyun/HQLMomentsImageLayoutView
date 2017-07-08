//
//  ViewController.m
//  HQLMomentsImageLayoutView
//
//  Created by weplus on 2017/7/8.
//  Copyright © 2017年 weplus. All rights reserved.
//

#import "ViewController.h"

#import "HQLMomentsImageLayoutView.h"

@interface ViewController () <HQLMomentsImageLayoutViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HQLMomentsImageLayoutView *view = [[HQLMomentsImageLayoutView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    view.delegate = self;
    [self.view addSubview:view];
}

- (NSInteger)numberOfItemsInMomentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView {
    return 4;
}

- (HQLImageType)momentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView typeOfItemWithIndex:(NSInteger)itemIndex {
    return HQLImageTypeUnknow;
}

- (void)momentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView renderItem:(HQLMomentsImageView *)item atIndex:(NSInteger)itemIndex {
    item.backgroundColor = [UIColor blueColor];
}

- (void)momentsImageLayoutView:(HQLMomentsImageLayoutView *)momentsImageLayoutView didClickItem:(HQLMomentsImageView *)item atIndex:(NSInteger)itemIndex {
    NSLog(@"did click %ld", itemIndex);
}

- (void)momentsImageLayoutViewFrameDidChange:(HQLMomentsImageLayoutView *)momentsImageLayoutView {
    NSLog(@"frame : %@", NSStringFromCGRect(momentsImageLayoutView.frame));
}

@end
