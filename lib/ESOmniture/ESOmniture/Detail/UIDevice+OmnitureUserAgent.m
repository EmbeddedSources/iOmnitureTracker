#import "UIDevice+OmnitureUserAgent.h"

@implementation UIDevice (OmnitureUserAgent)

//@"Mozilla/5.0 (iPad; U; CPU iPhone OS 4_3_5 like Mac OS X; en-US) TestOmniture/1.0"
//@"Mozilla/5.0 (iPod touch; U; CPU iPhone OS 4_3_5 like Mac OS X; ru-RU) TestOmniture/1.0"

-(NSString*)omnitureUserAgentWithAppIdentifier:( NSString* )app_identifier_
{
   return [ self omnitureUserAgentWithAppIdentifier: app_identifier_ locale: [ NSLocale currentLocale ] ];
}

-(NSString*)omnitureUserAgentWithAppIdentifier:( NSString* )app_identifier_
                                        locale:( NSLocale* )locale_
{
   NSString* system_version_ = [ self.systemVersion stringByReplacingOccurrencesOfString: @"."
                                                                              withString: @"_" ];

   NSString* locale_identifier_ = [ locale_.localeIdentifier stringByReplacingOccurrencesOfString: @"_"
                                                                                       withString: @"-" ];

   return [ NSString stringWithFormat: @"Mozilla/5.0 (%@; U; CPU %@ %@ like Mac OS X; %@) %@"
           , self.model
           , self.systemName
           , system_version_
           , locale_identifier_
           , app_identifier_
           ];
}

@end
