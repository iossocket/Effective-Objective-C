//
// Created by Xueliang Zhu on 4/4/16.
// Copyright (c) 2016 Zhu Xueliang. All rights reserved.
//

#import "EOCPerson.h"


@implementation EOCPerson

- (instancetype) init {
    if (self = [super init]) {
        self.firstName = @"";
        self.lastName = @"";
    }
    return self;
}

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    if (self = [super init]) {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

- (void)setFullName:(NSString *)fullName {
    NSArray *components = [fullName componentsSeparatedByString:@" "];
    self.firstName = components[0];
    self.lastName = components[1];
}

@end