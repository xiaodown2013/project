//
//  XFNavigationView.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "XFNavigationView.h"
#import "Masonry.h"
@interface XFNavigationView ()
    @property(nonatomic,strong) UILabel *titleLbl;
    @property(nonatomic,strong) UIButton *leftBtn;
    @property(nonatomic,strong) UIView *rightView;
    @property(nonatomic,strong) UIButton    *rightBtn;

    @property(nonatomic,copy) NSString * title;
    @property(nonatomic,copy) NSString *leftTitle;
    @property(nonatomic,copy) NSString * rightTitle;
    @property(nonatomic,copy) NSString * leftIcon;
    @property(nonatomic,copy) NSString * leftSelectIcon;
    @property(nonatomic,copy) NSString * centerImage;
    @property(nonatomic,strong)  UIView * centerView;
    @property(nonatomic,copy) NSString * rightIcon;
    @property(nonatomic,copy) NSString * rightSelectIcon;
    @property(nonatomic,strong) NSArray * rightIcons;
//    @property(nonatomic,copy) void(^leftAction)();
//    @property(nonatomic,copy) void(^rightActions)(NSArray * ) ;
    @property(nonatomic,copy) void(^titleTAction)();
//    @property(nonatomic,copy) void(^rightAction)();
    @property(nonatomic) SEL leftAction;
    @property(nonatomic) SEL rightAction;
    @property(nonatomic) NSArray * rightActions;
    @property (nonatomic) id target;
    @property (nonatomic) SEL rightFristAction;
    @property (nonatomic) SEL rightLastAction;
    @property (nonatomic) SEL titleAction;
@end

@implementation XFNavigationView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame: frame];
    
    if (self)
    {
       
        
    }
    return self;
}

- (void) onTitle{
    NSLog(@"ddsldfkaldfkal");
}

