#import "ESOmniture.h"

#import "ESOmnitureVariable.h"

#import "NSString+OmnitureEscape.h"

@interface ESOmniture ()

@property ( nonatomic, retain ) ESOmnitureContext* context;

-(NSString*)variableValueWithName:( NSString* )name_;

-(void)setVariableValue:( NSString* )value_
               withName:( NSString* )name_;

@end

#define ES_OMNITURE_SYNTHESIZE_VARIABLE( getterName, setterName, variableName )\
-(NSString*)getterName\
{\
   return [ self variableValueWithName: variableName ];\
}\
-(void)setterName:( NSString* )value_\
{\
   [ self setVariableValue: value_ withName: variableName ];\
}

#define ES_OMNITURE_SYNTHESIZE_EVAR( index ) ES_OMNITURE_SYNTHESIZE_VARIABLE( eVar##index, setEVar##index, ESOmnitureVariableEVar( index ) )
#define ES_OMNITURE_SYNTHESIZE_PROP( index ) ES_OMNITURE_SYNTHESIZE_VARIABLE( prop##index, setProp##index, ESOmnitureVariableProp( index ) )

@implementation ESOmniture

@synthesize context = _context;

@synthesize account = _account;
@synthesize dc = _dc;
@synthesize debugTracking = _debug_tracking;

ES_OMNITURE_SYNTHESIZE_VARIABLE( visitorNamespace  , setVisitorNamespace, ESOmnitureVariableVisitorNamespace )
ES_OMNITURE_SYNTHESIZE_VARIABLE( visitorId         , setVisitorId       , ESOmnitureVariableVisitorId )
ES_OMNITURE_SYNTHESIZE_VARIABLE( pageName          , setPageName        , ESOmnitureVariablePageName )
ES_OMNITURE_SYNTHESIZE_VARIABLE( events            , setEvents          , ESOmnitureVariableEvents )

ES_OMNITURE_SYNTHESIZE_EVAR( 1 )
ES_OMNITURE_SYNTHESIZE_EVAR( 2 )
ES_OMNITURE_SYNTHESIZE_EVAR( 3 )
ES_OMNITURE_SYNTHESIZE_EVAR( 4 )
ES_OMNITURE_SYNTHESIZE_EVAR( 5 )
ES_OMNITURE_SYNTHESIZE_EVAR( 6 )
ES_OMNITURE_SYNTHESIZE_EVAR( 7 )
ES_OMNITURE_SYNTHESIZE_EVAR( 8 )
ES_OMNITURE_SYNTHESIZE_EVAR( 9 )
ES_OMNITURE_SYNTHESIZE_EVAR( 10 )
ES_OMNITURE_SYNTHESIZE_EVAR( 11 )
ES_OMNITURE_SYNTHESIZE_EVAR( 12 )
ES_OMNITURE_SYNTHESIZE_EVAR( 13 )
ES_OMNITURE_SYNTHESIZE_EVAR( 14 )
ES_OMNITURE_SYNTHESIZE_EVAR( 15 )
ES_OMNITURE_SYNTHESIZE_EVAR( 16 )
ES_OMNITURE_SYNTHESIZE_EVAR( 17 )
ES_OMNITURE_SYNTHESIZE_EVAR( 18 )
ES_OMNITURE_SYNTHESIZE_EVAR( 19 )
ES_OMNITURE_SYNTHESIZE_EVAR( 20 )
ES_OMNITURE_SYNTHESIZE_EVAR( 21 )
ES_OMNITURE_SYNTHESIZE_EVAR( 22 )
ES_OMNITURE_SYNTHESIZE_EVAR( 23 )
ES_OMNITURE_SYNTHESIZE_EVAR( 24 )
ES_OMNITURE_SYNTHESIZE_EVAR( 25 )
ES_OMNITURE_SYNTHESIZE_EVAR( 26 )
ES_OMNITURE_SYNTHESIZE_EVAR( 27 )
ES_OMNITURE_SYNTHESIZE_EVAR( 28 )
ES_OMNITURE_SYNTHESIZE_EVAR( 29 )
ES_OMNITURE_SYNTHESIZE_EVAR( 30 )
ES_OMNITURE_SYNTHESIZE_EVAR( 31 )
ES_OMNITURE_SYNTHESIZE_EVAR( 32 )
ES_OMNITURE_SYNTHESIZE_EVAR( 33 )
ES_OMNITURE_SYNTHESIZE_EVAR( 34 )
ES_OMNITURE_SYNTHESIZE_EVAR( 35 )
ES_OMNITURE_SYNTHESIZE_EVAR( 36 )
ES_OMNITURE_SYNTHESIZE_EVAR( 37 )
ES_OMNITURE_SYNTHESIZE_EVAR( 38 )
ES_OMNITURE_SYNTHESIZE_EVAR( 39 )
ES_OMNITURE_SYNTHESIZE_EVAR( 40 )
ES_OMNITURE_SYNTHESIZE_EVAR( 41 )
ES_OMNITURE_SYNTHESIZE_EVAR( 42 )
ES_OMNITURE_SYNTHESIZE_EVAR( 43 )
ES_OMNITURE_SYNTHESIZE_EVAR( 44 )
ES_OMNITURE_SYNTHESIZE_EVAR( 45 )
ES_OMNITURE_SYNTHESIZE_EVAR( 46 )
ES_OMNITURE_SYNTHESIZE_EVAR( 47 )
ES_OMNITURE_SYNTHESIZE_EVAR( 48 )
ES_OMNITURE_SYNTHESIZE_EVAR( 49 )
ES_OMNITURE_SYNTHESIZE_EVAR( 50 )

