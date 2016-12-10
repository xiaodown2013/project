//
//  HomeMainCell.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "HomeMainCell.h"
#import "Masonry.h"
#import "BookeImageModel.h"
@interface HomeMainCell()
@property (nonatomic,strong) UIImageView * topImageView ;
@property (nonatomic,strong) UILabel * titleLbl ;
@property (nonatomic,strong) UILabel * descLbl ;
@property (nonatomic,strong) UIImageView * headImv ;
@property (nonatomic,strong) UILabel * nameLbl;
@property (nonatomic,strong) UIButton * likeBtn ;
@property (nonatomic,strong) UIView * bottomView ;


@end
@implementation HomeMainCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self  =[super initWithFrame: frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.topImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.topImageView];
        self.titleLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        self.titleLbl.numberOfLines = 2;
        self.titleLbl.font = [UIFont systemFontOfSize:11];
        self.titleLbl.lineBreakMode = NSLineBreakByCharWrapping;
        self.titleLbl.textColor = [UIColor colorWithHexString:@"333333"];
        [self addSubview:self.titleLbl];
        self.descLbl = [[UILabel alloc]initWithFrame:CGRectZero];
        self.descLbl.numberOfLines = 3;
        self.descLbl.font = [UIFont systemFontOfSize:11];
        self.descLbl.textColor = [UIColor colorWithHexString:@"777777"];
        self.descLbl.lineBreakMode = NSLineBreakByCharWrapping;
        [self addSubview:self.descLbl];
        self.bottomView = [[UIView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.bottomView];
        self.headImv = [[UIImageView alloc]initWithFrame:CGRectMake(4, 0, 18, 18)];
        [self.bottomView addSubview:self.headImv];
        self.nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(27,5,90,10)];
        self.nameLbl.font = [UIFont systemFontOfSize:9];
        self.nameLbl.textColor = [UIColor colorWithHexString:@"666666"];
        self.likeBtn = [[UIButton alloc] initWithFrame:CGRectZero];
        [self.bottomView addSubview:self.nameLbl];
        [self.bottomView addSubview:self.likeBtn];
        
    }
    return self;
}

- (void)setModel:(BootItemFrameModel *)model
{
    _model = model;
    self.topImageView.frame = model.topImageFrame;
    self.titleLbl.frame = model.titleLblFrame;
    self.descLbl.frame = model.descLblFrame;
    self.bottomView.frame = model.bottomViewFrame;
    BookeImageModel * m = model.model.images_list[0];
    [self.topImageView sd_setImageWithURL:[NSURL URLWithString:m.original] ];
    self.titleLbl.text = model.model.title;
    self.descLbl.text = model.model.desc;
    self.nameLbl.text = model.model.name;
     self.likeBtn.frame  = CGRectMake(model.bottomViewFrame.size.width - 40,0,35,20);
    [self.likeBtn setTitle:[NSString stringWithFormat:@"%ld",model.model.likes] forState:UIControlStateNormal];
    [self.likeBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
    self.likeBtn.titleLabel.font = [UIFont systemFontOfSize:9];
    NSArray *array = [model.model.user.images componentsSeparatedByString:@"@"];
    NSString * string =  array[0];
    NSLog(@"%@",string);
    [self.headImv sd_setImageWithURL:[NSURL URLWithString:string]];
    self.headImv.layer.cornerRadius = 9;
    self.headImv.clipsToBounds = YES;
    self.contentView.layer.borderWidth = 0.5;
    self.contentView.layer.borderColor = [UIColor colorWithHexString:@"dddddd"].CGColor;
    self.contentView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickContent)];
    [self.contentView addGestureRecognizer:tap ];
}

//
//- (void)setDelegate:(id<HomeMainCellDeleage>)delegate
//{
//    if ([_delegate respondsToSelector:@selector(onClickCell:andCell:)]) {
//        [_delegate onClickCell:_model andCell:self];
////        [self onClickContent];
//    }
//}
- (void) onClickContent{
    if ([_delegate respondsToSelector:@selector(onClickCell:andCell:)]) {
        [_delegate onClickCell:self.model andCell:self];
        //        [self onClickContent];
    }
}

@end
