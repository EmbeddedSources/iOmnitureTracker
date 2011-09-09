#import <ESOmniture/Detail/UIDevice+OmnitureUserAgent.h>

@interface iPadTestDevice : UIDevice

@end

@implementation iPadTestDevice

-(NSString*)model
{
   return @"iPad";
}

-(NSString*)systemName
{
   return @"iPhone OS";
}

-(NSString*)systemVersion
{
   return @"4.3.5";
}

@end

@interface iPodTouchTestDevice : UIDevice

@end


@implementation iPodTouchTestDevice : UIDevice

-(NSString*)model
{
   return @"iPod touch";
}

-(NSString*)systemName
{
   return @"iPhone OS";
}

-(NSString*)systemVersion
{
   return @"3.1.12";
}

@end


@interface UserAgentTest : GHTestCase

@end


@implementation UserAgentTest

-(void)testIpadUserAgent
{
   iPadTestDevice* ipad_device_ = [ [ iPadTestDevice alloc ] init ];

   NSLocale* ru_locale_ = [ [ NSLocale alloc ] initWithLocaleIdentifier: @"ru_RU" ];

   NSString* user_agent_ = [ ipad_device_ omnitureUserAgentWithAppIdentifier: @"SomeApp/1.0"
                                                                      locale: ru_locale_ ];

   GHAssertTrue( [ user_agent_ isEqualToString: @"Mozilla/5.0 (iPad; U; CPU iPhone OS 4_3_5 like Mac OS X; ru-RU) SomeApp/1.0" ]
                , @"iPad user agent"
                );

   [ ru_locale_ release ];
   [ ipad_device_ release ];
}

-(void)testIpodUserAgent
{
   iPodTouchTestDevice* ipod_device_ = [ [ iPodTouchTestDevice alloc ] init ];

   NSLocale* us_locale_ = [ [ NSLocale alloc ] initWithLocaleIdentifier: @"en_US" ];

   NSString* user_agent_ = [ ipod_device_ omnitureUserAgentWithAppIdentifier: @"AnotherApp/1.0"
                                                                      locale: us_locale_ ];

   GHAssertTrue( [ user_agent_ isEqualToString: @"Mozilla/5.0 (iPod touch; U; CPU iPhone OS 3_1_12 like Mac OS X; en-US) AnotherApp/1.0" ]
                , @"iPod touch user agent"
                );

   [ us_locale_ release ];
   [ ipod_device_ release ];
}

@end
