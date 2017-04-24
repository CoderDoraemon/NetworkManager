//
//  LDTabBarController.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 LD. All rights reserved.
//

#import "LDTabBarController.h"
#import "LDNavigationController.h"
#import "LDHomePageController.h"
#import "LDPlazaController.h"
#import "LDMessageController.h"
#import "LDMyController.h"
#import "LDTabBar.h"
#import "LDLaunchViewManager.h"

@interface LDTabBarController ()

/** <#Description#> */
@property (nonatomic, strong) NSArray *urlArray;


@end

@implementation LDTabBarController

+ (void)load {
    
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    [tabBarAppearance setShadowImage:[[UIImage alloc] init]];
    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabBar_bg"]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.urlArray = @[@"http://img.hb.aicdn.com/9f45c2aa7106e989045e0adc7c1ddc834dbecd6a2cfea-qSM9nb_fw658", @"http://img.hb.aicdn.com/a6279b6bdfb809725fb8f21c0e50b237b1855b25119cfe-UDfE0h_fw658", @"http://img.hb.aicdn.com/50931ac3a6ec0440a476a05a82eb444cfbd20def158fc3-7kr2mt_fw658", @"http://img.hb.aicdn.com/db24d10c105930149b2a838cdc3fbc7fce71537031c56-RwTp1Z_fw658", @"http://img.hb.aicdn.com/28e54c2073d1285f6c8284f40e5702b49ae3f9f111067c-eIw38V_fw658", @"http://img.hb.aicdn.com/75c4143d6208ee39e0008b1c508e37acdf88eac42c5d3-61Vtog_fw658", @"http://img.hb.aicdn.com/98d13cc2c90772dcee2487d85dd050c2168085e215dc93-v9yEPJ_fw658", @"http://img.hb.aicdn.com/56e6a9eb67863cd8a8bd9f84acdcb53f459bfbb51f393c-0ZsiIv_fw658", @"http://img.hb.aicdn.com/4cb25db79cf0178964e098d24ba44fb1fddb90e6b1911-m2ii0P_fw658", @"http://img.hb.aicdn.com/e35ac03caf3acb87f24787d8c81522f917985cd5bf0c6-Wjw9M9_fw658", @"http://img.hb.aicdn.com/3b55686afb69d5f4aaabbd370370f193303bbaa8f3f86-LUIIaW_fw658", @"http://s16.sinaimg.cn/large/005vePOgzy70Rd3a9pJdf&690"];
    
    [self setup];
    
    
}

- (void)setup {
    
    [self setupControllers];
    
    //替换系统tabbar
    [self setValue:[[LDTabBar alloc] init] forKeyPath:@"tabBar"];
    
}

//初始化子控制器
-(void)setupControllers {
    
    [self setupController:[[LDHomePageController alloc]init] image:@"pc_tabBar_home" selectedImage:@"pc_tabBar_home_selected" title:@"首页"];
    [self setupController:[[LDPlazaController alloc]init] image:@"pc_tabBar_explore" selectedImage:@"pc_tabBar_explore_selected" title:@"广场"];
    [self setupController:[[LDMessageController alloc]init] image:@"pc_tabBar_message" selectedImage:@"pc_tabBar_message_selected" title:@"消息"];
    [self setupController:[[LDMyController alloc]init] image:@"pc_tabBar_user"  selectedImage:@"pc_tabBar_user_selected" title:@"我的"];
    
    
}

//设置控制器
-(void)setupController:(UIViewController *)childVc image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title {
    
    UIViewController *viewVc = childVc;
    viewVc.tabBarItem.image = [UIImage imageNamed:image];
    viewVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    viewVc.tabBarItem.title = title;
    LDNavigationController *navi = [[LDNavigationController alloc]initWithRootViewController:viewVc];
    [self addChildViewController:navi];
    
}

#pragma mark - Private Methods
- (void)launchAnimation {
    
    int x = arc4random() % self.urlArray.count;
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    LDLaunchViewManager *launchController = [LDLaunchViewManager launchViewManger];
    LDAdModel *adModel=[[LDAdModel alloc] init];
    adModel.adDetailUrl=@"http://www.sina.com";
    adModel.launchUrl = self.urlArray[x];
    launchController.adModel= adModel;
    [launchController showView:rootViewController.view];
    
//    //这一步是获取上次网络请求下来的图片，如果存在就展示该图片，如果不存在就展示本地保存的名为test的图片
//    NSMutableData * data = [[NSUserDefaults standardUserDefaults]objectForKey:@"imageu"];
//    if (data.length>0) {
//        Imageview.image = [UIImage imageWithData:data];
//    }else{
//        
//        Imageview.image = [UIImage imageNamed:@"test_image"];
//    }
//    
//    [self.view addSubview:launchView];
//    
//    int x = arc4random() % self.urlArray.count;
//    
//    //下面这段代码，是调用AFN下载文件的方法，异步
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    NSURL *URL = [NSURL URLWithString:self.urlArray[x]];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//        
//        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
//        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
//    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//        NSLog(@"File downloaded to: %@", filePath);
//        
//        NSData * image = [NSData dataWithContentsOfURL:filePath];
//        [[NSUserDefaults standardUserDefaults]setObject:image forKey:@"imageu"];
//        
//        
//    }];
//    [downloadTask resume];
  
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"imageu"] == nil) {
//        
//        [UIView animateWithDuration:0.5 animations:^{
//            launchView.alpha = 0.0f;
//        } completion:^(BOOL finished) {
//            [launchView removeFromSuperview];
//        }];
//        
//        return;
//    }
//    
//    [UIView animateWithDuration:2.0f delay:3.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//
//        launchView.alpha = 0.0f;
//        
//    } completion:^(BOOL finished) {
//
//        [launchView removeFromSuperview];
//        
//    }];
    
    //这段代码，可以实现第二张图片有3D的动画效果，动画结束后，进行同步的网络请求，请求的是广告页图片
//    [UIView animateWithDuration:4.0f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState animations:^{
//        
//        launchView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.5f, 1.5f, 1.0f);
//        
//        
//    } completion:^(BOOL finished) {
//        
//        //        NSString * ad_imgUrl  = @"http://www.uimaker.com/uploads/allimg/121217/1_121217093327_1.jpg";
//        //        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        //        [BBLaunchAdMonitor showAdAtPath:ad_imgUrl
//        //                                 onView:appDelegate.window.rootViewController.view
//        //                           timeInterval:5
//        //                       detailParameters:@{@"carId":@(12345), @"name":@"奥迪-品质生活"}];
//        
//        [UIView animateWithDuration:1.0 animations:^{
//            launchView.alpha = 0.0f;
//        } completion:^(BOOL finished) {
//            [launchView removeFromSuperview];
//        }];
//        
//    }];
}

@end
