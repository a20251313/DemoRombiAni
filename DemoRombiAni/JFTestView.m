//
//  JFTestView.m
//  DemoRombiAni
//
//  Created by jingfuran on 15/7/8.
//  Copyright (c) 2015年 jingfuran. All rights reserved.
//

#import "JFTestView.h"

@interface JFTestView ()
{
    
}

@end


@implementation JFTestView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)clickMe:(id)sender {
    NSLog(@"clickMe:%@",sender);
}

@end
