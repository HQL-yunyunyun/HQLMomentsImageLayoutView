//
//  HQLMomentsImageView.m
//  HQLMomentsImageLayoutView
//
//  Created by weplus on 2017/7/8.
//  Copyright © 2017年 weplus. All rights reserved.
//

#import "HQLMomentsImageView.h"

#define kPlayButtonViewSize 30
#define kIconViewSize 20
#define kMargin 10

@interface HQLMomentsImageView ()

@property (strong, nonatomic) UIImageView *playButtonView;
@property (strong, nonatomic) UIImageView *iconView;

@end

@implementation HQLMomentsImageView

#pragma mark - life cycle

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.playButtonView.frame = CGRectMake((width - kPlayButtonViewSize) * 0.5, (height - kPlayButtonViewSize) * 0.5, kPlayButtonViewSize, kPlayButtonViewSize);
    self.iconView.frame = CGRectMake(width - kIconViewSize - kMargin, height - kIconViewSize - kMargin, kIconViewSize, kIconViewSize);
}

#pragma mark - setter

- (void)setType:(HQLImageType)type {
    _type = type;
    
    [self.playButtonView setHidden:YES];
    [self.iconView setHidden:YES];
    
    switch (type) {
        case HQLImageTypeGif: {
            self.iconView.hidden = NO;
            self.iconView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"gif_icon" ofType:@"png"]];
            break;
        }
        case HQLImageTypeVideo: {
            self.playButtonView.hidden = NO;
            break;
        }
        case HQLImageTypeLivePhoto: {
            self.iconView.hidden = NO;
            self.iconView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"livePhoto_icon" ofType:@"png"]];
            break;
        }
        case HQLImageTypePhoto: { break; }
        case HQLImageTypeUnknow: { break; }
    }
}

#pragma mark - getter

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
        _iconView.hidden = YES;
        [self addSubview:_iconView];
    }
    return _iconView;
}

- (UIImageView *)playButtonView {
    if (!_playButtonView) {
        _playButtonView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"center_playButton" ofType:@"png"]]];
        _playButtonView.hidden = YES;
        [self addSubview:_playButtonView];
    }
    return _playButtonView;
}

@end
