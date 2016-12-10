//
//  BookItemModel.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookeImageModel.h"
#import "Recommend.h"
#import "User.h"
@interface BookItemModel : NSObject
@property (nonatomic,copy) NSString * comments;
@property(nonatomic,assign) CGFloat  cursor_score ;
@property (nonatomic,copy) NSString  * desc;
@property(nonatomic,assign) Boolean   enabled ;
@property(nonatomic,assign) NSInteger  fav_count  ;
@property (nonatomic,copy) NSString  * ID;
@property (nonatomic,strong) NSArray<BookeImageModel *> * images_list ;
@property(nonatomic,assign) Boolean  infavs ;
@property(nonatomic,assign) Boolean  inlikes ;
@property(nonatomic,assign) NSInteger  level ;
@property(nonatomic,assign) NSInteger  likes ;
@property (nonatomic,copy) NSString  * name;
@property (nonatomic,strong) NSArray * newest_comments ;
@property (nonatomic,copy) NSString  * normal;
@property (nonatomic,strong) Recommend * recommend ;
@property (nonatomic,strong) NSArray * relatedgoods_list ;
@property (nonatomic,copy) NSString  * share_link;
@property(nonatomic,assign) Boolean  show_more ;
@property (nonatomic,copy) NSString  * time;
@property (nonatomic,copy) NSString  * title;
@property (nonatomic,copy) NSString  * type;
@property (nonatomic,strong) User * user ;

@end
