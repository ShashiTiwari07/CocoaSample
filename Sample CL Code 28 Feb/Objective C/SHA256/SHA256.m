//
//  SHA256.m
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#import <Foundation/Foundation.h>
#import "SHA256.h"
//#import <CommonCrypto/CommonDigest.h>
#import "UpiHelper.h"


@implementation SHA256


+ (NSString*) sha256:(NSString *)key
{
    const char *cstr = [key cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:key.length];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    // This is an iOS5-specific method.
    // It takes in the data, how much data, and then output format, which in this case is an int array.
    CC_SHA256(data.bytes, (int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    // Parse through the CC_SHA256 results (stored inside of digest[]).
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++)
    {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
    
}


@end
