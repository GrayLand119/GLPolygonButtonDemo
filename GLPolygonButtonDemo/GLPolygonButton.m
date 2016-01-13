//
//  GLPolygonButton.m
//  多边形按钮
//
//  Created by GrayLand on 15/12/17.
//  Copyright © 2015年 GrayLand. All rights reserved.
//

#import "GLPolygonButton.h"


@interface GLPolygonButton()

@property (nonatomic, strong) UIBezierPath *polygonPath;

@end

@implementation GLPolygonButton

- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame polygonNum:4 marginWidth:0];
}

- (instancetype)initWithFrame:(CGRect)frame polygonNum:(NSInteger)num marginWidth:(CGFloat)marginWidth
{
    if (self = [super initWithFrame:frame]) {
        self.polygonPath = [self regularPolygonPathWithPolygonNum:num marginWidth:marginWidth];
    }
    return self;
}

- (UIBezierPath *)regularPolygonPathWithPolygonNum:(NSInteger)num marginWidth:(CGFloat)marginWidth
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    if(num < 3){
        num = 3;
    }
    if (marginWidth < 0) {
        marginWidth = 0;
    }
    double a = 0;
    double ang = 2 * M_PI / num;
    double w = self.bounds.size.width / 2 - marginWidth;
    double h = self.bounds.size.height / 2 - marginWidth;
    double x0 = marginWidth + w;
    double y0 = marginWidth + h;
    
    [path moveToPoint:CGPointMake(x0, y0 - h)];
    
    for(NSInteger i = 0; i < num - 1; i++)
    {
        a += ang;
        [path addLineToPoint:CGPointMake(x0 + w * sin(a), y0 - h * cos(a))];
    }
    [path closePath];
    return path;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL bRes = [super pointInside:point withEvent:event];
    if (![self.polygonPath containsPoint:point])
    {
        return NO;
    }
    
    return bRes;
}

- (void)setPolygonPath:(UIBezierPath *)polygonPath
{
    _polygonPath = polygonPath;
    
    if (polygonPath) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = _polygonPath.CGPath;
        self.layer.mask = shapeLayer;
    }else{
        self.layer.mask = nil;
    }
}

- (void)setManulPolygonPath:(UIBezierPath *)path
{
    self.polygonPath = path;
}

@end
