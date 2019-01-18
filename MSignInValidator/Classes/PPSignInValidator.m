//
//  PPLoginValidator.m
//  PatPat
//
//  Created by Bruce He on 15/9/10.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import "PPSignInValidator.h"
#import "PPLocalizedStringHeader.h"
#import "PPHUDView.h"

#define kPasswordMinLength 6

@implementation PPSignInValidator

+ (BOOL)checkFirstName:(NSString *)firstName
{
    if (firstName.length<1) {
        [self showFailView:PPString(SIGNUP_PROVIDEFIRSTNAMEINFO)];
        return NO;
    }
    return YES;
}

+ (BOOL)checkLastName:(NSString *)lastName
{
    if (lastName.length<1) {
        [self showFailView:PPString(SIGNUP_PROVIDELASTNAMEINFO)];
        return NO;
    }
    return YES;
}

+ (BOOL)checkPassword:(NSString *)password
{
    if (password.length<kPasswordMinLength) {
        [self showFailView:PPString(SIGNUP_ENTERPASSWORDLIMIT)];
        return NO;
    }
    return YES;
}

+ (BOOL)checkEmail:(NSString *)email
{
    if (email.length<1 || ![self isEmail:email]) {
        [self showFailView:PPString(SIGNUP_ENTEREMAILADDRESS)];
        return NO;
    }
    return YES;
}

+ (void)showFailView:(NSString*)tips
{
    PPHUDView *hud = [PPHUDView showTo:[UIApplication sharedApplication].keyWindow];
    hud.mode = MBProgressHUDModeText;
    [hud showTips:tips image:@"show_fail"];
    [hud hide:YES afterDelay:1.2];
}

+ (BOOL)checkCode:(NSString *)code
{
    if (code.length<1) {
        [self showFailView:PPString(LOGININ_ENTERVERIFYCODE)];
        return NO;
    }
    return YES;
}

+ (BOOL)isEmail:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailPredicate evaluateWithObject:self];
}

@end
