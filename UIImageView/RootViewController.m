//
//  RootViewController.m
//  UIImageView
//
//  Created by apple on 14-8-16.
//  Copyright (c) 2014年 Fhj. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //多张动画显示
    NSMutableArray * imageviewArray=[NSMutableArray arrayWithCapacity:1];
    for(int i=1;i<5;i++)
    {
        NSString * filename=[NSString stringWithFormat:@"%d.tiff",i];
        UIImage * aimage=[UIImage imageNamed:filename];
        [imageviewArray addObject:aimage];
    }
    _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 300, 300)];
    //控制速度，在2秒内播放完这几张图片
    _imageview.animationDuration=1.0;
    _imageview.animationImages=imageviewArray;
    [self.view addSubview:_imageview];
    [_imageview release];
   
   
    
    [_imageview setUserInteractionEnabled:YES];
 
    [_imageview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCategory)]];
  
    
//    单张显示
//    UIImage  * aimage=[UIImage imageNamed:@"1.tiff"];
//    UIImageView *aview=[[UIImageView alloc]initWithImage:aimage];
//    [self.view addSubview:aview];
    
    //显示faster的标签
    UILabel * aLable=[[UILabel alloc]initWithFrame:CGRectMake(20, 350, 40, 34)];
    [self.view addSubview:aLable];
    aLable.backgroundColor=[UIColor greenColor];
    [aLable setText:@"faster"];
    [aLable release];
    
    //Siider
    UISlider* aSlider=[[UISlider alloc]initWithFrame:CGRectMake(56, 350, 200, 34)];
    //调用方法
    [aSlider addTarget:self action:@selector(voidSlider:) forControlEvents:(UIControlEventValueChanged)];
    aSlider.minimumValue=0;
    aSlider.maximumValue=3;
    [self.view addSubview:aSlider];
    [aSlider release];
    
    //显示slow的标签
    UILabel * bLable=[[UILabel alloc]initWithFrame:CGRectMake(258, 350, 40, 34)];
    [self.view addSubview:bLable];
    bLable.backgroundColor=[UIColor greenColor];
    [bLable setText:@"slow"];
    [bLable release];
    // Do any additional setup after loading the view.
}


-(void)clickCategory
{
    NSLog(@"jhakjhdkjhd");
  [_imageview startAnimating];
}
-(void)voidSlider:(UISlider *)slider
{
    _imageview.animationDuration=slider.value;
    _imageview.startAnimating;
    NSLog(@"value=%f",slider.value);
    
    //显示当前速度的标签
    UILabel * cLable=[[UILabel alloc]initWithFrame:CGRectMake(80, 390, 150, 34)];
    [self.view addSubview:cLable];
    cLable.backgroundColor=[UIColor greenColor];
    //将float类型转换成strring类型
    NSString *s=[NSString stringWithFormat:@"speeder=%f",slider.value];
    cLable.text= s;
    [cLable release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
