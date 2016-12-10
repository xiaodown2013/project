//
//  NSString+BB.m
//  myGroup
//
//  Created by 谢鹏飞 on 15/11/13.
//  Copyright © 2015年 roc. All rights reserved.
//
#import<CommonCrypto/CommonDigest.h>
#import "NSString+PF.h"

@implementation NSString (PF)
//求字体的font的根据宽度求换行字体大小
-(CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW{
    NSMutableDictionary * attrs = [NSMutableDictionary  dictionary];
    attrs [NSFontAttributeName ] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
//求字体的font的size大小
-(CGSize)sizeWithFont:(UIFont *)font{

    return [self sizeWithFont:font maxW:kAPP_SCREEN_WIDTH];
}


//求文件夹里面的文件大小
-(NSInteger )fileSize{

    NSFileManager * mgr = [NSFileManager defaultManager];
    
    BOOL dir = NO;
    BOOL exists = [mgr fileExistsAtPath:self isDirectory:&dir];
    if (exists ==NO) return 0;
    if (dir) {
        NSArray *subpaths = [mgr subpathsAtPath:self];
        NSInteger totalByteSize  =  0;
        for (NSString * subpath in subpaths) {
            NSString * fullSubpath = [self stringByAppendingPathComponent:subpath];
            BOOL subdir = NO;
                [mgr fileExistsAtPath:fullSubpath isDirectory:&subdir];
            if (subdir==NO) {
                totalByteSize += [[mgr attributesOfItemAtPath:fullSubpath error:nil][NSFileSize] integerValue];
            }
       
        }
         return totalByteSize;
    }else{
        return [[mgr attributesOfItemAtPath:self error:nil][NSFileSize] integerValue];
    }

}


- (NSString *)md5Encrypt {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_LONG x = (CC_LONG)strlen(original_str);
    CC_MD5(original_str, x, result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}
- (BOOL) validateEmail {
    NSString * emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate * emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@" ,emailRegex];

    return [emailTest evaluateWithObject:self];
}

/// 判断是否是手机号
- (BOOL) validateMobile {
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9]))\\d{8}$";
    NSPredicate * phoneTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self ];
}

- (NSString *)changePhotoPath
{
    NSMutableString * imgString = [NSMutableString stringWithFormat:@"%@", self];
    NSArray * imgStringArray = [self componentsSeparatedByString:@"/"];
    NSString * lastString = [imgStringArray lastObject];
    NSString * changeLastString = [NSString stringWithFormat:@"s_%@", lastString];
    NSRange range = [imgString rangeOfString:lastString];
    [imgString replaceCharactersInRange:range withString:changeLastString];
    
    return imgString;

}

@end
