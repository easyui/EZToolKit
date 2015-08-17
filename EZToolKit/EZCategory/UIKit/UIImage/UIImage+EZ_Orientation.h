//
//  UIImage+EZ_Orientation.h
//  EZToolKit
//
//  Created by yangjun zhu on 15/5/20.
//  Copyright (c) 2015年 Cactus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (EZ_Orientation)
/*
 * @brief rotate image 90 withClockWise 顺时针90
 */
- (UIImage*)ez_rotate90Clockwise;

/*
 * @brief rotate image 90 counterClockwise 逆时针90
 */
- (UIImage*)ez_rotate90CounterClockwise;

/*
 * @brief rotate image 180 degree
 */
- (UIImage*)ez_rotate180;

/*
 * @brief rotate image to default orientation 原始方向
 */
- (UIImage*)ez_rotateImageToOrientationUp;

/*
 * @brief flip horizontal水平翻转
 */
- (UIImage*)ez_flipHorizontal;

/*
 * @brief flip vertical竖直翻转
 */
- (UIImage*)ez_flipVertical;

/*
 * @brief flip horizontal and vertical
 */
- (UIImage*)ez_flipAll;
@end
