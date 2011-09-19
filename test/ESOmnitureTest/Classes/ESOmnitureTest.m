#import <ESOmniture/ESOmniture.h>
#import <ESOmniture/ESOmnitureDelegate.h>

#import <ESOmniture/Detail/ESOmnitureVariable.h>

@interface OmnitureDelegate : NSObject< ESOmnitureDelegate >

@property ( nonatomic, retain ) NSDictionary* values;

+(id)delegateWithDictionary:( NSDictionary* )dictionary_;

@end

@implementation OmnitureDelegate

@synthesize values = _values;

-(void)dealloc
{
   [ _values release ];

   [ super dealloc ];
}

+(id)delegateWithDictionary:( NSDictionary* )dictionary_
{
   OmnitureDelegate* delegate_ = [ [ self alloc ] init ];
   delegate_.values = dictionary_;
   return [ delegate_ autorelease ];
}

-(void)omnitureDoPlugins:( ESOmniture* )omniture_
{
   for ( NSString* key_ in self.values )
   {
      [ omniture_ setValue: [ self.values objectForKey: key_ ]
                    forKey: key_ ];
   }
}

@end

@interface OmnitureCheckDelegate : OmnitureDelegate

@end

@implementation OmnitureCheckDelegate

-(void)omnitureDoPlugins:( ESOmniture* )omniture_
{
   for ( NSString* key_ in self.values )
   {
      id value_ = [ self.values objectForKey: key_ ];
      NSString* omniture_value_ = [ omniture_ valueForKey: key_ ];

      if ( [ value_ isKindOfClass: [ NSNull class ] ] )
      {
         NSAssert( omniture_value_ == nil, @"OmnitureCheckDelegate incorrect variable value" );
      }
      else
      {
         NSAssert( [ ( NSString* )value_ isEqualToString: omniture_value_ ], @"OmnitureCheckDelegate incorrect variable value" );
      }
   }
}

@end


@interface ESOmnitureTest : GHTestCase

@end

@implementation ESOmnitureTest

-(void)testDelegate
{
   ESOmniture* omniture_ = [ [ ESOmniture alloc ] init ];

   omniture_.debugTracking = YES;
   omniture_.visitorNamespace = @"RequiredVariable";
   
   omniture_.delegate = [ OmnitureDelegate delegateWithDictionary: [ NSDictionary dictionaryWithObjectsAndKeys: @"var1", @"eVar1"
                                                                    , @"p1", @"prop1"
                                                                    , nil ] ];
   [ omniture_ track ];
   
   GHAssertTrue( omniture_.eVar1 == nil && omniture_.prop1 == nil, @"Check use plugins NO" );
   
   omniture_.usePlugins = YES;
   
   [ omniture_ track ];
   
   GHAssertTrue( [ omniture_.eVar1 isEqualToString: @"var1" ], @"Check eVar1 use plugins YES" );

   GHAssertTrue( [ omniture_.prop1 isEqualToString: @"p1" ], @"Check prop1 use plugins YES" );

   [ omniture_ release ];
}

-(void)testVariablesOverride
{
   ESOmniture* omniture_ = [ [ ESOmniture alloc ] init ];

   omniture_.debugTracking = YES;
   omniture_.visitorNamespace = @"RequiredVariable";

   omniture_.eVar1 = @"initVar1";
   omniture_.prop2 = @"initProp2";

   NSDictionary* context_ = [ NSDictionary dictionaryWithObjectsAndKeys: @"var1", @"eVar1"
                             , @"p2", @"prop2"
                             , nil ];

   omniture_.usePlugins = YES;
   omniture_.delegate = [ OmnitureCheckDelegate delegateWithDictionary: context_ ];

   GHAssertNoThrow( [ omniture_ track: context_ ], @"Context should be applied" );

   GHAssertTrue( [ omniture_.eVar1 isEqualToString: @"initVar1" ], @"Check initial value eVar1 (%@)", omniture_.eVar1 );
   GHAssertTrue( [ omniture_.prop2 isEqualToString: @"initProp2" ], @"Check initial value prop2 (%@)", omniture_.prop2 );

   [ omniture_ release ];
}

-(void)testLinkTypes
{
   GHAssertTrue( [ ESOmnitureDownloadLink isEqualToString: @"d" ]
                , @"ESOmnitureDownloadLink"
                );

   GHAssertTrue( [ ESOmnitureCustomLink isEqualToString: @"o" ]
                , @"ESOmnitureCustomLink"
                );

   GHAssertTrue( [ ESOmnitureExitLink isEqualToString: @"e" ]
                , @"ESOmnitureExitLink"
                );
}

-(void)testTrackLink
{
   ESOmniture* omniture_ = [ [ ESOmniture alloc ] init ];

   omniture_.debugTracking = YES;
   omniture_.visitorNamespace = @"RequiredVariable";

   omniture_.eVar1 = @"testVar1";

   omniture_.usePlugins = YES;
   omniture_.delegate = [ OmnitureCheckDelegate delegateWithDictionary: [ NSDictionary dictionaryWithObjectsAndKeys: @"var1", @"eVar1"
                                                                         , @"lnk_d", @"pe"
                                                                         , @"http://somehost.com", @"pev1"
                                                                         , @"Link Name", @"pev2"
                                                                         , nil ] ];

   GHAssertNoThrow( [ omniture_ trackLink: @"http://somehost.com"
                                 linkType: ESOmnitureDownloadLink
                                 linkName: @"Link Name"
                        variableOverrides: [ NSDictionary dictionaryWithObject: @"var1" forKey: @"eVar1" ] ]
                   , @"Context should be applied" );

   GHAssertTrue( [ omniture_.eVar1 isEqualToString: @"testVar1" ], @"Check initial value eVar1 (%@)", omniture_.eVar1 );

   omniture_.delegate = [ OmnitureCheckDelegate delegateWithDictionary: [ NSDictionary dictionaryWithObjectsAndKeys: @"lnk_o", @"pe"
                                                                         , [ NSNull null ], @"pev1"
                                                                         , [ NSNull null ], @"pev2"
                                                                         , nil ] ];

   GHAssertNoThrow( [ omniture_ trackLink: nil
                                 linkType: ESOmnitureCustomLink
                                 linkName: nil ]
                   , @"Context should be applied" );
   

   [ omniture_ release ];
}

@end
