#import <Foundation/Foundation.h>

@interface UIDevice (OmnitureUserAgent)

-(NSString*)omnitureUserAgentWithAppIdentifier:( NSString* )app_identifier_;

-(NSString*)omnitureUserAgentWithAppIdentifier:( NSString* )app_identifier_
                                        locale:( NSLocale* )locale_;

@end
