#import "RIOmniture.h"

#import "RIOmnitureVariable.h"

@interface NSString (OmnitureEscape)

-(NSString*)stringByAddingOmnitureEscapes;

@end

@implementation NSString (OmnitureEscape)

-(NSString*)stringByAddingOmnitureEscapes
{
   NSString* unsafe_ = @" :";
   NSString* result_ = (NSString*)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault
                                                                          , (CFStringRef)self
                                                                          , NULL
                                                                          , (CFStringRef)unsafe_
                                                                          , kCFStringEncodingUTF8 );

   return [ result_ autorelease ];
}

@end

@interface RIOmniture ()

@property ( nonatomic, retain ) RIOmnitureContext* context;

-(NSString*)variableValueWithName:( NSString* )name_;

-(void)setVariableValue:( NSString* )value_
               withName:( NSString* )name_;

@end

//http://thomson.112.2o7.net/b/ss/threuterinsiderdev/0/OIP-2.0/s26006956?AQB=1&ndh=1&t=2/8/2011%2016%3A6%3A16%205%20-180&vid=d86b7a2b7a4debed0199d844edf828b1b5066835&ce=UTF-8&ns=thomson&pageName=insider/1.9.0&events=event4&c20=Login&c28=28982&v20=Login&v28=28982&v37=iPad&s=320x480&c=24&AQE=1


#define OMNITURE_SYNTHESIZE_VARIABLE( getterName, setterName, variableName )\
-(NSString*)getterName\
{\
   return [ self variableValueWithName: variableName ];\
}\
-(void)setterName:( NSString* )value_\
{\
   [ self setVariableValue: value_ withName: variableName ];\
}

#define OMNITURE_SYNTHESIZE_EVAR( index ) OMNITURE_SYNTHESIZE_VARIABLE( eVar##index, setEVar##index, ([ NSString stringWithFormat: @"v%d", index ]) )
#define OMNITURE_SYNTHESIZE_PROP( index ) OMNITURE_SYNTHESIZE_VARIABLE( prop##index, setProp##index, ([ NSString stringWithFormat: @"c%d", index ]) )

@implementation RIOmniture

@synthesize context = _context;

@synthesize account = _account;
@synthesize dc = _dc;
@synthesize debugTracking = _debug_tracking;

OMNITURE_SYNTHESIZE_VARIABLE( visitorNamespace  , setVisitorNamespace, RIOmnitureVariableVisitorNamespace )
OMNITURE_SYNTHESIZE_VARIABLE( visitorId         , setVisitorId       , RIOmnitureVariableVisitorId )
OMNITURE_SYNTHESIZE_VARIABLE( pageName          , setPageName        , RIOmnitureVariablePageName )
OMNITURE_SYNTHESIZE_VARIABLE( events            , setEvents          , RIOmnitureVariableEvents )

