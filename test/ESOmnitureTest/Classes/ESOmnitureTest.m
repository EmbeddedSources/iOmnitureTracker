#import <ESOmniture/ESOmniture.h>
#import <ESOmniture/ESOmnitureDelegate.h>

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


@interface ESOmnitureTest : GHTestCase

@end

@implementation ESOmnitureTest

-(void)testDelegate
{
   ESOmniture* omniture_ = [ [ ESOmniture alloc ] init ];
   
   omniture_.visitorNamespace = @"ESOmnitureTestFake";
   
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

@end