ES_OMNITURE_SYNTHESIZE_PROP( 1 )
ES_OMNITURE_SYNTHESIZE_PROP( 2 )
ES_OMNITURE_SYNTHESIZE_PROP( 3 )
ES_OMNITURE_SYNTHESIZE_PROP( 4 )
ES_OMNITURE_SYNTHESIZE_PROP( 5 )
ES_OMNITURE_SYNTHESIZE_PROP( 6 )
ES_OMNITURE_SYNTHESIZE_PROP( 7 )
ES_OMNITURE_SYNTHESIZE_PROP( 8 )
ES_OMNITURE_SYNTHESIZE_PROP( 9 )
ES_OMNITURE_SYNTHESIZE_PROP( 10 )
ES_OMNITURE_SYNTHESIZE_PROP( 11 )
ES_OMNITURE_SYNTHESIZE_PROP( 12 )
ES_OMNITURE_SYNTHESIZE_PROP( 13 )
ES_OMNITURE_SYNTHESIZE_PROP( 14 )
ES_OMNITURE_SYNTHESIZE_PROP( 15 )
ES_OMNITURE_SYNTHESIZE_PROP( 16 )
ES_OMNITURE_SYNTHESIZE_PROP( 17 )
ES_OMNITURE_SYNTHESIZE_PROP( 18 )
ES_OMNITURE_SYNTHESIZE_PROP( 19 )
ES_OMNITURE_SYNTHESIZE_PROP( 20 )
ES_OMNITURE_SYNTHESIZE_PROP( 21 )
ES_OMNITURE_SYNTHESIZE_PROP( 22 )
ES_OMNITURE_SYNTHESIZE_PROP( 23 )
ES_OMNITURE_SYNTHESIZE_PROP( 24 )
ES_OMNITURE_SYNTHESIZE_PROP( 25 )
ES_OMNITURE_SYNTHESIZE_PROP( 26 )
ES_OMNITURE_SYNTHESIZE_PROP( 27 )
ES_OMNITURE_SYNTHESIZE_PROP( 28 )
ES_OMNITURE_SYNTHESIZE_PROP( 29 )
ES_OMNITURE_SYNTHESIZE_PROP( 30 )
ES_OMNITURE_SYNTHESIZE_PROP( 31 )
ES_OMNITURE_SYNTHESIZE_PROP( 32 )
ES_OMNITURE_SYNTHESIZE_PROP( 33 )
ES_OMNITURE_SYNTHESIZE_PROP( 34 )
ES_OMNITURE_SYNTHESIZE_PROP( 35 )
ES_OMNITURE_SYNTHESIZE_PROP( 36 )
ES_OMNITURE_SYNTHESIZE_PROP( 37 )
ES_OMNITURE_SYNTHESIZE_PROP( 38 )
ES_OMNITURE_SYNTHESIZE_PROP( 39 )
ES_OMNITURE_SYNTHESIZE_PROP( 40 )
ES_OMNITURE_SYNTHESIZE_PROP( 41 )
ES_OMNITURE_SYNTHESIZE_PROP( 42 )
ES_OMNITURE_SYNTHESIZE_PROP( 43 )
ES_OMNITURE_SYNTHESIZE_PROP( 44 )
ES_OMNITURE_SYNTHESIZE_PROP( 45 )
ES_OMNITURE_SYNTHESIZE_PROP( 46 )
ES_OMNITURE_SYNTHESIZE_PROP( 47 )
ES_OMNITURE_SYNTHESIZE_PROP( 48 )
ES_OMNITURE_SYNTHESIZE_PROP( 49 )
ES_OMNITURE_SYNTHESIZE_PROP( 50 )

+(void)initialize
{
   if ( self == [ ESOmniture class ] )
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
      self.context = [ ESOmnitureContext context ];
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
   
   NSInteger minutes_offset_ = - [ [ NSTimeZone defaultTimeZone ] secondsFromGMT ] / 60;
   
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
   //!Should be fixed
   return @"OIP-2.0";
}

-(NSURL*)trackURL
{
   [ self setVariableValue: [ self timestamp ] withName: ESOmnitureVariableTimestamp ];

   NSString* url_string_ = [ NSString stringWithFormat: @"http://%@.%@.2o7.net/b/ss/%@/0/%@/s%d?%@"
                            , self.visitorNamespace
                            , self.dc
                            , self.account
                            , [ self deviceType ]
                            , rand()
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
   //!Should be fixed
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
