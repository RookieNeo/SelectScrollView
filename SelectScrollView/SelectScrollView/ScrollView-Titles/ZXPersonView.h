//
//  ZXView.h
//  TheHomeOfCar
//
//  Created by qianfeng on 15/9/20.
//  Copyright (c) 2015年 WOW-Neo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangViewControllerDelegate<NSObject>
-(void)changeOffSetDelegate:(CGFloat)index;
@end
@interface ZXPersonView : UIView
@property(nonatomic,strong)UIView *view;
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) NSMutableArray *btnArray;
@property(nonatomic,strong) NSMutableArray *viewArray;
@property(nonatomic,weak)id<ChangViewControllerDelegate>delegate;
+(id)initWithTitles:(NSArray *)titles target:(id)target;
-(id)initWithTitles:(NSArray *)titles target:(id)target;
-(void)changeFrame:(CGFloat)x;
-(void)initViewWithArray:(NSArray *)array;
@end

