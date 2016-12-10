////
////  MJExtensionConfig.m
////
////  Created by 谢鹏飞 on 15/12/15.
//#import "MJExtensionConfig.h"
//#import "MJExtension.h"
//#import "CustomNavigationEntity.h"
//#import "CustomMenuCellEntity.h"
//#import "PickerViewModel.h"
//#import "TechDetailEntity.h"
//#import "ZygMyShowProjectDetailModel.h"
//#import "ServiceClassifyModel.h"
//#import "HomeClassifyAreasModel.h"
//#import "MyShowBodyModel.h"
//#import "MyShowHeaderModel.h"
//
//#import "ZygStoreDetailContentModel.h"
//#import "ZygMyOrderModel.h"
//#import "ZygFashionChannelModel.h"
//#import "ZygOrderCommentModel.h"
//#import "ZygProjectOrderTimeDetailModel.h"
//
//#import "ZygProjectConfirmOrderModel.h"
//#import "OrderDetailModel.h"
//
//#import "ZygHomeHeaderImgModel.h"
//
//#import "TechnicianDetailModel.h"
//
//#import "ZygGroupBuyPersonalModel.h"
//
//@implementation MJExtensionConfig
///**
// *  这个方法会在MJExtensionConfig加载进内存时调用一次
// */
//+ (void)load
//{
//#pragma mark 如果使用NSObject来调用这些方法，代表所有继承自NSObject的类都会生效
//#pragma mark NSObject中的ID属性对应着字典中的id
//    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{
//                 @"ID" : @"id",
//                 @"descriptionString":@"description"
//                 };
//    }];
//    
//    
//    [ZygMyShowProjectDetailModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
//       
//        return @{@"GroupCheapModel": @"group_cheap"};
//        
//    }];
//    
//    [CustomMenu mj_setupObjectClassInArray:^NSDictionary *{
//    
//        return @{
//                 @"children":@"CustomMenuCellEntity"
//                 };
//    }];
//    
//    [PickerViewModel mj_setupObjectClassInArray:^NSDictionary *{
//        
//        return @{
//                 @"setting":@"PickerViewSection"
//                };
//    }];
//    
//    [TechDetailEntity mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"services":@"ServicersEntity"};
//    }];
//    
//    [ZygMyShowProjectDetailModel mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"steps": [StepModel class], @"products": [ProductModel class], @"coupons": [CouponsModel class], @"order": [OrderModel class]};
//    }];
//    
//    [HomeClassifyAreasModel mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"hot_area":[HotAreaModel class]};
//    }];
//
//    [MyShowBodyModel mj_setupObjectClassInArray:^NSDictionary *{
//        
//        return @{@"comment": [ZygFashionCommentModel class]};
//    }];
//    
//    [MyShowHeaderModel mj_setupObjectClassInArray:^NSDictionary *{
//        
//        return @{@"show" : [MyShowVideoModel class]};
//    }];
//    
//    [ZygStoreDetailContentModel mj_setupObjectClassInArray:^NSDictionary *{
//        
//        return @{@"technicians": [TechnicianModel class], @"coupons": [CouponModel class], @"cards": [CardModel class], @"photos": [PhotosModel class]};
//    }];
//    
//    [GroupCheapModel mj_setupObjectClassInArray:^NSDictionary *{
//       
//        return @{@"order": [OrderModel class]};
//    }];
//    
//    [ZygMyOrderAll mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"order_news":[ZygMyOrderModel class]};
//    }];
//    [ZygFashionChannelModel mj_setupObjectClassInArray:^NSDictionary *{
//       
//        return @{@"channel_one": [ChannelModel class], @"channel_two" :[ChannelModel class]};
//    }];
//    
//    [ZygProjectOrderTimeDetailModel mj_setupObjectClassInArray:^NSDictionary *{
//        
//        return @{@"unavailable_time": [ZygProjectOrderUnableTimeDetailModel class]};
//    }];
//    
//
//    [ZygProjectConfirmOrderModel mj_setupObjectClassInArray:^NSDictionary *{
//       
//        return @{@"list": [ConfirmOrderModel class]};
//    }];
//    
//    [OrderDetailModel mj_setupObjectClassInArray:^NSDictionary *{
//        return @{@"additional":[SubService class]};
//    }];
//    
//    [ZygHomeHeaderImgModel mj_setupObjectClassInArray:^NSDictionary *{
//        
//        return @{@"img_arr": [HomeImgModel class]};
//        
//    }];
//    
//    [ZygGroupBuyPersonalModel mj_setupObjectClassInArray:^NSDictionary *{
//       
//        return @{@"person": [GroupBuyPersonModel class]};
//    }];
//}
//
//@end
