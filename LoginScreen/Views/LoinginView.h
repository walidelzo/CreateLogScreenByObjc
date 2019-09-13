//
//  ContainerView.h
//  LoginScreen
//
//  Created by Admin on 9/9/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterationUserNameAndPassWorDelegate <NSObject>
-(void)profileImageTaped;
-(void)registrationButtonTapped :(NSString*)username :(NSString*)passWord;
@end

@interface LoinginView : UIView
@property(weak,nonatomic) id <RegisterationUserNameAndPassWorDelegate>delegate  ;
@end
NS_ASSUME_NONNULL_END
