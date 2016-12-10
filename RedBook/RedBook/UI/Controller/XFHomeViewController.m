//
//  XFHomeViewController.m
//  RedBook
//
//  Created by 谢鹏飞 on 2016/12/7.
//  Copyright © 2016年 xiepf. All rights reserved.
//

#import "XFHomeViewController.h"
#import "XFNavigationView.h"
#import "Masonry.h"
#import "JRWaterFallLayout.h"
#import "HomeMainCell.h"
#import "BootItemFrameModel.h"
#import "HomeRequestApi.h"
#import <AFNetworking.h>
#import "XFHomeSearchViewController.h"
#import "AppDelegate.h"
@interface XFHomeViewController () <UICollectionViewDelegate,UICollectionViewDataSource,HomeMainCellDeleage,JRWaterFallLayoutDelegate>
@property (nonatomic,strong) UICollectionView * collectionView ;
@property (nonatomic,strong) NSMutableArray * items ;
@property(nonatomic,assign) NSInteger currentPage ;
@property (nonatomic,strong) UIView  * downView ;
@property (nonatomic,strong) UIView * navigationView ;
@property (nonatomic,strong) UIView * backgroundView ;

@end

@implementation XFHomeViewController

-(NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    self.navigationController.navigationBarHidden = YES;
    [super viewDidLoad];
    [self createUI];
    
//    HomeRequestApi * api = [[HomeRequestApi alloc]initItems:@""];
//    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"%@",request.responseString);
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"%@",request.responseData);
//    }];
//  
}
- (NSArray *)newItems
{
    NSArray * array = [BookItemModel mj_objectArrayWithFilename:@"1.plist"];
    NSMutableArray * items = [NSMutableArray array];
    for (int i = 0 ; i<array.count; i++) {
        BookItemModel * model = array[i];
        BootItemFrameModel * m = [BootItemFrameModel itemFrameWith:model];
        [items addObject:m];
    }
    return  items;
}

- (NSArray *)moreItemsWithCurrentPage:(NSUInteger)currentPage
{
    // 页码的判断
    if (currentPage == 3) {
        self.currentPage = 0;
    } else {
        self.currentPage++;
    }
    
    NSString *nextPage = [NSString stringWithFormat:@"%lu.plist", self.currentPage];
    
    return [BookItemModel mj_objectArrayWithFilename:nextPage];
}

