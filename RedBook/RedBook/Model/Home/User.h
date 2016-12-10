//
//  User.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic,assign) Boolean  followed ;
@property (nonatomic,copy) NSString  * images;
@property(nonatomic,assign) Boolean  isbirthday ;
@property (nonatomic,copy) NSString  * nickname;
@property (nonatomic,copy) NSString  * userid;
@property(nonatomic,assign) NSInteger  red_club_level ;
@end
