//
//  YGFindViewController.m
//  YGOrderHaircut
//
//  Created by mc1 on 2019/8/7.
//  Copyright © 2019 kou. All rights reserved.
//

#import "YGFindViewController.h"
#import "YGFindeCollectionReusableView.h"
#import "WSLWaterFlowLayout.h"
#import "YGFindeCollectionViewCell.h"
#import "YGFindDetailViewController.h"

@interface YGFindViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WSLWaterFlowLayoutDelegate>
{
    WSLWaterFlowLayout * _flow;
    NSMutableArray * _array;
}
@property (nonatomic, strong) UICollectionView *collectionview;
@property (nonatomic, strong) NSArray *imagArr;
@property (nonatomic, strong) NSArray *titleArr;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation YGFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    self.view.backgroundColor = [UIColor cy_bodyBGColor];
    [self.view addSubview:self.collectionview];
    [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
        make.height.equalTo(@(kScreenHeight-NAVIGATION_BAR_HEIGHT-TAB_BAR_HEIGHT));
    }];
    [self refreshLayout];
}
- (void)refreshLayout{
    
    _flow.collectionView.frame = CGRectMake(0, 0,kScreenWidth, kScreenHeight-NAVIGATION_BAR_HEIGHT-TAB_BAR_HEIGHT);
    [_flow.collectionView  reloadData];
}
#pragma mark - collectionviewDeleagte
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YGFindeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"findcell" forIndexPath:indexPath];
    cell.dic = self.dataSource[indexPath.row];
    cell.clickBlock = ^{
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithDictionary:self.dataSource[indexPath.row]] ;
        [cell.zanCount setTitle:[NSString stringWithFormat:@"%ld",[dic[@"count"] integerValue]+1] forState:UIControlStateNormal];
        [dic setObject:[NSString stringWithFormat:@"%ld",[dic[@"count"] integerValue]+1] forKey:@"count"];
        [self.dataSource replaceObjectAtIndex:indexPath.row withObject:dic];
        [[NSUserDefaults standardUserDefaults]setObject:self.dataSource forKey:@"find"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        NSString *likecount = [[NSUserDefaults standardUserDefaults]objectForKey:@"like"];
        likecount = [NSString stringWithFormat:@"%ld",[likecount integerValue]+1];
        [[NSUserDefaults standardUserDefaults]setObject:likecount forKey:@"like"];
        [CYNotificationCenter postNotificationName:@"refresh" object:nil];
    };
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YGFindDetailViewController *detail = [[YGFindDetailViewController alloc]init];
    detail.dic = self.dataSource[indexPath.row];
    detail.index = indexPath.row;
    [self.navigationController pushViewController:detail animated:YES]; 
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    return CGSizeMake(kScreenWidth, 200);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        YGFindeCollectionReusableView *sectionView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"findview" forIndexPath:indexPath];
        reusableview = sectionView;
    }
    return reusableview;
}
#pragma mark - <WaterflowLayoutDelegate>
- (CGSize)waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat height = [self.dataSource[indexPath.row][@"height"] floatValue];
    return CGSizeMake((kScreenWidth-60)/2, height);
}

/** 头视图Size */
-(CGSize )waterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout sizeForHeaderViewInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, 50);
}
/** 列数*/
-(CGFloat)columnCountInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 2;
}
/** 列间距*/
-(CGFloat)columnMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 10;
}
/** 行间距*/
-(CGFloat)rowMarginInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return 10;
}
/** 边缘之间的间距*/
-(UIEdgeInsets)edgeInsetInWaterFlowLayout:(WSLWaterFlowLayout *)waterFlowLayout{
    return UIEdgeInsetsMake(0, 10, 10, 10);
}
#pragma mark -collectionview初始化
- (UICollectionView *)collectionview{
    if (!_collectionview) {
        
        _flow = [[WSLWaterFlowLayout alloc] init];
        _flow.delegate = self;
        _flow.flowLayoutStyle = WSLWaterFlowVerticalEqualWidth;
        _collectionview = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:_flow];
        _collectionview.backgroundColor = [UIColor cy_bodyBGColor];
        _collectionview.delegate = self;
        _collectionview.dataSource = self;
        [_collectionview registerClass:[YGFindeCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"findview"];
        [_collectionview registerNib:[UINib nibWithNibName:@"YGFindeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"findcell"];
    }
    return  _collectionview;
}
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
        [_dataSource addObjectsFromArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"find"]];
    }
    return _dataSource;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.dataSource removeAllObjects];
    [self.dataSource addObjectsFromArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"find"]];
    [self.collectionview reloadData];
}
@end
