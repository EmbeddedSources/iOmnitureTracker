#import <ESOmniture/Detail/NSString+OmnitureEscape.h>

@interface OmnitureEscapeTest : GHTestCase

@end


@implementation OmnitureEscapeTest

-(void)testSpecialCharacters
{
   NSString* escaped_characters_ = @" <>#%'\";?:&=+$,{}|\\^~[]`!()";
   NSString* expected_result_ = @"%20%3C%3E%23%25%27%22%3B%3F%3A%26%3D%2B%24%2C%7B%7D%7C%5C%5E%7E%5B%5D%60%21%28%29";
   GHAssertTrue( [ [ escaped_characters_ stringByAddingOmnitureEscapes ] isEqualToString: expected_result_ ]
                  , @"All characters that should be escaped"
                  );
}

-(void)testUnspecialCharacters
{
   GHAssertTrue( [ [ @"@/-_*" stringByAddingOmnitureEscapes ] isEqualToString: @"@/-_*" ]
                , @"Characters that should not be escaped"
                );
}

-(void)testCombinations
{
   GHAssertTrue( [ [ @"(GMT+00:00)" stringByAddingOmnitureEscapes ] isEqualToString: @"%28GMT%2B00%3A00%29" ]
                , @"Timezon escape"
   );

   GHAssertTrue( [ [ @"7/8/2011 18:59:48 3 -180" stringByAddingOmnitureEscapes ] isEqualToString: @"7/8/2011%2018%3A59%3A48%203%20-180" ]
                , @"Timestamp escape"
                );
}

@end
