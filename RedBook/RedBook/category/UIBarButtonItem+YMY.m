//
//  UIBarButtonItem+YMY.m
//  Yarmy(技师)
//
//  Created by yearmy on 15/12/28.
//  Copyright © 2015年 yarmy. All rights reserved.
//

#import "UIBarButtonItem+YMY.h"

@implementation UIBarButtonItem (YMY)

+(instancetype)leftBarButtonItemWithImage:(NSString *)image highImage:(NSString *)highImage action:(SEL)action target:(id)target
{
    UIButton *  button = [[UIButton alloc] init];
    button.imageView.contentMode = UIViewContentModeCenter;
    [button setImage:[UIImage imageNamed: image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 5, 34, 34);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
    return  item;
}

+(instancetype)rightBarButtonItemWithImage:(NSString *)image highImage:(NSString *)highImage action:(SEL)action target:(id)target
{
    UIButton *  button = [[UIButton alloc] init];
    button.imageView.contentMode = UIViewContentModeCenter;
    [button setImage:[UIImage imageNamed: image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 5, 34, 34);
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -15);
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return  item;
}
@end
