
//
//  ZXView.m
//  TheHomeOfCar
//
//  Created by qianfeng on 15/9/20.
//  Copyright (c) 2015年 WOW-Neo. All rights reserved.
//

#import "ZXPersonView.h"
@interface ZXPersonView()<UIScrollViewDelegate>
@end
@implementation ZXPersonView
{
    NSArray *titlesArray;
    UIViewController *_target;
}
+(id)initWithTitles:(NSArray *)titles target:(id)target;
{
    static ZXPersonView *cx=nil;
    if (cx==nil) {
        cx=[[ZXPersonView alloc] init];
        cx = [cx initWithTitles:titles target:target];
        //return cx;
    }
    return cx;
}
-(id)initWithTitles:(NSArray *)titles target:(id)target
{
    if (self=[super init]) {
        _target=target;
        UIScrollView *avc=target;
        titlesArray=[[NSArray alloc] initWithArray:titles];
        self.btnArray = [[NSMutableArray alloc] init];
        self.viewArray = [[NSMutableArray alloc] init];
        self.frame=CGRectMake(0, 64, avc.frame.size.width, 36);
        _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, avc.frame.size.width, 36)];
        for (int i=0; i<=titlesArray.count-1; i++) {
            UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
            btn.titleLabel.font=[UIFont systemFontOfSize:14];
            btn.frame=CGRectMake((self.frame.size.width/titles.count)*i, 2, self.frame.size.width/titles.count, 30);
            [btn setTitle:titlesArray[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithRed:0.74f green:0.74f blue:0.74f alpha:1.00f] forState:UIControlStateNormal];
            [btn setTitle:titlesArray[i] forState:UIControlStateSelected];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
            view.center = CGPointMake(btn.frame.origin.x + btn.frame.size.width - 20 ,10);
            view.layer.cornerRadius = 5;
            view.backgroundColor = [UIColor redColor];
            view.tag = 2000 + i;
            view.hidden = true;
            btn.tag=1000+i;
            if (i==0) {
                btn.selected=YES;
            }
            [btn addTarget:self action:@selector(zouni:) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:btn];
            [_btnArray addObject:btn];
            [_scrollView addSubview:view];
            [_viewArray addObject:view];
            
        }
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.showsVerticalScrollIndicator=NO;
        _scrollView.delegate=self;
        _scrollView.bounces=YES;
        _scrollView.contentSize=CGSizeMake(50*titlesArray.count, 0);
        [self addSubview:_scrollView];
        _view=[[UIView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width/titles.count - 10, 2)];
        _view.center = CGPointMake((self.frame.size.width/titles.count)/2, 35);
        _view.tag=2000;
        //UIImage *image=[UIImage imageNamed:@"scout_login_ic_change_selected@3x"];
        _view.backgroundColor = [UIColor redColor];
        [_scrollView addSubview:_view];
    }
    return self;
}
-(void)zouni:(UIButton *)btn
{
    __block CGPoint point=btn.center;
    point.y=35;
    [UIView animateWithDuration:0.3 animations:^{
        _view.center=point;}];
    for (int i=0; i<=titlesArray.count-1; i++) {
        UIButton *button=(UIButton *)[self viewWithTag:1000+i];
        button.selected=NO;
    }
    btn.selected=YES;
    UIScrollView *sv=(UIScrollView *)_target;
    sv.contentOffset=CGPointMake((btn.tag-1000)*[UIScreen mainScreen].bounds.size.width, 0);
    [self viewHiddenWithPara:((int)btn.tag - 1000)];
    [_delegate changeOffSetDelegate:btn.tag-1000];
}
-(void)changeFrame:(CGFloat)x{
    for(UIButton *btn in _btnArray){
        btn.selected = false;
    }
    UIButton *btn = _btnArray[(int)x / (int)[UIScreen mainScreen].bounds.size.width];
    btn.selected = true;
    UIView *view = self.subviews[0].subviews.lastObject;
    CGPoint point = btn.center;
    point.y = 35;
    [UIView animateWithDuration:0.2 animations:^{
        view.center = point;
    }];
    [self viewHiddenWithPara:(int)x / (int)[UIScreen mainScreen].bounds.size.width];
}
-(void)viewHiddenWithPara:(int)x{
    UIView *view = _viewArray[x];
    view.hidden = true;
}
-(void)initViewWithArray:(NSArray *)array{
    int index = 0;
    for (UIView *view in _viewArray){
        if ([array[index]  isEqual: @"0"]){
            view.hidden = true;
        }else{
            view.hidden = false;
        }
        index += 1;
    }
}
@end
