
//
//  BootItemFrameModel.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "BootItemFrameModel.h"

@implementation BootItemFrameModel

+(id)itemFrameWith:(BookItemModel *)model
{
    BootItemFrameModel * frameModel = [[BootItemFrameModel alloc]init];
    frameModel.model = model;
    return frameModel;
}

- (void)setModel:(BookItemModel *)model
{
    _model = model;
    CGFloat  const kWidth = (kAPP_SCREEN_WIDTH - 24) * .5  ;
    BookeImageModel * imageModel =  model.images_list.count > 0 ? (BookeImageModel *)model.images_list[0] : [[BookeImageModel alloc]init];
    CGFloat iHeight =   imageModel.height * kWidth / imageModel.width;
//    CGFloat titleHeight =   [model.title sizeWithFont:[UIFont systemFontOfSize:14]].height;
    self.topImageFrame = CGRectMake(0, 0, kWidth, iHeight);
    CGSize titleSize = [model.title sizeWithFont:[UIFont systemFontOfSize:11] maxW:kWidth -8 ];
    self.titleLblFrame = CGRectMake(4, self.topImageFrame.size.height + 5, kWidth - 8, titleSize.height + 5);
    CGSize descSize =  [model.desc sizeWithFont:[UIFont systemFontOfSize:11 weight:kWidth - 8]];
    self.descLblFrame = CGRectMake(4, CGRectGetMaxY(_titleLblFrame), kWidth - 8, descSize.height  > 55 ?55 : descSize.height);
    self.bottomViewFrame = CGRectMake(0, CGRectGetMaxY(_descLblFrame) + 8, kWidth, 25);
    self.height = CGRectGetMaxY(self.bottomViewFrame) + 5;
}
@end
