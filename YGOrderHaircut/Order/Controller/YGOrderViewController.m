//
//  YGOrderViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//
#define CELLWIDTH  (kScreenWidth - 70)/3
#import "YGOrderViewController.h"
#import "YGorderCollectionViewCell.h"
#import "YGOrderCollectionReusableView.h"
#import "YGOrderModel.h"
#import "YGOrderListViewController.h"
#import "YGComboViewController.h"
#import "YGOrderbotoomView.h"


@interface YGOrderViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,YGOrderDelegate>
@property (nonatomic, strong) SDCycleScrollView *sdScrollview;
@property (nonatomic, strong) UICollectionView *orderCollectionView;
@property (nonatomic, strong) YGOrderCollectionReusableView *shopHeader;//collectionView头视图
@property (nonatomic, strong) NSMutableArray *imageArr;
@property (nonatomic, strong) YGOrderbotoomView *botoomView;
@end

@implementation YGOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"预约";
    [self initUI];
    [self addData];
    [self.view addSubview:self.botoomView];
    //NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)];

}
//初始化UI
- (void)initUI{
    CGFloat Y = 0;
    if (iPhonemaX) {
        Y = 132;
    }else{
        Y = NAVIGATION_BAR_HEIGHT;
    }
    [self.view addSubview:self.sdScrollview];
    [self.sdScrollview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.mas_equalTo(150*CYScale);
    }];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(CELLWIDTH, CELLWIDTH);
    flowLayout.headerReferenceSize = CGSizeMake(kScreenWidth, 150);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);

    _orderCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _orderCollectionView.delegate = self;
    _orderCollectionView.dataSource = self;
    _orderCollectionView.backgroundColor = [UIColor cy_bodyBGColor];
    [_orderCollectionView registerClass:[YGOrderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [_orderCollectionView registerNib:[UINib nibWithNibName:@"YGorderCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"headercell"];
    [self.view addSubview:_orderCollectionView];
    [_orderCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.top.equalTo(@(Y));
        make.height.equalTo(@(150*CYScale+CELLWIDTH*2));
    }];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(kScreenWidth, 150);
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   
    return self.imageArr.count;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    _shopHeader = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
     [_shopHeader addSubview:self.sdScrollview];
    return _shopHeader;
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YGorderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"headercell" forIndexPath:indexPath];
    cell.dic = self.imageArr[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YGOrderListViewController *list  = [[YGOrderListViewController alloc]init];
    list.datasource = self.imageArr[indexPath.row][@"list"];
    list.name = self.imageArr[indexPath.row][@"name"];
    [self.navigationController pushViewController:list animated:YES];
}
- (SDCycleScrollView *)sdScrollview{
    if (!_sdScrollview) {
        _sdScrollview = [[SDCycleScrollView alloc]init];
        _sdScrollview.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _sdScrollview.currentPageDotColor = [UIColor whiteColor];
        _sdScrollview.pageDotColor = [UIColor cy_garyTextColor];
        _sdScrollview.delegate = self;
        _sdScrollview.currentPageDotImage = [UIImage imageWithColor:[UIColor whiteColor]];
        _sdScrollview.contentMode = UIViewContentModeScaleAspectFill;
        _sdScrollview.clipsToBounds = YES;
        _sdScrollview.pageDotImage = [UIImage imageWithColor:[UIColor grayColor]];
        _sdScrollview.pageControlDotSize = CGSizeMake(10, 4);
        _sdScrollview.localizationImageNamesGroup = @[@"banner-1",@"于大爷banner"];
    }
    return _sdScrollview;
}
- (void)addData{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"orderList" ofType:@"plist"];
    self.imageArr = [[NSMutableArray alloc]initWithContentsOfFile:plistPath];
    [self.orderCollectionView reloadData];
}
- (YGOrderbotoomView *)botoomView{
    if (!_botoomView) {
        _botoomView = [[YGOrderbotoomView alloc]initWithFrame:CGRectMake(0, 150*CYScale+CELLWIDTH*2+NAVIGATION_BAR_HEIGHT+10, kScreenWidth, kScreenHeight-(150*CYScale+CELLWIDTH*2+NAVIGATION_BAR_HEIGHT+10)-TAB_BAR_HEIGHT)];
        _botoomView.delegate = self;
    }
    return _botoomView;
}
- (void)pushWithModel:(YGFindModel *)model{
    YGComboViewController *combo = [[YGComboViewController alloc]init];
    combo.model = model;
    [self.navigationController pushViewController:combo animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}
- (IBAction)search:(UIButton *)sender {
    CYShowTips(@"暂无搜索结果");
}
@end
