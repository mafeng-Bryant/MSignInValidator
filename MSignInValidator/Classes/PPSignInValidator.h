//
//  PPLoginValidator.h
//  PatPat
//
//  Created by Bruce He on 15/9/10.
//  Copyright (c) 2015年 http://www.patpat.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPSignInValidator : NSObject

+ (BOOL)checkFirstName:(NSString *)firstName;

+ (BOOL)checkLastName:(NSString *)lastName;

+ (BOOL)checkEmail:(NSString *)email;

+ (BOOL)checkPassword:(NSString *)password;

+ (BOOL)checkCode:(NSString *)code;

@end
