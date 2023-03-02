//
//  RANDOM.m
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#import <Foundation/Foundation.h>
#import "RANDOM.h"
@implementation RANDOM

- (NSString*)RANDOM{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomHexString = [NSMutableString stringWithCapacity: 8];
    for (int i=0; i<8; i++) {
        [randomHexString appendString:[NSString stringWithFormat:@"%x", [letters characterAtIndex: arc4random_uniform((int)[letters length])]]];
    }
    return randomHexString;
    // resolve(randomHexString); //asked
}

@end
