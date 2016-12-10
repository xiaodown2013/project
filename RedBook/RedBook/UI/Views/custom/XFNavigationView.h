//
//  XFNavigationView.h
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XFNavigationView : UIView
/**
 *  左图 中字 右图
 */
- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title  andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel andTarget:(id) target;
/**
 *  左图 中v 右图
 */
- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitleView:(UIView *)titleView  andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel  andTitleAction:(SEL) titleAction andTarget:(id) target;
/**
 *  左字 中字 右图
 */
- (instancetype) initWithLeftTitle:(NSString *) leftTitle andLeftAction:(SEL)sel andTitle:(NSString *)title  andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel andTarget:(id) target;

/**
 *  左图 中字 右双图
 */
- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title    andRightIcons:(NSArray *) icons andRightFirstAction:(SEL ) rightFirstAction andRightLastAction:(SEL) rightLastAction andTarget:(id) target;

/**
 *  左图 中字 右字
 */
- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title andTitleAction:(SEL) titleSel  andRightAction:(SEL) rightSel  andRightTitle:(NSString*)rightTitle andTarget:(id) target;






@end
