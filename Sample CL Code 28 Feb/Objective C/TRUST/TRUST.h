//
//  TRUST.h
//  NPCI-Objective C
//
//  Created by orange on 27/01/23.
//

#ifndef TRUST_h
#define TRUST_h


@interface TRUST : NSObject

- (NSString*)generateTrustCred:(NSString*)trust npciToken:(NSString*)token random:(NSString*)randomString;

@end

#endif /* TRUST_h */
