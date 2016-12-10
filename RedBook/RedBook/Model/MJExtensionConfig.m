//
//  MJExtensionConfig.m
//
//  Created by 谢鹏飞 on 15/12/15.
#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "BookItemModel.h"
#import "BookeImageModel.h"
#import "Recommend.h"
#import "User.h"
@implementation MJExtensionConfig
/**
 *  这个方法会在MJExtensionConfig加载进内存时调用一次
 */
+ (void)load
{
#pragma mark 如果使用NSObject来调用这些方法，代表所有继承自NSObject的类都会生效
#pragma mark NSObject中的ID属性对应着字典中的id
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id",
                 @"descriptionString":@"description"
                 };
    }];
    
    
    
    [BookItemModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"images_list": [BookeImageModel class]};
    }];
    
   }

@end
