//
//  ContainerView.m
//  LoginScreen
//
//  Created by Admin on 9/9/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

#import "LoinginView.h"
@interface LoinginView()
@property (strong ,nonatomic) UIView *ContainerView;
@property (strong,nonatomic) UILabel *WelcomeLabel;
@property (strong,nonatomic) UIImageView *ProfileImage;
@property (strong,nonatomic) UITextField *userNameTextField;
@property (strong,nonatomic) UITextField *passWordTextField;
@property (strong,nonatomic) UIButton *registerationButton;
@property (strong,nonatomic) UIScrollView *scroll;
@property (strong,nonatomic) UITapGestureRecognizer *profileImageTapGesture;
@end

@implementation LoinginView


-(id)init{
    
    self = [super init];
    if (self) {
        CGRect viewRect = [[UIScreen mainScreen]bounds];
        self.frame = viewRect;
        self.backgroundColor = UIColor.whiteColor;
        [self setTranslatesAutoresizingMaskIntoConstraints:false];
        [self setUpUI];
        [self setUpUIConstraint];
        [self setUpTapGestureRecognizer];
    }
    return self;
    
}
-(void) setUpTapGestureRecognizer{
    _profileImageTapGesture =[[UITapGestureRecognizer alloc]initWithTarget:_delegate action:@selector(passProfileImage)];
    [_ProfileImage addGestureRecognizer:_profileImageTapGesture];
}

