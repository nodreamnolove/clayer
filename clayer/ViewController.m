//
//  ViewController.m
//  clayer
//
//  Created by mac on 15/3/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mypic;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGSize size = CGSizeMake(200, 200);
   
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    
    [[UIColor whiteColor] set];
    CGContextAddArc(ctr, 100, 100, 100, 0, M_PI*2, 0);
    CGContextFillPath(ctr);
    
  //  [[UIColor redColor] set];
    CGContextAddArc(ctr, 100, 100, 96, 0, M_PI*2, 0);
  //  CGContextFillPath(ctr);
    
    CGContextClip(ctr);
    
    UIImage *oldimage = [UIImage imageNamed:@"mypic"];
    CGRect rect = CGRectMake(2, 2, 196, 196);
    [oldimage drawInRect:rect];
    
    
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData * data = UIImagePNGRepresentation(newimage);
    
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"my.jpg"];
    NSLog(@"%@",path);
    [data writeToFile:path atomically:YES];
    
    self.mypic.image = newimage;
}

-(void)test
{
    UIImage *oldimage = [UIImage imageNamed:@"mypic"];
    
    CGSize size = CGSizeMake(200, 200);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    CGContextRef  ctx = UIGraphicsGetCurrentContext();
    
    CGRect cirRect = CGRectMake(0, 0, 200, 200);
    
    CGContextAddEllipseInRect(ctx, cirRect);
    
    CGContextClip(ctx);
    
    [oldimage drawInRect:cirRect];
    
    UIImage * newimage =  UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSData * data = UIImagePNGRepresentation(newimage);
    
    NSString * path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"my.jpg"];
    NSLog(@"%@",path);
    [data writeToFile:path atomically:YES];
    
    self.mypic.image = newimage;
}



@end
