//
// Created by Xueliang Zhu on 4/4/16.
// Copyright (c) 2016 Zhu Xueliang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface EOCPerson : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

- (instancetype)initWithFirstName: (NSString *)firstName lastName: (NSString *)lastName;
- (NSString *)fullName;
- (void)setFullName: (NSString *)fullName;
@end