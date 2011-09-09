#import <ESOmniture/Detail/NSBundle+OmnitureApplicationIdentifier.h>

@interface ApplicationIdentifierTest : GHTestCase

@end


@implementation ApplicationIdentifierTest

-(void)testApplicationIdentifier
{
   GHAssertTrue( [ [ NSBundle applicationIdentifier ] isEqualToString: @"ESOmnitureTest/1.0" ]
                , @"ESOmnitureTest application identifier"
                );
}

@end
