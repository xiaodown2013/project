//
//  NSString+MYTCategory.m
//  MeiNvHuiApp
//
//  Created by wangxingwen on 14-9-25.
//  Copyright (c) 2014年 ___MYTTechnology___. All rights reserved.
//

#import "NSString+MYTCategory.h"

@implementation NSString (MYTCategory)
//判断字符串是否是手机号码
//判断字符串是否是手机号码
- (BOOL)isMobileNumber
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9]|7[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278]|7[025-9])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    if (([regextestmobile evaluateWithObject:self] == YES)
        || ([regextestcm evaluateWithObject:self] == YES)
        || ([regextestct evaluateWithObject:self] == YES)
        || ([regextestcu evaluateWithObject:self] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(BOOL)isEmailNumber

{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}
#pragma mark 是否空字符串
- (BOOL)isEmptyString
{
    return (self.length == 0);
}
-(BOOL)isContainSubString:(NSString *)subString
{
    NSRange range = [self rangeOfString:subString];
    if(range.location!=NSNotFound){
        return YES;
    }else{
        return NO;
    }
}
//是否包含字母
- (BOOL)isContainZiMu
{
    for(int i =0;i < self.length;i ++)
    {
        unichar c = [self characterAtIndex:i];
        if (c <0x4E00 || c >0x9FFF)
        {
            return YES;
        }
    }
    return NO;
}

- (CGFloat) calulateHeightFontType:(UIFont *) fontType RowWidth:(CGFloat) rowWidth
{
    if (self==nil)
    {
        return 0;
    }
    CGSize maxSize=CGSizeMake(rowWidth, MAXFLOAT);
    CGSize  strSize=[self sizeWithFont:fontType constrainedToSize:maxSize lineBreakMode:NSLineBreakByWordWrapping];
    
    return strSize.height;
}
- (CGFloat)calculateWidthForFont:(UIFont *)font
{
    CGSize size = [self sizeWithFont:font];
    return size.width;
}
@end
