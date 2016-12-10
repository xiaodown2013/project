//
//  UIBarButtonItem+YMY.h
//  Yarmy(技师)
//
//  Created by yearmy on 15/12/28.
//  Copyright © 2015年 yarmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YMY)

+(instancetype)leftBarButtonItemWithImage:(NSString *) image highImage:(NSString * )highImage action:(SEL) action target:(id) target;
+(instancetype)rightBarButtonItemWithImage:(NSString *) image highImage:(NSString * )highImage action:(SEL) action target:(id) target;

@end
