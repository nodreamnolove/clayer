//
//  ViewController.m
//  clayer
//
//  Created by mac on 15/3/15.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)jieping:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *mypic;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
}
-(void)testmy
{
    CGSize size = CGSizeMake(200, 200);
    
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    
    [[UIColor whiteColor] set];
    CGContextAddArc(ctr, 100, 100, 100, 0, M_PI*2, 0);
    CGContextFillPath(ctr);
    
    CGContextAddArc(ctr, 100, 100, 96, 0, M_PI*2, 0);
    
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



- (IBAction)jieping:(id)sender {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
    
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    NSData *data = UIImagePNGRepresentation(newimage);
    UIGraphicsEndImageContext();
    
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"jietu.jpg"];
    NSLog(@"%@",path);
    
    [data writeToFile:path atomically:YES];
    
    });
    
}
@end
