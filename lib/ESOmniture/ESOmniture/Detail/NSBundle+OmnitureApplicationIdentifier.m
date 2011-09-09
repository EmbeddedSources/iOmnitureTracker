#import "NSBundle+OmnitureApplicationIdentifier.h"

@implementation NSBundle (OmnitureApplicationIdentifier)

+(NSString*)applicationIdentifier
{
   NSDictionary* info_ = [ [ self mainBundle ] infoDictionary ];
   NSString* version_ = [ info_ objectForKey: @"CFBundleVersion" ];
   NSString* application_name_ = [ info_ objectForKey: @"CFBundleName" ];
   return [ application_name_ stringByAppendingFormat: @"/%@", version_ ];
}

@end
