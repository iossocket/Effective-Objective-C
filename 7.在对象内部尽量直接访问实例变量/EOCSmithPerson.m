//
// Created by Xueliang Zhu on 4/4/16.
// Copyright (c) 2016 Zhu Xueliang. All rights reserved.
//

#import "EOCSmithPerson.h"


@implementation EOCSmithPerson

- (void)setLastName:(NSString *)lastName {
    if (![lastName isEqualToString:@"Smith"]) {
        [NSException raise:NSInvalidArgumentException format:@"Last name must be Smith"];
    }
    self.lastName = lastName;
}

@end