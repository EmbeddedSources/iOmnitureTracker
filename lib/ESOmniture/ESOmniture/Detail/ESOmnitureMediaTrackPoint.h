#import <Foundation/Foundation.h>

typedef enum
{
   ESOmnitureMediaTrackPointUndefined
   , ESOmnitureMediaTrackPointMonitor
   , ESOmnitureMediaTrackPointMilestone
   , ESOmnitureMediaTrackPointCuepoint
   , ESOmnitureMediaTrackPointSeconds
   , ESOmnitureMediaTrackPointOpen
   , ESOmnitureMediaTrackPointClose
   , ESOmnitureMediaTrackPointPlay
   , ESOmnitureMediaTrackPointStop
} ESOmnitureMediaTrackPointType;

@interface ESOmnitureMediaTrackPoint : NSObject

@property ( nonatomic, assign, readonly ) ESOmnitureMediaTrackPointType type;
@property ( nonatomic, retain, readonly ) NSString* stringType;
@property ( nonatomic, assign, readonly ) double milestone;
@property ( nonatomic, retain, readonly ) NSString* name;

+(id)openPoint;
+(id)closePoint;
+(id)playPoint;
+(id)stopPoint;
+(id)cuePointWithName:( NSString* )name_;
+(id)monitorPoint;
+(id)pointWithMilestone:( double )percent_;
+(id)secondsPoint;

@end
