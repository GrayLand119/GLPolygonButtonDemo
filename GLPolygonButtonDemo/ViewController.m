//
//  ViewController.m
//  GLPolygonButtonDemo
//
//  Created by GrayLand on 16/1/13.
//  Copyright © 2016年 GrayLand. All rights reserved.
//

#import "ViewController.h"
#import "GLPolygonButton.h"


@interface ViewController ()

@property (nonatomic, strong) GLPolygonButton *polygonButton1;
@property (nonatomic, strong) GLPolygonButton *polygonButton2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // 1. 正多边形
    _polygonButton1 = [[GLPolygonButton alloc]initWithFrame:CGRectMake(50, 64, 150, 150)
                                                polygonNum:9 // 正9边行
                                               marginWidth:-10]; // 内缩10个单位
    
    _polygonButton1.backgroundColor     = [UIColor greenColor];
    _polygonButton1.layer.masksToBounds = NO;
    
    [_polygonButton1 setTitle:@"PolygonBtn1" forState:UIControlStateNormal];
    [_polygonButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_polygonButton1 addTarget:self
                       action:@selector(onChangeColor:)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_polygonButton1];

    // 2. 自定义形状
    _polygonButton2 = [[GLPolygonButton alloc] initWithFrame:CGRectMake(50, 220, 150, 150)];
    
    _polygonButton2.backgroundColor     = [UIColor greenColor];
    _polygonButton2.layer.masksToBounds = NO;
    
    [_polygonButton2 setTitle:@"PolygonBtn2" forState:UIControlStateNormal];
    [_polygonButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_polygonButton2 addTarget:self
                       action:@selector(onChangeColor:)
             forControlEvents:UIControlEventTouchUpInside];
    
    // 绘制自定义形状
    UIBezierPath *bp = [UIBezierPath bezierPath];
    [bp moveToPoint:CGPointMake(0, 0)];
    [bp addLineToPoint:CGPointMake(150, 75)];
    [bp addLineToPoint:CGPointMake(0, 150)];
    [bp closePath];
    // 设置自定义形状
    [_polygonButton2 setManulPolygonPath:bp];
    
    [self.view addSubview:_polygonButton2];
    
}

- (void)onChangeColor:(UIButton *)sender
{
    sender.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0
                                             green:arc4random()%256/255.0
                                              blue:arc4random()%256/255.0
                                             alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
