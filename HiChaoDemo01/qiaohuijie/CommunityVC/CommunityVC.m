//
//  CommunityVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 surker. All rights reserved.
//


#import "CommunityVC.h"

@interface CommunityVC ()
@property(nonatomic,strong)NSMutableArray *scrollDataArr;
@end

@implementation CommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getScrollDataArr];
    
}
#pragma mark - 创建顶部scrollView
-(void)createScrollView
{
    UIView *view=[UIView new];
    [self.view addSubview:view];
    UIScrollView *topScroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kMainBoundsW, 220)];
    for (int i=0; i<self.scrollDataArr.count; i++) {
        UIButton *scrollImageBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        scrollImageBtn.frame=CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, 220);
        CommunityScrollDataModel *model=self.scrollDataArr[i];
        [scrollImageBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
        [scrollImageBtn addTarget:self action:@selector(chooseScrollImage:) forControlEvents:UIControlEventTouchUpInside];
        [topScroll addSubview:scrollImageBtn];
    }
    topScroll.backgroundColor=[UIColor grayColor];
    topScroll.contentSize=CGSizeMake(kMainBoundsW*self.scrollDataArr.count, 220);
    [self.view addSubview:topScroll];
}
#pragma mark--获取顶部scrollView的数据并绘制
-(void)getScrollDataArr
{
    if (!_scrollDataArr) {
        _scrollDataArr=[NSMutableArray new];
    }
    [_scrollDataArr removeAllObjects];
    [QHJRequestDataTools requestDataWithUrl:@"http://api-v2.mall.hichao.com/forum/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=282DC040-8A37-4D6D-92A1-55AC237988B1&gs=640x1136&gos=8.4&access_token=" andWith:^(NSArray *returnValue) {
        [_scrollDataArr addObjectsFromArray:returnValue];
        [self createScrollView];
        }];
}
#pragma mark--选择scrollView上的image
-(void)chooseScrollImage:(UIButton *)sender
{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
