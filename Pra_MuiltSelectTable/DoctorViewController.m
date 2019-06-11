//
//  DoctorViewController.m
//  Pra_MuiltSelectTable
//
//  Created by StarSky_MacBook Pro on 2019/6/9.
//  Copyright © 2019 StarSky_MacBook Pro. All rights reserved.
//

#import "DoctorViewController.h"

@interface DoctorViewController () <UIScrollViewDelegate>
@property(nonatomic, strong) NSArray *titlelist;
@property (weak, nonatomic) IBOutlet UIScrollView *titleArray;
@property (weak, nonatomic) IBOutlet UIScrollView *contentArray;

@end

@implementation DoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"DoctorViewController");
    // Do any additional setup after loading the view.
    //增加搜索框以及设置
    //[self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];//隐藏navigationBar下边的横线
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];//设置透明背景
    //_contentArray.frame = CGRectMake(0, 0, 0, 0);
    
    _titleArray.backgroundColor = [UIColor blueColor];
    
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width * 0.80,38)];
    searchBar.placeholder = @"输入疾病/症状/医生";
    UITextField * searchField = [searchBar valueForKey:@"_searchField"];
    //[searchField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
    [searchField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];

    UIView* barView = [[UIView alloc] initWithFrame:CGRectMake(0,0,UIScreen.mainScreen.bounds.size.width * 0.80,38)];
    [barView addSubview:searchBar];
    self.navigationItem.titleView = barView;
    
    _titlelist = @[@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题4",@"标题3",@"标题2",@"标题1"];
    [self addButton];
}

-(void) addButton{
    
    NSLog(@"%f,%f",_contentArray.frame.size.width, _contentArray.frame.size.height);
    
    float offset = 0.0;
    //float old_position = 0.0;
    float offset_content = 0.0;
    int FLAG_tag = 1;
    for (NSString* title in _titlelist) {
        NSLog(@"addButton%@", title);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:CGRectMake(offset, 0, [self getWidthWithTitle:title font:[UIFont systemFontOfSize:18]], _titleArray.frame.size.height)];
        [button setTitle:title forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor blackColor]
                     forState:(UIControlStateNormal)];
        [button setTitle:@"测试" forState:(UIControlStateSelected)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(testClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = FLAG_tag;
        [button setTitle:@"测试" forState:(UIControlStateHighlighted)];
        FLAG_tag++;
        [_titleArray addSubview:button];
        
        //old_position = offset;
        offset += [self getWidthWithTitle:title font:[UIFont systemFontOfSize:18]] + 5;
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(offset_content, 0, _contentArray.frame.size.width, _contentArray.frame.size.height)];
        view.backgroundColor = [UIColor greenColor];
        offset_content += _contentArray.frame.size.width + 5;
        [_contentArray addSubview:view];
        
        
    }
    _contentArray.contentSize = CGSizeMake(offset_content, _contentArray.frame.size.height);
    _titleArray.contentSize = CGSizeMake(offset, _titleArray.frame.size.height);
}

#pragma 文字自适应宽度
- (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"%f",scrollView.contentOffset.x);


}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndDecelerating");
    if (scrollView.tag == 12) {
            [scrollView setContentOffset:CGPointMake(     floorf((float)scrollView.contentOffset.x / _contentArray.frame.size.width) * (_contentArray.frame.size.width+5) , scrollView.contentOffset.y) animated:YES];
    }
    //[scrollView setContentOffset:CGPointMake(0, 500) animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollViewDidEndDragging");

    if (scrollView.tag == 12 ) {
        [scrollView setContentOffset:CGPointMake(     floorf((float)scrollView.contentOffset.x / _contentArray.frame.size.width) * (_contentArray.frame.size.width+5) , scrollView.contentOffset.y) animated:YES];
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewDidEndScrollingAnimation");
    
    //UIButton* selecyBtn = (UIButton*)[_titleArray viewWithTag:(int)floorf((float)scrollView.contentOffset.x / _contentArray.frame.size.width)];
    //[selecyBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    // 有效的动画方法为：
    //    - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated 方法
    //    - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated 方法
}

-(void)testClick:(id) sender{
    UIButton *button = (UIButton *)sender;
    NSLog(@"testClick:%ld",(long)button.tag);
    
//    for (UIScrollView* temp in [self.view subviews]) {
//        if (temp.tag == 2 ) {
//            [temp setContentOffset:CGPointMake( button.tag * (_contentArray.frame.size.width+5) , temp.contentOffset.y) animated:YES];
//        }
//    }
    
    UIScrollView* contentView = [self.view viewWithTag:12];
    [contentView setContentOffset:CGPointMake( button.tag * (_contentArray.frame.size.width+5) , contentView.contentOffset.y) animated:YES];
    
    
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
