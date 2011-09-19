#import "ESOmniture.h"

#import "ESOmnitureDelegate.h"

#import "ESOmnitureVariable.h"
#import "ESOmnitureContext.h"

#import "UIDevice+OmnitureUserAgent.h"
#import "NSBundle+OmnitureApplicationIdentifier.h"
#import "NSDate+OmnitureTimestamp.h"

NSString* const ESOmnitureCustomLink = @"o";
NSString* const ESOmnitureDownloadLink = @"d";
NSString* const ESOmnitureExitLink = @"e";

@interface ESOmniture ()

@property ( nonatomic, retain ) ESOmnitureContext* context;

@property ( nonatomic, copy ) NSString* timestamp;
@property ( nonatomic, copy ) NSString* pe;
@property ( nonatomic, copy ) NSString* pev1;
@property ( nonatomic, copy ) NSString* pev2;
@property ( nonatomic, copy ) NSString* pev3;

@end

#define ES_OMNITURE_SYNTHESIZE_VARIABLE( getterName, setterName, variableName )\
-(NSString*)getterName\
{\
   return [ self.context variableValueWithName: variableName ];\
}\
-(void)setterName:( NSString* )value_\
{\
   [ self.context setVariableValue: value_ withName: variableName ];\
}

#define ES_OMNITURE_SYNTHESIZE_EVAR( index ) ES_OMNITURE_SYNTHESIZE_VARIABLE( eVar##index, setEVar##index, ESOmnitureVariableEVar( index ) )
#define ES_OMNITURE_SYNTHESIZE_PROP( index ) ES_OMNITURE_SYNTHESIZE_VARIABLE( prop##index, setProp##index, ESOmnitureVariableProp( index ) )

@implementation ESOmniture

@synthesize delegate = _delegate;
@synthesize context = _context;
@synthesize account = _account;
@synthesize dc = _dc;
@synthesize debugTracking = _debug_tracking;
@synthesize usePlugins = _use_plugins;


ES_OMNITURE_SYNTHESIZE_VARIABLE( visitorNamespace  , setVisitorNamespace, ESOmnitureVariableVisitorNamespace )
ES_OMNITURE_SYNTHESIZE_VARIABLE( visitorId         , setVisitorId       , ESOmnitureVariableVisitorId )
ES_OMNITURE_SYNTHESIZE_VARIABLE( charSet           , setCharSet         , ESOmnitureVariableCharset )
ES_OMNITURE_SYNTHESIZE_VARIABLE( pageName          , setPageName        , ESOmnitureVariablePageName )
ES_OMNITURE_SYNTHESIZE_VARIABLE( events            , setEvents          , ESOmnitureVariableEvents )

ES_OMNITURE_SYNTHESIZE_VARIABLE( timestamp         , setTimestamp       , ESOmnitureVariableTimestamp )
ES_OMNITURE_SYNTHESIZE_VARIABLE( pe                , setPe              , ESOmnitureVariableLinkType )
ES_OMNITURE_SYNTHESIZE_VARIABLE( pev1              , setPev1            , ESOmnitureVariableLinkURL )
ES_OMNITURE_SYNTHESIZE_VARIABLE( pev2              , setPev2            , ESOmnitureVariableLinkName )
ES_OMNITURE_SYNTHESIZE_VARIABLE( pev3              , setPev3            , ESOmnitureVariableVideoReports )

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

-(NSURL*)trackURL
{
   self.timestamp = [ [ NSDate date ] omnitureTimestamp ];

   if ( self.usePlugins )
   {
      [ self.delegate omnitureDoPlugins: self ];
   }

   NSString* url_string_ = [ NSString stringWithFormat: @"http://%@.%@.2o7.net/b/ss/%@/0/OIP-2.0/s%d?%@"
                            , self.visitorNamespace
                            , self.dc
                            , self.account
                            , rand()
                            , [ self.context urlArguments ] ];

   NSURL* url_ = [ NSURL URLWithString: url_string_ ];

   if ( self.debugTracking )
   {
      NSLog( @"Omniture URL: %@\nOmniture variables: %@", url_, self.context );
   }

   return url_;
}

-(void)track
{
   NSURL* url_ = [ self trackURL ];
   if ( !url_ )
      return;
   
   NSMutableURLRequest* url_request_ = [ NSMutableURLRequest requestWithURL: url_ ];
   
   NSString* user_agent_ = [ [ UIDevice currentDevice ] omnitureUserAgentWithAppIdentifier: [ NSBundle applicationIdentifier ] ];
   [ url_request_ setValue: user_agent_ forHTTPHeaderField: @"User-Agent" ];
   
   [ NSURLConnection connectionWithRequest: url_request_
                                  delegate: self ];
}

-(void)overrideVariables:( NSDictionary* )variables_
{
   for ( NSString* name_ in variables_ )
   {
      [ self setValue: [ variables_ objectForKey: name_ ]
               forKey: name_ ];
   }
}

//returns old context
-(ESOmnitureContext*)swapContext:( ESOmnitureContext* )context_
{
   ESOmnitureContext* previous_context_ = [ self.context retain ];
   self.context = context_;
   return [ previous_context_ autorelease ];
}

-(void)track:( NSDictionary* )variable_overrides_
{
   ESOmnitureContext* previous_context_ = [ self swapContext: [ ESOmnitureContext contextWithContext: self.context ] ];
   [ self overrideVariables: variable_overrides_ ];
   [ self track ];
   [ self swapContext: previous_context_ ];
}

-(void)trackLink:( NSString* )link_url_
        linkType:( NSString* )link_type_
        linkName:( NSString* )link_name_
variableOverrides:( NSDictionary* )variable_overrides_
{
   NSMutableDictionary* variables_ = variable_overrides_
      ? [ NSMutableDictionary dictionaryWithDictionary: variable_overrides_ ]
      : [ NSMutableDictionary dictionary ];

   [ variables_ setObject: [ @"lnk_" stringByAppendingString: link_type_ ] forKey: ESOmnitureVariableLinkType ];

   if ( link_name_ )
   {
      [ variables_ setObject: link_name_ forKey: ESOmnitureVariableLinkName ];
   }

   if ( link_url_ )
   {
      [ variables_ setObject: link_url_ forKey: ESOmnitureVariableLinkURL ];
   }

   [ self track: variables_ ];
}

-(void)trackLink:( NSString* )link_url_
        linkType:( NSString* )link_type_
        linkName:( NSString* )link_name_
{
   [ self trackLink: link_url_
           linkType: link_type_
           linkName: link_name_
  variableOverrides: nil ];
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
