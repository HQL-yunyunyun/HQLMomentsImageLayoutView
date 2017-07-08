//
//  HQLMomentsImageView.h
//  HQLMomentsImageLayoutView
//
//  Created by weplus on 2017/7/8.
//  Copyright © 2017年 weplus. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    HQLImageTypePhoto, // 普通照片 -- 不显示icon
    HQLImageTypeGif, // gif --- 会显示icon
    HQLImageTypeVideo, // video --- 会显示playButton
    HQLImageTypeLivePhoto, // livePhoto --- 会显示icon
    HQLImageTypeUnknow, // 不显示icon
} HQLImageType;

@interface HQLMomentsImageView : UIImageView

@property (assign, nonatomic) HQLImageType type;

@end
