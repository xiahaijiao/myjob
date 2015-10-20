//
//  QYTabBarViewController.m
//  custom-exercise
//
//  Created by qingyun on 15/10/20.
//  Copyright © 2015年 qingyun. All rights reserved.
//

#import "QYTabBarViewController.h"
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define QYScreenW [UIScreen mainScreen].bounds.size.width
@interface QYTabBarViewController ()
@property (nonatomic, strong)UIView *underView;
@end

@implementation QYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTabBar ];
    
    [self bindViewController];
    
    // Do any additional setup after loading the view.
}
-(void)bindViewController{
    UIViewController *firstVC = [[UIViewController alloc] init];
    firstVC.view.backgroundColor = [UIColor redColor];
    
    UIViewController *secondVC = [[UIViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor greenColor];
    
    UIViewController *thirdVC = [[UIViewController alloc] init];
    thirdVC.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *fourthVC = [[UIViewController alloc] init];
    fourthVC.view.backgroundColor = [UIColor orangeColor];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:firstVC,secondVC,thirdVC, fourthVC, nil];
    self.viewControllers = viewControllers;
}

-(void)setTabBar{
    UIImageView *bgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, QYScreenH-49, QYScreenW, 49)];
    [self.view addSubview:bgv];
    bgv.userInteractionEnabled = YES;
    UIImage *image = [UIImage imageNamed:@"tabButtonBackground"];
    UIImage *bgImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(21, 1, 21, 1) resizingMode:UIImageResizingModeStretch];
    
//    bgv.image = bgImage;

//    UIImage *image = [UIImage imageNamed:@""]
    CGFloat space = 20;
    CGFloat barItemW = 48;
    CGFloat barItemH = 38;
    CGFloat itemSpace = (QYScreenW - 4 * barItemW - 2 * space) / 3;
    
    for (int i = 0; i < 4; i++) {
        CGFloat barItemX = space + i * (barItemW + itemSpace);
        CGFloat barItemY = (bgv.frame.size.height - barItemH)/2;
        
        UIButton *barItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgv addSubview:barItem];
        barItem.frame = CGRectMake(barItemX, barItemY, barItemW, barItemH);
        NSString *imageName = [NSString stringWithFormat:@"%d",i+1];
        [barItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        //谁 调用 action
        [barItem addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        barItem.tag = i + 100;

    }
    CGFloat underViewW = 52;
    CGFloat underViewH = 42;
    
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, underViewW, underViewH)];
    [bgv insertSubview:underView atIndex:0];
    
    //设置中心点
    UIButton *btn = (UIButton *)[bgv viewWithTag:100];
    underView.center = btn.center;
    //设置underView的背景颜色
    underView.backgroundColor = [UIColor purpleColor];
    
    _underView = underView;
    
    
}
-(void)changeViewController:(UIButton *)sender{
    self.selectedIndex = sender.tag - 100;
    _underView.center = sender.center;
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
