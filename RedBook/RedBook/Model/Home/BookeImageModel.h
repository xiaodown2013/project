//
//  BookeImageModel.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BookeImageModel : NSObject

@property(nonatomic,assign) NSInteger   height ;
@property (nonatomic,copy) NSString  * original;
@property (nonatomic,copy) NSString  * url;
@property(nonatomic,assign) NSInteger  width ;

@end
