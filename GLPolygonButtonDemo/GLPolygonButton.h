//
//  GLPolygonButton.h
//  多边形按钮
//
//  Created by GrayLand on 15/12/17.
//  Copyright © 2015年 GrayLand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLPolygonButton : UIButton

@property (nonatomic, assign) NSInteger polygonNum; ///<边数


/**
 *  使用正多边形风格初始化
 *
 *  @param frame
 *  @param num   正多边形数量
 *  @param marginWidth  
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame polygonNum:(NSInteger)num marginWidth:(CGFloat)marginWidth;

/**
 *  手动设置形状
 *
 *  @param path
 */
- (void)setManulPolygonPath:(UIBezierPath *)path;

@end
