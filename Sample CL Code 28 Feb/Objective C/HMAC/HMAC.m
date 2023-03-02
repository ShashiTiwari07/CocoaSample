//
//  HMAC.m
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#import <Foundation/Foundation.h>
#import "HMAC.h"
#import "UpiHelper.h"
#import <UIKit/UIKit.h>
#import "SHA256.h"

@implementation HMAC

//@synthesize randomString;

//_randomString = @"BfwLGpFv/owHdzBM"; // Sample random string


- (NSString*)populateHMAC:(NSString*)appId :(NSString*)mobileNumber :(NSString*)token :(NSString*)deviceId :(NSString*)randomString {
    NSString *hmac = @"";
    NSString *message = [NSString stringWithFormat:@"%@|%@|%@", appId, mobileNumber, deviceId];
//    NSData *decodedToken = [[NSData alloc] initWithBase64EncodedString:token options:0];
    NSData* decodedToken = [token dataUsingEncoding:NSUTF8StringEncoding];
    NSString *decodedTokenString = [[NSString alloc] initWithData:decodedToken encoding:NSUTF8StringEncoding];
    NSError *error;
    NSData *hmacData = [UpiHelper encryptWithA256GCM:[[UpiHelper sha256:message] dataUsingEncoding:NSUTF8StringEncoding]
                                            ivString:randomString
                                                 key:[decodedTokenString dataUsingEncoding:NSUTF8StringEncoding]
                                                 aad:[NSData new] error:&error];
    if (hmacData) {
        hmac = [hmacData base64EncodedStringWithOptions:0]; }
    return hmac.length>0?hmac:@"";
}

@end
