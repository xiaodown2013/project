
//
//  HomeRequestApi.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "HomeRequestApi.h"
@interface HomeRequestApi()
@property (nonatomic,strong) NSMutableArray * items ;

@end
@implementation HomeRequestApi
-(id)initItems:(NSString *)version
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

- (YTKRequestMethod)requestMethod {
    
    return YTKRequestMethodGET;
}

-(NSDictionary *)requestHeaderFieldValueDictionary
{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[@"Content-Type"] = @"application/json";
    dict[@"Authorization"] = @"session.1165401133573631929";
    dict[@"X-Tingyun-Id"] = @"0oYvZ_xySjA;c=2;r=1750736249";
    dict[@"User-Agent"] = @"discover/4.12 (iPhone; iOS 10.0.2; Scale/2.00) Resolution/750*1334 Version/4.12 Build/412017 Device/(Apple Inc.;iPhone8,1)";
    return dict;
}
-(NSInteger)cacheTimeInSeconds
{
    return 0;
}

- (NSString *)requestUrl
{
    return @"https://www.xiaohongshu.com/api/sns/v3/homefeed";
}
- (id)requestArgument
{
    return @{@"deviceId":@"949C48BA-609F-4AC8-B12D-04E4CB3C7744",
             @"lang":@"zh",
             @"num":@20,
             @"oid":@"homefeed_recommend",
             @"page": @1,
             @"platform":@"iOS",
             @"sid":@"session.1165401133573631929",
             @"sign":@"5e74ee90027674aa57395111c54fb717",
             @"size":@1,
             @"t":@1481118807,
             @"value":@"simple"
             };
}

@end
