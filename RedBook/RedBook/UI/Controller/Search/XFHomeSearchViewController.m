
//
//  XFHomeSearchViewController.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/8.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "XFHomeSearchViewController.h"
#import "AppDelegate.h"
#import "XFHomeViewController.h"
@interface XFHomeSearchViewController ()

@end

@implementation XFHomeSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    UIView * navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kAPP_SCREEN_WIDTH, 64)];
    [self.view addSubview:navigationView];
    
    UITextField * searchView = [[UITextField alloc]initWithFrame:CGRectMake(10, 27, kAPP_SCREEN_WIDTH - 60, 30)];
    UIImageView * lefImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7, 15, 15)];
    UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 35, 30)];
    [leftView addSubview:lefImage];
    lefImage.image = [UIImage imageNamed:@"search"];
    searchView.leftView = leftView;
    searchView.tintColor = [UIColor redColor];
    searchView.leftViewMode = UITextFieldViewModeAlways;
    [navigationView addSubview:searchView];
    searchView.backgroundColor = [UIColor colorWithHexString:@"dddddd"];
    searchView.layer.cornerRadius = 3.0;
    searchView.clipsToBounds = YES;
    searchView.font = [UIFont systemFontOfSize:14];
    searchView.clearButtonMode =UITextFieldViewModeAlways;
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 63.5, kAPP_SCREEN_WIDTH, .5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    UIButton * cancelBtn = [[UIButton alloc]init];
    cancelBtn.frame  =CGRectMake(CGRectGetMaxX(searchView.frame)+ 5, 27, 50, 30) ;
    [cancelBtn sizeToFit];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancelBtn addTarget:self action:@selector(onCancel) forControlEvents:UIControlEventTouchUpInside];
    
    [navigationView addSubview:cancelBtn];
    
    [navigationView addSubview:lineView];
}

- (void) onCancel{
    AppDelegate * del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    CGRect befroeFrame = del.pushModel.brforeFrame;
    befroeFrame = CGRectMake(befroeFrame.origin.x, befroeFrame.origin.y, befroeFrame.size.width, befroeFrame.size.height);
    XFHomeViewController * vc = (XFHomeViewController *)del.pushModel.vc;
    [vc.pushImageView setAlpha:1];
    
    if (self.navigationController.viewControllers.count > 0) {
       
        [self.navigationController popViewControllerAnimated:NO];
        [UIView animateWithDuration:0.5 animations:^{
            vc.pushImageView.frame = befroeFrame;
            NSLog(@"aaa");
        } completion:^(BOOL finished) {
            [vc.pushImageView setAlpha:0];
        }];
    }
    [self dismissViewControllerAnimated:NO completion:^{
        [UIView animateWithDuration:0.5 animations:^{
            vc.pushImageView.frame = befroeFrame;
            NSLog(@"aaa");
        } completion:^(BOOL finished) {
            [vc.pushImageView setAlpha:0];
        }];
        
    }];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
