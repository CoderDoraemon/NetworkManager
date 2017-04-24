//
//  AppDelegate.m
//  Camera360
//
//  Created by 文刂Rn on 2017/3/7.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "AppDelegate.h"
#import "LDTabBarController.h"
#import "LDLaunchViewManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[LDTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    [self launchAnimation];
    
    
    return YES;
}


- (void)launchAnimation {
    
    NSArray *urlArray = @[@"http://img.hb.aicdn.com/9f45c2aa7106e989045e0adc7c1ddc834dbecd6a2cfea-qSM9nb_fw658", @"http://img.hb.aicdn.com/a6279b6bdfb809725fb8f21c0e50b237b1855b25119cfe-UDfE0h_fw658", @"http://img.hb.aicdn.com/50931ac3a6ec0440a476a05a82eb444cfbd20def158fc3-7kr2mt_fw658", @"http://img.hb.aicdn.com/db24d10c105930149b2a838cdc3fbc7fce71537031c56-RwTp1Z_fw658", @"http://img.hb.aicdn.com/28e54c2073d1285f6c8284f40e5702b49ae3f9f111067c-eIw38V_fw658", @"http://img.hb.aicdn.com/75c4143d6208ee39e0008b1c508e37acdf88eac42c5d3-61Vtog_fw658", @"http://img.hb.aicdn.com/98d13cc2c90772dcee2487d85dd050c2168085e215dc93-v9yEPJ_fw658", @"http://img.hb.aicdn.com/56e6a9eb67863cd8a8bd9f84acdcb53f459bfbb51f393c-0ZsiIv_fw658", @"http://img.hb.aicdn.com/4cb25db79cf0178964e098d24ba44fb1fddb90e6b1911-m2ii0P_fw658", @"http://img.hb.aicdn.com/e35ac03caf3acb87f24787d8c81522f917985cd5bf0c6-Wjw9M9_fw658", @"http://img.hb.aicdn.com/3b55686afb69d5f4aaabbd370370f193303bbaa8f3f86-LUIIaW_fw658", @"http://s16.sinaimg.cn/large/005vePOgzy70Rd3a9pJdf&690"];
    
    int x = arc4random() % urlArray.count;
    
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    LDLaunchViewManager *launchController = [LDLaunchViewManager launchViewManger];
    LDAdModel *adModel=[[LDAdModel alloc] init];
    adModel.adDetailUrl=@"http://www.sina.com";
    adModel.launchUrl = urlArray[x];
    launchController.adModel= adModel;
    [launchController showView:rootViewController.view];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
