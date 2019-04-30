//
//  SortViewController.h
//  AlgorithmDemo
//
//  Created by 于朝盼 on 2019/4/29.
//  Copyright © 2019 于朝盼. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,SortStyle) {
    BubblingSortStyle = 0,   // 冒泡排序
    FastSortStyle,           // 快速排序
    SelectSortStyle,         // 选择排序
    MergeSortStyle           // 归并排序
};

@interface SortViewController : UIViewController

@property (nonatomic, copy)   NSString  *titleStr;
@property (nonatomic, assign) SortStyle style;

@end

NS_ASSUME_NONNULL_END
