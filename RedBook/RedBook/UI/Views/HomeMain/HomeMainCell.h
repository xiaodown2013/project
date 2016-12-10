//
//  HomeMainCell.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BootItemFrameModel.h"
@class HomeMainCell;
@protocol HomeMainCellDeleage <NSObject>

- (void) onClickCell:(BootItemFrameModel *) model andCell:(HomeMainCell *) cell;

@end
@interface HomeMainCell : UICollectionViewCell

@property (nonatomic,weak) id<HomeMainCellDeleage>  delegate;
@property (nonatomic,strong) BootItemFrameModel * model ;

@property (nonatomic ,copy) void (^clickContent)(BootItemFrameModel * model);
@end
