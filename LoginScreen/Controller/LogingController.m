//
//  LogingController.m
//  LoginScreen
//
//  Created by Admin on 9/9/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

#import "LogingController.h"


@implementation LogingController

- (void)viewDidLoad{
    [super viewDidLoad];
    LoinginView *login = [[LoinginView alloc]init];
    self.view = login;
    login.delegate = self;
}
-(void)profileImageTaped{
    NSLog(@"profile image Taped...");
}
-(void)registrationButtonTapped:(NSString *)username :(NSString *)passWord{
    NSLog(@"%@",username);
    NSLog(@"%@",passWord);
}


@end
