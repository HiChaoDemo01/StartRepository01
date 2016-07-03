//
//  IntroduceVC.m
//  HiChaoDemo01
//
//  Created by Mac on 16/7/2.
//  Copyright © 2016年 surker. All rights reserved.
//

#import "IntroduceVC.h"

@interface IntroduceVC ()

@end

@implementation IntroduceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(100, 100, 100, 100);
    btn.backgroundColor=[UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    

}

- (void)didEnterRootVC:(DidSelectedEnter)newBlock {
    
    
    
    self.block = newBlock;
}
- (void)btnClick:(UIButton *)sender {
    
    self.block();
    
    
    
    
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
