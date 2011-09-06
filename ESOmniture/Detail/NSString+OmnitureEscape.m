#import "NSString+OmnitureEscape.h"

@implementation NSString (OmnitureEscape)

-(NSString*)stringByAddingOmnitureEscapes
{
   return [ [ self stringByReplacingOccurrencesOfString: @" " withString: @"%20" ]
           stringByReplacingOccurrencesOfString: @":" withString: @"%3A" ];
}

@end
