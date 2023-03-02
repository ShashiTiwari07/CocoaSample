//
//  UpiHelper.m
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#import <Foundation/Foundation.h>
#import "UpiHelper.h"



@implementation UpiHelper

+ (NSString*) HMACWithSecret:(NSString*) secret andData:(NSString*)data {
    CCHmacContext ctx;
    const char *key = [secret UTF8String];
    const char *str = [data UTF8String];
    unsigned char mac[CC_MD5_DIGEST_LENGTH];
    char hexmac[2 * CC_MD5_DIGEST_LENGTH + 1];
    char *p;
    CCHmacInit( &ctx, kCCHmacAlgMD5, key, strlen( key ));
    CCHmacUpdate( &ctx, str, strlen(str) );
    CCHmacFinal( &ctx, mac );
    p = hexmac;
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++ ) { snprintf( p, 3, "%02x", mac[ i ] );
        p += 2;
    }
    return [NSString stringWithUTF8String:hexmac]; }

+ (NSData *)encryptWithA256GCM:(NSData *)dataIn ivString:(NSString *)iv key:(NSData *)symmetricKey aad:(NSData *)aad error:(NSError **)error {
    CCCryptorStatus ccStatus = kCCSuccess;
    NSMutableData *dataOut = [NSMutableData dataWithLength:dataIn.length];
    NSMutableData *tag = [NSMutableData dataWithLength:kCCBlockSizeAES128];
    size_t tagLength = kCCBlockSizeAES128;
    NSData *ivData = [iv dataUsingEncoding:NSUTF8StringEncoding];
    // TODO: Check if Apple rejects App submission because of this private function usage
    ccStatus = CCCryptorGCM(kCCEncrypt, kCCAlgorithmAES, symmetricKey.bytes,
                            kCCKeySizeAES256,
                            ivData.bytes, ivData.length, aad.bytes,
                            aad.length, dataIn.bytes, dataIn.length, dataOut.mutableBytes, tag.bytes, &tagLength);
    if (ccStatus == kCCSuccess) {
        NSMutableData *finalData = [NSMutableData new];
        [finalData appendData:dataOut];
        [finalData appendData:tag];
        return finalData;
    } else {
        if (error) {
            *error = [NSError errorWithDomain:@"kEncryptionError" code:ccStatus
                                     userInfo:nil];
        }
        return nil;
    }
}@end
