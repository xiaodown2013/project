//
//  RootPushModel.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/10.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RootPushModel : NSObject
@property(nonatomic,assign) CGRect  brforeFrame ;
@property(nonatomic,assign) CGRect  afterFrame ;
@property (nonatomic,strong) UIImageView * imageView ;
@property (nonatomic,strong) UIViewController * vc ;

@end
