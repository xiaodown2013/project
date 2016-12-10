//
//  NSString+MYTCategory.h
//  MeiNvHuiApp
//
//  Created by wangxingwen on 14-9-25.
//  Copyright (c) 2014年 ___MYTTechnology___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MYTCategory)
//字符串是否是电话号码
- (BOOL)isMobileNumber;
//字符串是否是邮箱
-(BOOL)isEmailNumber;
//字符串是否为空
- (BOOL)isEmptyString;
//是否包含字符窜
- (BOOL)isContainSubString:(NSString*)subString;
//是否包含字母
- (BOOL)isContainZiMu;
//计算字符串长度
- (CGFloat)calculateWidthForFont:(UIFont *)font;
//计算字符窜高度
- (CGFloat) calulateHeightFontType:(UIFont *) fontType RowWidth:(CGFloat) rowWidth;

@end
