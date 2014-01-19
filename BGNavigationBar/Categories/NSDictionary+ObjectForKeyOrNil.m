//
//  NSDictionary+ObjectForKeyOrNil.m
//  BeerBrowser
//
//  Created by Ben Scheirman on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+ObjectForKeyOrNil.h"

@implementation NSDictionary (ObjectForKeyOrNil)

- (id)objectForKeyOrNil:(id)key {
    id val = [self objectForKey:key];
    
    // Convert null to nil
    if ([val isEqual:[NSNull null]]) {
        return nil;
    }
    
    // Convert
    if ([[val class] isSubclassOfClass:[NSNumber class]]) {
        return [NSString stringWithFormat:@"%@",val];
    }
    
    return val;
}

@end