- (void ) createUI
{
    
    if (self.title && self.title.length > 0) {
        self.titleLbl = [[UILabel alloc]initWithFrame:CGRectMake((kAPP_SCREEN_WIDTH - 200) * .5 , 20 , 200, 44)];
        self.titleLbl.textColor = [UIColor colorWithHexString:@"333333"];
        self.titleLbl.font = [UIFont systemFontOfSize:16];
        self.titleLbl.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.titleLbl];
        
    }else if (self.centerView ){
        [self addSubview:self.centerView];
        [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.center.equalTo(self);
            make.width.equalTo(@100);
            make.height.equalTo(@64);
        }];

        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self.target action:self.titleAction];
        [self.centerView addGestureRecognizer:tap];

    }
    
    if(self.leftTitle && self.leftTitle.length >0){
        self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(4, 25, 34, 34)];
        [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateHighlighted];
        self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.leftBtn setTitle:self.leftTitle forState:UIControlStateNormal];
        [self addSubview:self.leftBtn];
        [self.leftBtn addTarget:self.target action:_leftAction forControlEvents:UIControlEventTouchUpInside];
    }else if(self.leftIcon && self.leftSelectIcon) {
        self.leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(4, 25, 34, 34)];
        [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateHighlighted];
        self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.leftBtn setImage:[UIImage imageNamed:self.leftIcon] forState:UIControlStateNormal];
        [self.leftBtn setImage:[UIImage imageNamed:self.leftSelectIcon  ] forState:UIControlStateHighlighted];
        [self addSubview:self.leftBtn];
        [self.leftBtn addTarget:self.target action:_leftAction forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (self.rightTitle && self.rightTitle.length > 0 )
    {
        self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(kAPP_SCREEN_WIDTH - 44, 25, 34, 34)];
        [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateHighlighted];
        [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [self addSubview:self.rightBtn];
        [self.rightBtn addTarget:self.target action:_rightAction forControlEvents:UIControlEventTouchUpInside];
    }else if(self.rightIcon && self.rightIcon.length > 0){
        self.rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(kAPP_SCREEN_WIDTH - 44, 25, 34, 34)];
        [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateHighlighted];
        [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
        [self.rightBtn setImage:[UIImage imageNamed:self.rightIcon] forState:UIControlStateNormal];
        [self.rightBtn setImage:[UIImage imageNamed:self.rightSelectIcon] forState:UIControlStateHighlighted];
        [self addSubview:self.rightBtn];
        [self.rightBtn addTarget:self.target action:_rightAction forControlEvents:UIControlEventTouchUpInside];
    }else if(self.rightIcons && self.rightIcons.count>0){
        self.rightView  = [[UIView alloc]initWithFrame:CGRectMake(kAPP_SCREEN_WIDTH - self.rightIcons.count > 1 ? self.rightIcons .count * 30  : self.rightIcons.count * 44, 25, self.rightIcons.count > 1 ? self.rightIcons .count * 30  : self.rightIcons.count * 44, 34)];
        [self addSubview:self.rightView];
        CGFloat width = self.rightIcons.count > 1 ? 30 : 44;
        for (int i = 0 ; i<self.rightIcons.count; i++) {
            UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(i * width , 0 , 34, 34)];
            [btn setImage:[UIImage imageNamed:self.rightIcons[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:self.rightIcons[i]] forState:UIControlStateHighlighted];
            [self.rightView addSubview:btn ];
            [btn addTarget:self.target action:i == 0 ? self.rightFristAction : self.rightLastAction forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
}
- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title  andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel andTarget:(id) target
{
    self = [super initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    self.leftIcon = leftIcon;
    self.leftSelectIcon = leftSelectIcon;
    self.leftAction = sel;
    self.title = title;
    self.rightIcon = rightIcon;
    self.rightAction = rightSel;
    self.rightSelectIcon = righSelectIcon;
       self.target = target;
    [self createUI];
    return self;
}

- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitleView:(UIView *)titleView  andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel andTitleAction:(SEL) titleAction andTarget:(id) target
{
    self = [super initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    self.leftIcon = leftIcon;
    self.leftSelectIcon = leftSelectIcon;
    self.leftAction = sel;
    self.centerView = titleView;
    self.rightIcon = rightIcon;
    self.rightAction = rightSel;
    self.titleAction = titleAction;
    self.rightSelectIcon = righSelectIcon;
       self.target = target;
    [self createUI];
    return self;
}

- (instancetype) initWithLeftTitle:(NSString *) leftTitle andLeftAction:(SEL)sel andTitle:(NSString *)title  andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel andTarget:(id) target
{
    self = [super initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    self.leftTitle = leftTitle;
    self.leftAction = sel;
    self.title = title;
    self.rightIcon = rightIcon;
    self.rightAction = rightSel;
    self.rightSelectIcon = righSelectIcon;
       self.target = target;
    [self createUI];
    return self;
}


- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title    andRightIcons:(NSArray *) icons andRightFirstAction:(SEL ) rightFirstAction andRightLastAction:(SEL) rightLastAction andTarget:(id) target
{
    self = [super initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    self.leftIcon = leftIcon;
    self.leftSelectIcon = leftSelectIcon;
    self.leftAction = sel;
    self.title = title;
    self.rightIcons = icons;
    self.rightFristAction = rightFirstAction;
    self.rightLastAction = rightLastAction;
       self.target = target;
    [self createUI];
    return self;
}


- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title andTitleAction:(SEL) titleSel  andRightAction:(SEL) rightSel  andRightTitle:(NSString*)rightTitle andTarget:(id) target
{
    self = [super initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    self.leftIcon = leftIcon;
    self.leftSelectIcon = leftSelectIcon;
    self.leftAction = sel;
    self.title = title;
    self.rightAction = rightSel;
    self.rightTitle = rightTitle;
    self.target = target;
    return self;
    
}

- (instancetype) initWithLeftIcon:(NSString *) leftIcon andLeftSelectIcon:(NSString *) leftSelectIcon andLeftAction:(SEL)sel andTitle:(NSString *)title andTitleAction:(SEL) titleSel andRightIcon:(NSString *) rightIcon andRightSelectIcon:(NSString *) righSelectIcon andRightAction:(SEL) rightSel andLiftTitle:(NSString *) leftTitle andRightTitle:(NSString*)rightSelectIcon andTitleView:(UIView *) titleView andRightIcons:(NSArray *) icons andRightFirstAction:(SEL ) rightFirstAction andRightLastAction:(SEL) rightLastAction andRightTtile:(NSString * ) rightTitle andTarget:(id) target
{
    self = [super initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    self.leftIcon = leftIcon;
    self.leftSelectIcon = leftSelectIcon;
    self.leftAction = sel;
    self.title = title;
    self.rightIcon = rightIcon;
    self.rightAction = rightSel;
    self.rightSelectIcon = rightSelectIcon;
    self.rightIcons = icons;
    self.centerView =  titleView;
    self.leftTitle = leftTitle;
    self.rightTitle = rightTitle;
    self.rightFristAction = rightFirstAction;
    self.rightLastAction = rightLastAction;
    self.target = target;
    return self;
    
}


@end
