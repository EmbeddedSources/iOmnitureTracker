#import <Foundation/Foundation.h>

@interface ESOmnitureTrackPointFactory : NSObject

+(id)factoryWithLength:( NSTimeInterval )length_;

-(NSDictionary*)pointsWithMilestoneValue:( NSString* )milestone_;
-(NSDictionary*)pointsWithCuePointsValue:( NSString* )cue_points_;

@end
