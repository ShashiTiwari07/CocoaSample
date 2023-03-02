//
//  TRUST.m
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#import <Foundation/Foundation.h>
#import "TRUST.h"
#import "UpiHelper.h"


@implementation TRUST

- (NSString*)generateTrustCred:(NSString*)trust npciToken:(NSString*)token random:(NSString*)randomString {
//    NSString* str = @"teststring";
//    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
//    NSData *decodedToken = [[NSData alloc] initWithBase64EncodedString:token options:0];
    NSData* decodedToken = [token dataUsingEncoding:NSUTF8StringEncoding];
    NSString *decodedTokenString = [[NSString alloc] initWithData:decodedToken encoding:NSUTF8StringEncoding];
    //[NSData dataWithBytes: &decodedToken length:sizeof(decodedToken)]; //[[NSString alloc] initWithData:decodedToken encoding:NSUTF8StringEncoding];
    
    NSError *error;
    
    NSData *trustBlockData =
    
    [UpiHelper encryptWithA256GCM:[trust dataUsingEncoding:NSUTF8StringEncoding] ivString:randomString
                              key:[decodedTokenString dataUsingEncoding:NSUTF8StringEncoding]
                              aad:[NSData new] error:&error];
    
    NSString *trustBlock = [trustBlockData base64EncodedStringWithOptions:0]; // base64EncodingWithLineLength // asked
    
    return trustBlock.length > 0 ? trustBlock : @"";
    
}

@end

// base64EncodedStringWithOptions
