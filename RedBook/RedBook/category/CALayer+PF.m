//
//  CALayer+PF.m
//  aydiancan
//
//  Created by 谢鹏飞 on 15/11/28.
//  Copyright © 2015年 IF. All rights reserved.
//

#import "CALayer+PF.h"

@implementation CALayer (PF)


- (void)setBorderColorFromUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}
@end
