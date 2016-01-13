#多边形按钮
## 1. 功能
* 触摸事件接收的区域和形状是一样的,也就是多边形触摸区域
* 可绘制正多边形和任意自定义图形


## 2. 用法

``` objectivec
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
```
## 3. 效果图

![ImgId](https://github.com/GrayLand119/GLPolygonButtonDemo/blob/master/DemoImg01.png)
