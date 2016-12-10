//
//  NSString+BB.h
//  myGroup
//
//  Created by 谢鹏飞 on 15/11/13.
//  Copyright © 2015年 roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PF)

-(CGSize )sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

-(CGSize)sizeWithFont:(UIFont *)font;

-(NSInteger ) fileSize ;

- (NSString *)md5Encrypt;

- (BOOL) validateEmail;
/// 判断是否是手机号
- (BOOL) validateMobile;

- (NSString *)changePhotoPath;
@end
