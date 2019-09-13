//
//  AppDelegate.h
//  LoginScreen
//
//  Created by Admin on 9/9/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Controller/LogingController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong ,nonatomic) LogingController *loginVC;
@end