OMNITURE_SYNTHESIZE_EVAR( 1 )
OMNITURE_SYNTHESIZE_EVAR( 2 )
OMNITURE_SYNTHESIZE_EVAR( 3 )
OMNITURE_SYNTHESIZE_EVAR( 4 )
OMNITURE_SYNTHESIZE_EVAR( 5 )
OMNITURE_SYNTHESIZE_EVAR( 6 )
OMNITURE_SYNTHESIZE_EVAR( 7 )
OMNITURE_SYNTHESIZE_EVAR( 8 )
OMNITURE_SYNTHESIZE_EVAR( 9 )
OMNITURE_SYNTHESIZE_EVAR( 10 )
OMNITURE_SYNTHESIZE_EVAR( 11 )
OMNITURE_SYNTHESIZE_EVAR( 12 )
OMNITURE_SYNTHESIZE_EVAR( 13 )
OMNITURE_SYNTHESIZE_EVAR( 14 )
OMNITURE_SYNTHESIZE_EVAR( 15 )
OMNITURE_SYNTHESIZE_EVAR( 16 )
OMNITURE_SYNTHESIZE_EVAR( 17 )
OMNITURE_SYNTHESIZE_EVAR( 18 )
OMNITURE_SYNTHESIZE_EVAR( 19 )
OMNITURE_SYNTHESIZE_EVAR( 20 )
OMNITURE_SYNTHESIZE_EVAR( 21 )
OMNITURE_SYNTHESIZE_EVAR( 22 )
OMNITURE_SYNTHESIZE_EVAR( 23 )
OMNITURE_SYNTHESIZE_EVAR( 24 )
OMNITURE_SYNTHESIZE_EVAR( 25 )
OMNITURE_SYNTHESIZE_EVAR( 26 )
OMNITURE_SYNTHESIZE_EVAR( 27 )
OMNITURE_SYNTHESIZE_EVAR( 28 )
OMNITURE_SYNTHESIZE_EVAR( 29 )
OMNITURE_SYNTHESIZE_EVAR( 30 )
OMNITURE_SYNTHESIZE_EVAR( 31 )
OMNITURE_SYNTHESIZE_EVAR( 32 )
OMNITURE_SYNTHESIZE_EVAR( 33 )
OMNITURE_SYNTHESIZE_EVAR( 34 )
OMNITURE_SYNTHESIZE_EVAR( 35 )
OMNITURE_SYNTHESIZE_EVAR( 36 )
OMNITURE_SYNTHESIZE_EVAR( 37 )
OMNITURE_SYNTHESIZE_EVAR( 38 )
OMNITURE_SYNTHESIZE_EVAR( 39 )
OMNITURE_SYNTHESIZE_EVAR( 40 )
OMNITURE_SYNTHESIZE_EVAR( 41 )
OMNITURE_SYNTHESIZE_EVAR( 42 )
OMNITURE_SYNTHESIZE_EVAR( 43 )
OMNITURE_SYNTHESIZE_EVAR( 44 )
OMNITURE_SYNTHESIZE_EVAR( 45 )
OMNITURE_SYNTHESIZE_EVAR( 46 )
OMNITURE_SYNTHESIZE_EVAR( 47 )
OMNITURE_SYNTHESIZE_EVAR( 48 )
OMNITURE_SYNTHESIZE_EVAR( 49 )
OMNITURE_SYNTHESIZE_EVAR( 50 )

OMNITURE_SYNTHESIZE_PROP( 1 )
OMNITURE_SYNTHESIZE_PROP( 2 )
OMNITURE_SYNTHESIZE_PROP( 3 )
OMNITURE_SYNTHESIZE_PROP( 4 )
OMNITURE_SYNTHESIZE_PROP( 5 )
OMNITURE_SYNTHESIZE_PROP( 6 )
OMNITURE_SYNTHESIZE_PROP( 7 )
OMNITURE_SYNTHESIZE_PROP( 8 )
OMNITURE_SYNTHESIZE_PROP( 9 )
OMNITURE_SYNTHESIZE_PROP( 10 )
OMNITURE_SYNTHESIZE_PROP( 11 )
OMNITURE_SYNTHESIZE_PROP( 12 )
OMNITURE_SYNTHESIZE_PROP( 13 )
OMNITURE_SYNTHESIZE_PROP( 14 )
OMNITURE_SYNTHESIZE_PROP( 15 )
OMNITURE_SYNTHESIZE_PROP( 16 )
OMNITURE_SYNTHESIZE_PROP( 17 )
OMNITURE_SYNTHESIZE_PROP( 18 )
OMNITURE_SYNTHESIZE_PROP( 19 )
OMNITURE_SYNTHESIZE_PROP( 20 )
OMNITURE_SYNTHESIZE_PROP( 21 )
OMNITURE_SYNTHESIZE_PROP( 22 )
OMNITURE_SYNTHESIZE_PROP( 23 )
OMNITURE_SYNTHESIZE_PROP( 24 )
OMNITURE_SYNTHESIZE_PROP( 25 )
OMNITURE_SYNTHESIZE_PROP( 26 )
OMNITURE_SYNTHESIZE_PROP( 27 )
OMNITURE_SYNTHESIZE_PROP( 28 )
OMNITURE_SYNTHESIZE_PROP( 29 )
OMNITURE_SYNTHESIZE_PROP( 30 )
OMNITURE_SYNTHESIZE_PROP( 31 )
OMNITURE_SYNTHESIZE_PROP( 32 )
OMNITURE_SYNTHESIZE_PROP( 33 )
OMNITURE_SYNTHESIZE_PROP( 34 )
OMNITURE_SYNTHESIZE_PROP( 35 )
OMNITURE_SYNTHESIZE_PROP( 36 )
OMNITURE_SYNTHESIZE_PROP( 37 )
OMNITURE_SYNTHESIZE_PROP( 38 )
OMNITURE_SYNTHESIZE_PROP( 39 )
OMNITURE_SYNTHESIZE_PROP( 40 )
OMNITURE_SYNTHESIZE_PROP( 41 )
OMNITURE_SYNTHESIZE_PROP( 42 )
OMNITURE_SYNTHESIZE_PROP( 43 )
OMNITURE_SYNTHESIZE_PROP( 44 )
OMNITURE_SYNTHESIZE_PROP( 45 )
OMNITURE_SYNTHESIZE_PROP( 46 )
OMNITURE_SYNTHESIZE_PROP( 47 )
OMNITURE_SYNTHESIZE_PROP( 48 )
OMNITURE_SYNTHESIZE_PROP( 49 )
OMNITURE_SYNTHESIZE_PROP( 50 )

