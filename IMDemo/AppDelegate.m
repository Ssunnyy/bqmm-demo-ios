//
//  AppDelegate.m
//  IMDemo
//
//  Created by isan on 16/4/21.
//  Copyright © 2016年 siyanhui. All rights reserved.
//

#import "AppDelegate.h"
//Integrate BQMM
#import <BQMM/BQMM.h>

#import "MMChatViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //Integrate BQMM    initialize
    NSString *appId = @"yourAppId";
    NSString *secret = @"yourAppSecret";
    [[MMEmotionCentre defaultCentre] setAppId:appId
                                       secret:secret];
    [MMEmotionCentre defaultCentre].sdkMode = MMSDKModeIM;
    [MMEmotionCentre defaultCentre].sdkLanguage = MMLanguageEnglish;
    
    MMChatViewController *VC = [[MMChatViewController alloc] init];
    VC.title = @"chat view";
    UINavigationController *rootNavi = [[UINavigationController alloc] initWithRootViewController:VC];
    self.window.rootViewController = rootNavi;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    //Integrate BQMM
    [[MMEmotionCentre defaultCentre] clearSession];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
