//
//  BootItemFrameModel.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookItemModel.h"
@interface BootItemFrameModel : NSObject

@property(nonatomic,assign) CGRect  topImageFrame ;
@property(nonatomic,assign) CGRect  titleLblFrame ;
@property(nonatomic,assign) CGRect  descLblFrame;
@property(nonatomic,assign) CGRect  bottomViewFrame ;
@property (nonatomic,strong) BookItemModel * model ;
@property(nonatomic,assign) CGFloat  height ;
+ (id) itemFrameWith:(BookItemModel *) model ;

@end
