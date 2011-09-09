#import "NSString+OmnitureEscape.h"

@implementation NSString (OmnitureEscape)

-(NSString*)stringByAddingOmnitureEscapes
{
   NSString* unsafe_ = @" <>#%'\";?:&=+$,{}|\\^~[]`!()";
   NSString* result_ = (NSString*)CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault
                                                                          , (CFStringRef)self
                                                                          , NULL
                                                                          , (CFStringRef)unsafe_
                                                                          , kCFStringEncodingUTF8 );

   return [ result_ autorelease ];
}

@end
