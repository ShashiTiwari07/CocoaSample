//
//  HMAC.h
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#ifndef HMAC_h
#define HMAC_h
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface HMAC : NSObject

//@property (retain, nonatomic) NSString *randomString;
- (NSString*)populateHMAC:(NSString*)appId :(NSString*)mobileNumber :(NSString*)token :(NSString*)deviceId :(NSString*)randomString;

@end

#endif /* HMAC_h */
