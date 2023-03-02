//
//  UpiHelper.h
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#ifndef UpiHelper_h
#define UpiHelper_h
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>
//#import <SHA256.h>
#import "SHA256.h"

@interface UpiHelper : SHA256
+ (NSString*) HMACWithSecret:(NSString*) secret andData:(NSString*)data;
+ (NSData *)encryptWithA256GCM:(NSData *)dataIn ivString:(NSString *)iv key:(NSData *)symmetricKey aad:(NSData *)aad error:(NSError **)error;
CCCryptorStatus CCCryptorGCM(
                             CCOperation op, /* kCCEncrypt, kCCDecrypt */
CCAlgorithm alg,
const void *key, /* raw key material */ size_t keyLength,
const void *iv,
size_t ivLen,
const void *aData,
size_t aDataLen,
const void *dataIn,
size_t dataInLength,
void *dataOut,
const void *tag,
size_t *tagLength);

@end

#endif /* UpiHelper_h */
