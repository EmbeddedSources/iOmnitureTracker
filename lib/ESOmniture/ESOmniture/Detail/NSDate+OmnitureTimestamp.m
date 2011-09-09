#import "NSDate+OmnitureTimestamp.h"

@implementation NSDate (OmnitureTimestamp)

-(NSString*)omnitureTimestamp
{
   NSUInteger flags_ = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
      |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;

   NSCalendar* calendar_ = [ [ [ NSCalendar alloc ] initWithCalendarIdentifier: NSGregorianCalendar ] autorelease ];
   NSLocale* locale_ = [ [ [ NSLocale alloc ] initWithLocaleIdentifier: @"en_US_POSIX" ] autorelease ];
   calendar_.locale = locale_;

   NSDateComponents* dc_ = [ calendar_ components: flags_ fromDate: self ];

   NSInteger minutes_offset_ = - [ [ NSTimeZone defaultTimeZone ] secondsFromGMT ] / 60;

   //Week starts from monday
   NSInteger weekday_ = dc_.weekday == 1//is sunday
      ? 7
      : dc_.weekday - 1;

   NSString* timestamp_ = [ NSString stringWithFormat: @"%d/%d/%d %d:%d:%d %d %d"
                           , dc_.day
                           , dc_.month - 1
                           , dc_.year
                           , dc_.hour
                           , dc_.minute
                           , dc_.second
                           , weekday_
                           , minutes_offset_
                           ];

   return timestamp_;
}

@end
