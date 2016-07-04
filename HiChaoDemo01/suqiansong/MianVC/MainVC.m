//
//  MainVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()<UIScrollViewDelegate>
{
    UIScrollView *_topScrollView;
    UIPageControl *_topPC;
    
    
    
}

@property (weak, nonatomic) IBOutlet UIScrollView *bgScrollVIew;
@property (nonatomic,strong)NSMutableArray *topImageArr;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    [self createTopScrollView];
    
}

#pragma mark----懒加载初始化数组
- (NSMutableArray *)topImageArr {
    
    if (!_topImageArr) {
        
        
        _topImageArr = [NSMutableArray array];
    }
    
    return _topImageArr;
   
}
                                 

- (void)createTopScrollView {
    
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor clearColor];
    bgView.frame = CGRectMake(0, 0, kMainBoundsW, 300);
    [_bgScrollVIew addSubview:bgView];
    //创建topscroView
    UIScrollView *topScrollView = [[UIScrollView alloc]init];

    topScrollView.frame =CGRectMake(0, 0, kMainBoundsW, 300);
    topScrollView.showsHorizontalScrollIndicator = NO;
    topScrollView.delegate = self;
    topScrollView.pagingEnabled = YES;
    [bgView addSubview:topScrollView];
    _topScrollView = topScrollView;
    [SQSRequest sendRequestForMianVcTopScrollViewImage:^(NSArray *imageArray) {
        [self.topImageArr addObjectsFromArray:imageArray];
        topScrollView.contentSize = CGSizeMake(kMainBoundsW *_topImageArr.count, 0);
        
        for (NSInteger i = 0; i < imageArray.count; i++) {
            
           UIButton *imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            imageButton.frame = CGRectMake(kMainBoundsW *i , 0, kMainBoundsW, 300);
            [imageButton sd_setBackgroundImageWithURL:[NSURL URLWithString:_topImageArr[i]] forState:UIControlStateNormal];
            
            [topScrollView addSubview:imageButton];
            
        }
        UIPageControl *topPC = [[UIPageControl alloc]initWithFrame:CGRectMake(50, 280, 300, 20)];
        topPC.numberOfPages = _topImageArr.count;

        topPC.currentPageIndicatorTintColor = [UIColor redColor];
        [topPC addTarget:self action:@selector(changeTopScrollViewImage) forControlEvents:UIControlEventValueChanged];
        
        [bgView addSubview:topPC];
        _topPC = topPC;
        
    }];
    
  
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    _topPC.currentPage = scrollView.contentOffset.x/kMainBoundsW;
    
    
    
    
}
- (void)changeTopScrollViewImage {
    
    
    _topScrollView.contentOffset = CGPointMake(_topPC.currentPage * kMainBoundsW, 0);
    
    
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