+(void)initialize
{
   if ( self == [ RIOmniture class ] )
   {
      srand( time( 0 ) );
   }
}

-(void)dealloc
{
   [ _context release ];
   [ _account release ];
   [ _dc release ];
   
   [ super dealloc ];
}

-(id)init
{
   self = [ super init ];

   if ( self )
   {
      self.context = [ RIOmnitureContext context ];
      self.dc = @"112";
   }

   return self;
}

-(NSString*)variableValueWithName:( NSString* )name_
{
   return [ self.context variableWithName: name_ ].value;
}

-(void)setVariableValue:( NSString* )value_
               withName:( NSString* )name_
{
   [ self.context variableWithName: name_ ].value = value_;
}

-(NSString*)timestamp
{
   NSDate* date_ = [ NSDate date ];
   
   NSUInteger flags_ = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
   |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit;
   
   NSCalendar* calendar_ = [ [ [ NSCalendar alloc ] initWithCalendarIdentifier: NSGregorianCalendar ] autorelease ];
   NSLocale* locale_ = [ [ [ NSLocale alloc ] initWithLocaleIdentifier: @"en_US_POSIX" ] autorelease ];
   calendar_.locale = locale_;
   
   NSDateComponents* dc_ = [ calendar_ components: flags_ fromDate: date_ ];
   
   NSInteger minutes_offset_ = - [ [ NSTimeZone defaultTimeZone ] secondsFromGMT ] / 60 - 420;//!!Local fix for catching Omniture event
   
   NSString* timestamp_ = [ NSString stringWithFormat: @"%d/%d/%d %d:%d:%d %d %d"
                           , dc_.day
                           , dc_.month - 1
                           , dc_.year
                           , dc_.hour
                           , dc_.minute
                           , dc_.second
                           , dc_.weekday - 1
                           , minutes_offset_
                           ];
   
   return timestamp_;
}

-(NSString*)deviceType
{
   return @"OIP-2.0";
}

-(NSURL*)trackURL
{
   [ self setVariableValue: [ self timestamp ] withName: RIOmnitureVariableTimestamp ];

   NSString* url_string_ = [ NSString stringWithFormat: @"http://%@.%@.2o7.net/b/ss/%@/0/%@/s%d?AQB=1&ndh=1&%@&AQE=1"
                            , self.visitorNamespace
                            , self.dc
                            , self.account
                            , [ self deviceType ]
                            , (int)(rand() * INT_MAX)
                            , [ [ self.context urlArguments ] stringByAddingOmnitureEscapes ] ];

   NSURL* url_ = [ NSURL URLWithString: url_string_ ];

   if ( self.debugTracking )
   {
      NSLog( @"Omniture URL: %@\nOmniture variables: %@", url_, self.context );
   }

   return url_;
}

-(NSString*)userAgent
{
   return @"Mozilla/5.0 (iPad; U; CPU iPhone OS 4_3_5 like Mac OS X; en-US) insider-iPad/1.9.0";
}

-(void)track
{
   NSURL* url_ = [ self trackURL ];
   if ( !url_ )
      return;

   NSMutableURLRequest* url_request_ = [ NSMutableURLRequest requestWithURL: url_ ];
   [ url_request_ setValue: [ self userAgent ] forHTTPHeaderField: @"User-Agent" ];

   [ NSURLConnection connectionWithRequest: url_request_
                                  delegate: self ];
}

#pragma mark NSURLConnectionDelegate

-(void)connection:( NSURLConnection* )connection_ didFailWithError:( NSError* )error_
{
   NSLog( @"Omniture connection error: %@", [ error_ localizedDescription ] );
}

-(void)connectionDidFinishLoading:( NSURLConnection* )connection_
{
}

@end
