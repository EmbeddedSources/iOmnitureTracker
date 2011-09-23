#import <Foundation/Foundation.h>

@class ESOmnitureMediaTrackPoint;

@interface ESOmnitureMediaPlaybackInfo : NSObject

+(id)playbackInfoWithLength:( NSTimeInterval )length_
                  cuePoints:( NSString* )cue_points_
                 milestones:( NSString* )milestones_
               trackSeconds:( NSTimeInterval )track_seconds_;

-(NSSet*)trackPointsForOffset:( NSTimeInterval )offset_;

@end
