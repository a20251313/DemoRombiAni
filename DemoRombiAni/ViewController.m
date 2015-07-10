//
//  ViewController.m
//  DemoRombiAni
//
//  Created by jingfuran on 15/7/8.
//  Copyright (c) 2015年 jingfuran. All rights reserved.
//

#import "ViewController.h"
#import "JFTestView.h"

#define  radiusFromDgree(dgree) (M_PI/180*dgree)

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView    *m_scrollView;
    NSMutableArray  *m_viewArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (!m_viewArray)
    {
        m_viewArray = [[NSMutableArray alloc] init];
    }
    
    
    CGSize  size = [UIScreen mainScreen].bounds.size;
    if (m_scrollView == nil)
    {
        m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, size.width, size.height-64-20)];
        [self.view addSubview:m_scrollView];
        
        [m_scrollView setContentSize:CGSizeMake(size.width,m_scrollView.frame.size.height*2)];
        
        [m_scrollView setBackgroundColor:[UIColor lightGrayColor]];
         m_scrollView.delegate = self;
    }
    
    
    
    
    for (int i = 0;i < 10;i++)
    {
        JFTestView  *testView = [[[NSBundle mainBundle] loadNibNamed:@"JFTestView" owner:self options:nil] lastObject];
        [testView setFrame:CGRectMake(20, i, size.width-40, 200)];
        [m_viewArray addObject:testView];
        [m_scrollView addSubview:testView];
        
        CGFloat  fdreee = -65;
        
        CGFloat radius =  radiusFromDgree(fdreee);
        CATransform3D transform3d = CATransform3DIdentity;
        //  transform3d.m34 = 0.001;
        transform3d.m34 = -1.0/3000.0;
         transform3d = CATransform3DTranslate(transform3d, 0, 0, -(10-i)*30);

         transform3d.m42 = i*40;    //y平移
        
        //  transform3d.m34 = radius;   //旋转角度
          transform3d = CATransform3DRotate(transform3d,radius,1,0, 0);
        // transform3d = CATransform3DRotate(transform3d,radiusFromDgree(-5),1,0,0);
        // transform3d = CATransform3DRotate(transform3d, radius, 0,1, 0);
        
            switch (i%6) {
                case 0:
                    [testView setBackgroundColor:[UIColor whiteColor]];
                    break;
                case 1:
                    [testView setBackgroundColor:[UIColor redColor]];
                    break;
                case 2:
                    [testView setBackgroundColor:[UIColor brownColor]];
                    break;
                case 3:
                    [testView setBackgroundColor:[UIColor yellowColor]];
                    break;
                case 4:
                    [testView setBackgroundColor:[UIColor orangeColor]];
                    break;
                case 5:
                    [testView setBackgroundColor:[UIColor magentaColor]];
                    break;
                case 6:
                    [testView setBackgroundColor:[UIColor purpleColor]];
                    break;
                    
                default:
                    break;
            }
            
        
        
//        CATransform3D  tra = CATransform3DMakeTranslation(1, i*140, 1);
//         tra.m34 = 0.0018;
//         tra = CATransform3DRotate(tra, radius, 1, 0, 0);
        
        
//        CATransform3D  tra = CATransform3DIdentity;
//        // tra.m34 = 0.001;
//        tra = CATransform3DRotate(tra, radius, 1, 0, 0);

        
       
        CALayer  *layer = [testView layer];
      
        layer.transform =  transform3d;//CATransform3DMakeTranslation(1, 1, i*100);
        
    }
    
    
     [m_scrollView setContentSize:CGSizeMake(size.width,m_viewArray.count*140+60)];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll:%@",scrollView);
    
    CGPoint  point = scrollView.contentOffset;
    CGFloat  fwidth = 140;
    CGFloat  fyorigin = point.y;
    if (fyorigin < 0)
    {
        fyorigin = 0;
    }
    
    NSInteger  index = (int)fyorigin%(int)fwidth;
    
    if (index >= m_viewArray.count-1)
    {
        
    }else
    {
        /*
        [UIView animateWithDuration:0.25 animations:^{
            
            CGFloat  fmaxindex = index;
            static int trans = 0;
            trans = 0;
            for (int i = 0;i <= index;i++)
            {
                JFTestView  *testView = m_viewArray[i];
                trans += -(i*4);
                //  tra = CATransform3DScale(tra, 1, 1, 1-fmaxindex*0.01);
                testView.layer.transform = [self transform3DWithIndex:trans];
                fmaxindex--;
            }
        
        }];
   */
        
    }
   
    
    
    
}


//-(void)testLayer
//{
//    CATransform3D transform = CATransform3DIdentity;
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:0.5]; //设置动画运行时长
//    [CATransaction setCompletionBlock:nil]; //完成后执行的动作
//                                            // [subViewIn.layer addAnimation:nil forKey:@"cubeIn"]; //在层里加入动画，系统会自动将他开始
//    [CATransaction commit];
//}

-(CATransform3D)transform3DWithIndex:(NSInteger)index
{
    CGFloat  fdreee = 90;
    //CGSize  size = [UIScreen mainScreen].bounds.size;
    CGFloat radius = radiusFromDgree(fdreee);
    CATransform3D  tra = CATransform3DIdentity;
    tra.m34 = 0.001;
    tra = CATransform3DRotate(tra, radius, 1, 0, 0);
    
    tra = CATransform3DTranslate(tra, 0, 0, index);
    
    return tra;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
}
// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    
}

@end