-(void)setUpUI{
    _scroll = ^UIScrollView*{
        UIScrollView* scrol = [UIScrollView new];
        [scrol setTranslatesAutoresizingMaskIntoConstraints:false];
        return scrol;
    }();
    
    _ContainerView = ^UIView*{
        UIView *view = [UIView new];
        [view setBackgroundColor:UIColor.whiteColor];
        [view setTranslatesAutoresizingMaskIntoConstraints:false];
        return view;
    }();
    
    
    _WelcomeLabel = ^UILabel*{
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [label setTranslatesAutoresizingMaskIntoConstraints:false];
        [label setText:@"welcome to Registration "];
        [label setFont: [UIFont systemFontOfSize:30]];
        [label setTextColor:UIColor.blueColor];
        return label;
    }();
    
    _ProfileImage = ^UIImageView*{
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectZero];
        [image setTranslatesAutoresizingMaskIntoConstraints:false];
        [image setBackgroundColor:UIColor.blackColor];
        [image.layer setCornerRadius:50];
        return image;
    }();
    
    _userNameTextField = ^UITextField*{
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectZero];
        [text setBackgroundColor:UIColor.lightGrayColor];
        [text setTextAlignment:NSTextAlignmentCenter];
        [text setTranslatesAutoresizingMaskIntoConstraints:false];
        [text setPlaceholder:@"user name"];
        return text;
    }();
    
    _passWordTextField = ^UITextField*{
        UITextField *text = [[UITextField alloc]initWithFrame:CGRectZero];
        [text setTranslatesAutoresizingMaskIntoConstraints:false];
        [text setTextAlignment:NSTextAlignmentCenter];
        [text setBackgroundColor:UIColor.lightGrayColor];

        [text setSecureTextEntry:true];
        [text setPlaceholder:@"passWord"];
        return text;
    }();
    
    _registerationButton = ^UIButton*{
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"register" forState:UIControlStateNormal];
        [button setTranslatesAutoresizingMaskIntoConstraints:false];
        [button setBackgroundColor:UIColor.blackColor];
        [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [button.layer setCornerRadius:5];
        [button addTarget:self->_delegate action:@selector(passUserNameAndPassWord) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }();
    
    
    [self addSubview:_scroll];
    [_scroll addSubview:_ContainerView];
    [_ContainerView addSubview:_WelcomeLabel];
    [_ContainerView addSubview:_ProfileImage];
    [_ContainerView addSubview:_userNameTextField];
    [_ContainerView addSubview:_passWordTextField];
    [_ContainerView addSubview:_registerationButton];
}
-(void)setUpUIConstraint{
    [self setUpContainerViewConstraint];
    [self setUpWelcomeLabelConstriant];
    [self setUpProfileImageConstraint];
    [self setUpUserNameConstraint];
    [self setUpPassWordConstraint];
   [self setUpRegistrationButtonConstraint];
}
//Mark:-
-(void)setUpContainerViewConstraint{
    
    [NSLayoutConstraint activateConstraints:@[
        [_scroll.topAnchor constraintEqualToAnchor:self.topAnchor],
        [_scroll.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [_scroll.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0],
        [_scroll.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0]
       ]];
    
    [NSLayoutConstraint activateConstraints:@[
      [_ContainerView.topAnchor constraintEqualToAnchor:_scroll.topAnchor],
      [_ContainerView.leadingAnchor constraintEqualToAnchor:_scroll.leadingAnchor constant:0],
      [_ContainerView.trailingAnchor constraintEqualToAnchor:_scroll.trailingAnchor constant:0],
      [_ContainerView.centerYAnchor constraintEqualToAnchor:_scroll.centerYAnchor],
      [_ContainerView.centerXAnchor constraintEqualToAnchor:_scroll.centerXAnchor],
      [_ContainerView.bottomAnchor constraintEqualToAnchor:_scroll.bottomAnchor constant:0]
      ]];
    
}
-(void)setUpWelcomeLabelConstriant{
    
    [NSLayoutConstraint activateConstraints: @[
       [_WelcomeLabel.topAnchor constraintEqualToAnchor:_ContainerView.safeAreaLayoutGuide.topAnchor constant:10],
       [_WelcomeLabel.centerXAnchor constraintEqualToAnchor:_ContainerView.centerXAnchor ],
       ]];
}
-(void)setUpProfileImageConstraint{
    [NSLayoutConstraint activateConstraints: @[
       [_ProfileImage.centerXAnchor constraintEqualToAnchor:_ContainerView.centerXAnchor],
       [_ProfileImage.topAnchor constraintEqualToAnchor:_WelcomeLabel.bottomAnchor constant:10],
       [_ProfileImage.widthAnchor constraintEqualToConstant:100],
       [_ProfileImage.heightAnchor constraintEqualToConstant:100]
       ]];
}
-(void)setUpUserNameConstraint{
    [NSLayoutConstraint activateConstraints: @[
   [_userNameTextField.centerXAnchor constraintEqualToAnchor:_ContainerView.centerXAnchor],
   [_userNameTextField.topAnchor constraintEqualToAnchor:_ProfileImage.bottomAnchor  constant:10] ,
   [_userNameTextField.leadingAnchor constraintEqualToAnchor:_ContainerView.leadingAnchor constant:10],
   [_userNameTextField.trailingAnchor constraintEqualToAnchor:_ContainerView.trailingAnchor constant:-10],
   [_userNameTextField.heightAnchor constraintEqualToConstant:50]
   ]];
}
-(void)setUpPassWordConstraint{
    [NSLayoutConstraint activateConstraints: @[
     [_passWordTextField.topAnchor constraintEqualToAnchor:_userNameTextField.bottomAnchor constant:10],
     [_passWordTextField.centerXAnchor constraintEqualToAnchor:_ContainerView.centerXAnchor constant:0],
     [_passWordTextField.leadingAnchor constraintEqualToAnchor:_ContainerView.leadingAnchor constant:10],
     [_passWordTextField.trailingAnchor constraintEqualToAnchor:_ContainerView.trailingAnchor constant:-10],
     [_passWordTextField.heightAnchor constraintEqualToConstant:50]
                                               ]];
}
-(void)setUpRegistrationButtonConstraint{
    [NSLayoutConstraint activateConstraints:@[
     [_registerationButton.topAnchor constraintEqualToAnchor:_passWordTextField.bottomAnchor constant:10],
     [_registerationButton.centerXAnchor constraintEqualToAnchor:_ContainerView.centerXAnchor],
     [_registerationButton.widthAnchor constraintEqualToAnchor:_ContainerView.widthAnchor multiplier:0.5],
     [_registerationButton.heightAnchor constraintEqualToConstant:50]
    
     ]];
}
-(void)passUserNameAndPassWord{
    [ _delegate registrationButtonTapped:_userNameTextField.text :_passWordTextField.text ];
}
-(void)passProfileImage{
    [_delegate profileImageTaped];
}
@end