- (void) createUI{
    UIView * centerView = [[UIView alloc]init];
    UIImageView * logoView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_logo"]];
    UIImageView * downView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_down"]];
    [centerView addSubview:downView];
    [centerView addSubview:logoView];
    
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@10);
        make.centerX.equalTo(@(-5));
    }];
    [downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(logoView.mas_right).offset(5);
        make.centerY.equalTo(@10);
    }];
    XFNavigationView * view = [[XFNavigationView alloc]initWithLeftIcon:@"search" andLeftSelectIcon:@"search" andLeftAction:@selector(onClickSearch) andTitleView:centerView andRightIcon:@"scan" andRightSelectIcon:@"scan" andRightAction:@selector(onClickScan) andTitleAction:@selector(onTitle) andTarget:self] ;
    
    view.backgroundColor = [UIColor colorWithRed:252/255.f green:44/255.f blue:71/255.f alpha:1];
    self.navigationView = view;
    [self.view addSubview:view];
    
    
    [self setupCollectionView];
    
  
   
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)setupCollectionView{
    
    // 创建瀑布流layout
    JRWaterFallLayout *layout = [[JRWaterFallLayout alloc] init];
    // 设置代理
    layout.delegate = self;
    
    // 创建瀑布流view
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kAPP_SCREEN_WIDTH, kAPP_SCREEN_HEIGHT - 64  - 49) collectionViewLayout:layout];
    // 设置数据源
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor colorWithHexString:@"f5f5f5"];
    
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    
    // 注册cell
    [self.collectionView registerClass:[HomeMainCell class] forCellWithReuseIdentifier:@"MAINCELL"];
  
    // 为瀑布流控件添加下拉加载和上拉加载
    
    NSMutableArray *headerImages = [NSMutableArray array];
    for (int i = 0; i <= 30; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"xy_loading_%d",i]];
        [headerImages addObject:image];
    }
    
    NSMutableArray *stateImages = [NSMutableArray array];
    for (int i = 1; i <= 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"xy_loading_s_%d",i]];
        [stateImages addObject:image];
    }
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //下拉刷新要做的操作.
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ // 模拟网络请求延迟
            
            // 清空数据
            [self.items removeAllObjects];
            
            [self.items addObjectsFromArray:[self newItems]];
            
            // 刷新数据
            [self.collectionView reloadData];
            
            // 停止刷新
            [self.collectionView.mj_header endRefreshing];
        });

    }];
    gifHeader.stateLabel.hidden = YES;
    gifHeader.lastUpdatedTimeLabel.hidden = YES;
    
    [gifHeader setImages:@[headerImages[0]] forState:MJRefreshStateIdle];
    [gifHeader setImages:headerImages forState:MJRefreshStateRefreshing];
    _collectionView.mj_header = gifHeader;
    
    
    // 第一次进入则自动加载
    [self.collectionView.mj_header beginRefreshing];
    
    
    MJRefreshAutoGifFooter *gifFooter = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        //上拉加载需要做的操作.

            [self.items addObjectsFromArray:[self moreItemsWithCurrentPage:self.currentPage]];

            // 刷新数据
            [self.collectionView reloadData];

            // 停止刷新
            [self.collectionView.mj_footer endRefreshing];
    }];
    
    gifFooter.stateLabel.hidden = YES;
    gifFooter.refreshingTitleHidden = YES;
    [gifFooter setImages:@[headerImages[0]] forState:MJRefreshStateIdle];
    [gifFooter setImages:headerImages forState:MJRefreshStateRefreshing];
    _collectionView.mj_footer = gifFooter;

    
    UIView * backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kAPP_SCREEN_WIDTH, kAPP_SCREEN_HEIGHT - 64- 49)];
    backgroundView.backgroundColor = [UIColor colorWithHexString:@"333333" alpha:.5];
    [self.view addSubview:backgroundView];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, -74, kAPP_SCREEN_WIDTH, 90)];
    [backgroundView addSubview:view];
    view.backgroundColor = [UIColor colorWithHexString:@"ffffff" alpha:1];
    self.backgroundView = backgroundView;
    self.downView = view;
    UIButton * theAllRow = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, kAPP_SCREEN_WIDTH, 40)];
    [theAllRow setTitle:@"全部" forState:UIControlStateNormal];
    [theAllRow setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    theAllRow.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.downView addSubview:theAllRow];
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 50, kAPP_SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor colorWithHexString:@"f0f0f0"];
    [self.downView addSubview:lineView];
    UIButton * theSignRow  = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, kAPP_SCREEN_WIDTH, 40)];
    [theSignRow setTitle:@"只看关注的人" forState:UIControlStateNormal];
    [theSignRow setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    theSignRow.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.downView  addSubview:theSignRow];
    [self.backgroundView bringSubviewToFront:self.collectionView];
    self.backgroundView.clipsToBounds = YES;
    self.backgroundView.hidden = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onHideBackView)];
    [self.backgroundView addGestureRecognizer:tap];
}
- (void) onHideBackView{
    POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anSpring.toValue = @(self.downView.center.y - 64);
    anSpring.beginTime = CACurrentMediaTime() ;
    anSpring.springBounciness = 10.0f;
    [self.downView pop_addAnimation:anSpring forKey:@"position1"];
    self.backgroundView.hidden = YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    HomeMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MAINCELL" forIndexPath:indexPath];
    cell.model = self.items[indexPath.item];
    // 给cell传递模型
    // 返回cell
    
    cell.delegate = self;
   
    return cell;
    

}

-(UIImageView *)pushImageView
{
    if (!_pushImageView) {
        _pushImageView = [[UIImageView alloc]init];
    [self.view addSubview:self.pushImageView];
    }
    return _pushImageView;
}

