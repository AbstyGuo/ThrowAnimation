//
//  ViewController.m
//  抛物线动画
//
//  Created by guo on 16/6/27.
//  Copyright © 2016年 Beijing Gan Servant Software Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "ThrowLineTool.h"
#define randomColor

@interface ViewController ()<ThrowLineToolDelegate>

@property (nonatomic,assign) BOOL isStart;
@property (nonatomic,strong) UIView * anView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 150, 50, 50)];
    view.tag = 500;
    view.backgroundColor = [UIColor greenColor];
    self.anView = view;
    [self.view addSubview:view];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.center = self.view.center;
    imageView.backgroundColor = [UIColor redColor];
    imageView.tag = 1000;
    [self.view addSubview:imageView];
    
    [self btnClick];
}

-(void)btnClick{
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 150, 50, 50)];
        view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.f green:arc4random()%255/255.f blue:arc4random()%255/255.f alpha:1];
        [self.view addSubview:view];
        [self beginThrowing:view];
}

- (void)beginThrowing:(UIView *)view
{
    ThrowLineTool *tool = [ThrowLineTool sharedTool];
    tool.delegate = self;
    UIImageView *bagImgView = (UIImageView *)[self.view viewWithTag:1000];
    CGFloat startX = 0;//arc4random() % (NSInteger)CGRectGetWidth(self.frame);
    CGFloat startY = 150;//CGRectGetHeight(self.frame);
    CGFloat endX = CGRectGetMidX(bagImgView.frame) + 10 - (arc4random() % 50);
    CGFloat endY = CGRectGetMidY(bagImgView.frame);
    CGFloat height = 100 + arc4random() % 40;

    [tool throwObject:view
                 from:CGPointMake(startX, startY)
                   to:CGPointMake(endX, endY)
               height:height duration:1.6];
}

-(void)dealloc{
    
}

-(void)animationDidFinish{
    [self btnClick];
}

@end
