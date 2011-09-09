#import <ESOmniture/Detail/NSDate+OmnitureTimestamp.h>

@interface TimestampTest : GHTestCase

@end

@implementation TimestampTest

-(NSString*)timestampWithString:( NSString* )date_string_
                 secondsFromGMT:( NSInteger )seconds_
{
   [ NSTimeZone setDefaultTimeZone: [ NSTimeZone timeZoneForSecondsFromGMT: seconds_ ] ];

   NSDateFormatter* date_formatter_ = [ [ NSDateFormatter alloc ] init ];
   [ date_formatter_ setDateFormat: @"MM/dd/yyyy HH:mm:ss" ];
   date_formatter_.locale = [ [ [ NSLocale alloc ] initWithLocaleIdentifier: @"en_US" ] autorelease ];

   NSDate* date_ = [ date_formatter_ dateFromString: date_string_ ];

   [ date_formatter_ release ];

   return [ date_ omnitureTimestamp ];
}

-(void)testTimestamp
{
   NSString* timestamp1_ = [ self timestampWithString: @"09/08/2011 15:08:18" secondsFromGMT: -3600 ];
   
   GHAssertTrue( [ timestamp1_ isEqualToString: @"8/8/2011 15:8:18 4 60" ]
                , @"Test Thursday -3600"
                );

   NSString* timestamp2_ = [ self timestampWithString: @"07/28/1985 05:30:01" secondsFromGMT: 10800 ];
   
   GHAssertTrue( [ timestamp2_ isEqualToString: @"28/6/1985 5:30:1 7 -180" ]
                , @"Test Sunday 10800"
                );
   
   NSString* timestamp3_ = [ self timestampWithString: @"09/05/2011 07:08:09" secondsFromGMT: 7200 ];
   
   GHAssertTrue( [ timestamp3_ isEqualToString: @"5/8/2011 7:8:9 1 -120" ]
                , @"Test Monday 3600"
                );
}

@end
