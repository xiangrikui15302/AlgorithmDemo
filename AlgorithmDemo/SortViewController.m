//
//  SortViewController.m
//  AlgorithmDemo
//
//  Created by 于朝盼 on 2019/4/29.
//  Copyright © 2019 于朝盼. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.title = _titleStr;
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(55), @(29),@(93),@(23),@(4),@(56),@(1),@(34),@(69),nil];
    
    // 快速排序
//    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
    
    // 归并排序
    NSMutableArray *tempArr = [[NSMutableArray alloc]init];
    [self mergeSortArray:arr lowIndex:0 highIndex:arr.count - 1 tempArr:tempArr];
    [self printArr:arr];
}

// 冒泡排序
// 冒泡排序是重复的走访过要排序的数列，一次比较两个元素，如果他们的顺序错误就把他们交换过来。走访数列的工作是重复的进行直到没有再需要交换的，也就是说该数列已经排序完成
- (void) bubblingSortWithArr:(NSMutableArray *)arr{
    NSInteger count = arr.count;
    for (int i = 0; i<count - 1; i++) {
        // 每次循环排到此次循环最后一个的肯定是最大的
        for (int j = 0; j<count - 1 - i; j++) {
            if (arr[j] > arr[j+1]) {
                NSNumber *temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
        
    }
}

// 选择排序
// 选择排序的工作原理是每一次从待排序的数据元素中选出最小（或最大）的一个元素，放在序列的起始位置，直到全部待排序的数据元素排完
- (void)selectSortWithArr:(NSMutableArray *)array {
    NSInteger count = array.count;
    for (int i = 0; i<count -1; i++) {
        for (int j = i+1; j<count; j++) {
            if (array[i]>array[j]) {
                NSNumber *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
}

// 快速排序
// 该方法的基本思想是：
// 1.先从数组中取出一个数作为基准数
// 2.区分过程，将比这个数大的全部放到它的右边，小于或等于它的放到它的左边
// 3.再对左右区间重复第二步，直到各区间只有一个数。
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
        
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

// 归并排序
// 1.分解：将待排序的问题分解成大小大致相等的两部分
// 2.求解子问题：用归并排序的方法对两个子问题进行递归排序
// 3.合并：将排好序的有序子序列进行合并，得到符合要求的子序列
- (void)mergeSortArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex highIndex:(NSInteger)highIndex  tempArr:(NSMutableArray *)tempArr
{
    if (lowIndex >= highIndex) {
        return;
    }
    NSInteger midIndex = lowIndex + (highIndex - lowIndex) / 2;
    [self mergeSortArray:array lowIndex:lowIndex highIndex:midIndex tempArr:tempArr];
    [self mergeSortArray:array lowIndex:midIndex + 1 highIndex:highIndex tempArr:tempArr];
    [self mergeArray:array lowIndex:lowIndex midIndex:midIndex highIndex:highIndex tempArr:tempArr];
}

- (void)mergeArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex midIndex:(NSInteger)midIndex highIndex:(NSInteger)highIndex  tempArr:(NSMutableArray *)tempArr
{
    for (NSInteger i = lowIndex; i <= highIndex; i ++) {
        tempArr[i] = array[i];
    }
    
    NSInteger k = lowIndex;
    NSInteger l = midIndex + 1;
    for (NSInteger j = lowIndex; j <= highIndex; j ++) {
        if (l > highIndex) {
            array[j] = tempArr[k];
            k++;
        }else if (k > midIndex)
        {
            array[j] = tempArr[l];
            l++;
        }else if ([tempArr[k] integerValue] > [tempArr[l] integerValue])
        {
            array[j] = tempArr[l];
            l++;
        }else
        {
            array[j] = tempArr[k];
            k++;
        }
    }
}

// 打印
- (void)printArr:(NSMutableArray *)arr {
    NSLog(@"排完序之后为：");
    for(int i = 0;i<arr.count;i++){
        NSLog(@"%@",arr[i]);
    }
}

@end