-(void)onClickCell:(BootItemFrameModel *)model andCell:(HomeMainCell *) fff
{

    [self.pushImageView setAlpha:1];
    NSInteger index = [self.items indexOfObject:model];
    NSIndexPath * indexPath = [NSIndexPath indexPathForItem:index inSection:0 ];
    HomeMainCell * cell =  (HomeMainCell *) [self.collectionView cellForItemAtIndexPath:indexPath];
    self.pushImageView.frame = CGRectMake(cell.frame.origin.x, cell.frame.origin.y, model.topImageFrame.size.width, model.topImageFrame.size.height);

    //        //  获得在屏幕上的位置
    CGRect rect =   [self.collectionView convertRect:self.pushImageView.frame toView:self.view];
    self.pushImageView.frame = CGRectMake(rect.origin.x, rect.origin.y, self.pushImageView.frame.size.width, self.pushImageView.frame.size.height);
    BookeImageModel * imageModel = model.model.images_list[0];
    [self.pushImageView sd_setImageWithURL:[NSURL URLWithString:imageModel.original] ];

    CGFloat sale  = kAPP_SCREEN_WIDTH  / self.pushImageView.frame.size.width ;
    AppDelegate * del = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    del.pushModel.brforeFrame = self.pushImageView.frame;
    
    [UIView animateWithDuration:.5 animations:^{
        self.pushImageView.frame = CGRectMake(0, 0, kAPP_SCREEN_WIDTH, self.pushImageView.frame.size.height * sale );
        del.pushModel.afterFrame = self.pushImageView.frame;
        del.pushModel.imageView =self.pushImageView;
        del.pushModel.vc = self;
    } completion:^(BOOL finished) {
        XFHomeSearchViewController* vc = [[XFHomeSearchViewController alloc] init];
        [self.navigationController pushViewController:vc animated:nil];
        [self.pushImageView setAlpha:0];
    }];
    
    
}

#pragma mark - <JRWaterFallLayoutDelegate>
/**
 *  返回每个item的高度
 */
- (CGFloat)waterFallLayout:(JRWaterFallLayout *)waterFallLayout heightForItemAtIndex:(NSUInteger)index width:(CGFloat)width
{
    BootItemFrameModel *model = self.items[index];
    
    return model.height;
}
- (NSUInteger)columnCountOfWaterFallLayout:(JRWaterFallLayout *)waterFallLayout{
    return 2;
}
-(CGFloat)rowMarginOfWaterFallLayout:(JRWaterFallLayout *)waterFallLayout{
    return 8;
}

- (void) onTitle
{
    if (self.backgroundView.hidden) {
        self.backgroundView.hidden = NO;
        POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anSpring.toValue = @(self.downView.center.y + 64);
        anSpring.beginTime = CACurrentMediaTime() ;
        anSpring.springBounciness = 10.0f;
        [self.downView pop_addAnimation:anSpring forKey:@"position"];
        
        
    }else
    {
        POPSpringAnimation *anSpring = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
        anSpring.toValue = @(self.downView.center.y - 64);
        anSpring.beginTime = CACurrentMediaTime() ;
        anSpring.springBounciness = 10.0f;
        [self.downView pop_addAnimation:anSpring forKey:@"position1"];

        self.backgroundView.hidden = YES;
    }
    
}

- (void) onClickSearch
{
    XFHomeSearchViewController * searchVC = [[XFHomeSearchViewController alloc]init];
    UINavigationController  * nav = [[UINavigationController alloc]initWithRootViewController:searchVC];
    [self presentViewController:nav animated:NO completion:^{
        
    }];
}

- (void) onClickScan
{

    NSLog(@"-----scan");
}
//- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
//    if (jsonString == nil) {
//        return nil;
//    }
//    NSData *jsonData;
//    jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
//    NSError *err;
//    NSDictionary *dic;
//    dic = [NSJSONSerialization JSONObjectWithData:jsonData
//                                          options:NSJSONReadingMutableContainers
//                                            error:&err];
//    if(err) {
//        NSLog(@"json解析失败：%@",err);
//        return nil;
//    }
//    return dic;
//}
//- (NSString*)dictionaryToJson:(NSDictionary *)dic
//{
//    NSError *parseError = nil;
//    NSData *jsonData;
//    jsonData = [NSJSONSerialization dataWithJSONObject:dic
//                                               options:NSJSONWritingPrettyPrinted
//                                                 error:&parseError];
//    return [[NSString alloc] initWithData:jsonData
//                                 encoding:NSUTF8StringEncoding];
//}


@end
