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

@property ( nonatomic, retain ) ESOmniture* omniture;

@end

@implementation ESOmnitureTest

@synthesize omniture = _omniture;

-(void)dealloc
{
   [ _omniture release ];

   [ super dealloc ];
}

-(void)setUp
{
   ESOmniture* omniture_ = [ [ ESOmniture alloc ] init ];

   omniture_.usePlugins = YES;
   omniture_.visitorNamespace = @"RequiredVariable";

   self.omniture = omniture_;

   [ omniture_ release ];
}

-(void)tearDown
{
   self.omniture = nil;
}

-(void)testDelegate
{
   self.omniture.usePlugins = NO;
   self.omniture.delegate = [ OmnitureDelegate delegateWithDictionary: [ NSDictionary dictionaryWithObjectsAndKeys: @"var1", @"eVar1"
                                                                        , @"p1", @"prop1"
                                                                        , nil ] ];
   [ self.omniture track ];
   
   GHAssertTrue( self.omniture.eVar1 == nil && self.omniture.prop1 == nil, @"Check use plugins NO" );
   
   self.omniture.usePlugins = YES;
   
   [ self.omniture track ];
   
   GHAssertTrue( [ self.omniture.eVar1 isEqualToString: @"var1" ], @"Check eVar1 use plugins YES" );

   GHAssertTrue( [ self.omniture.prop1 isEqualToString: @"p1" ], @"Check prop1 use plugins YES" );
}

-(void)testVariablesOverride
{
   self.omniture.eVar1 = @"initVar1";
   self.omniture.prop2 = @"initProp2";

   NSDictionary* context_ = [ NSDictionary dictionaryWithObjectsAndKeys: @"var1", @"eVar1"
                             , @"p2", @"prop2"
                             , nil ];

   self.omniture.delegate = [ OmnitureCheckDelegate delegateWithDictionary: context_ ];

   GHAssertNoThrow( [ self.omniture track: context_ ], @"Context should be applied" );

   GHAssertTrue( [ self.omniture.eVar1 isEqualToString: @"initVar1" ], @"Check initial value eVar1 (%@)", self.omniture.eVar1 );
   GHAssertTrue( [ self.omniture.prop2 isEqualToString: @"initProp2" ], @"Check initial value prop2 (%@)", self.omniture.prop2 );
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
   self.omniture.eVar1 = @"testVar1";

   self.omniture.delegate = [ OmnitureCheckDelegate delegateWithDictionary: [ NSDictionary dictionaryWithObjectsAndKeys: @"var1", @"eVar1"
                                                                             , @"lnk_d", @"pe"
                                                                             , @"http://somehost.com", @"pev1"
                                                                             , @"Link Name", @"pev2"
                                                                             , nil ] ];

   GHAssertNoThrow( [ self.omniture trackLink: @"http://somehost.com"
                                     linkType: ESOmnitureDownloadLink
                                     linkName: @"Link Name"
                            variableOverrides: [ NSDictionary dictionaryWithObject: @"var1" forKey: @"eVar1" ] ]
                   , @"Context should be applied" );

   GHAssertTrue( [ self.omniture.eVar1 isEqualToString: @"testVar1" ], @"Check initial value eVar1 (%@)", self.omniture.eVar1 );

   self.omniture.delegate = [ OmnitureCheckDelegate delegateWithDictionary: [ NSDictionary dictionaryWithObjectsAndKeys: @"lnk_o", @"pe"
                                                                             , [ NSNull null ], @"pev1"
                                                                             , [ NSNull null ], @"pev2"
                                                                             , nil ] ];

   GHAssertNoThrow( [ self.omniture trackLink: nil
                                     linkType: ESOmnitureCustomLink
                                     linkName: nil ]
                   , @"Context should be applied" );
}

@end
