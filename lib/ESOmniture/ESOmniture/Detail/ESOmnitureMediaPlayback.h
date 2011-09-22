#import <Foundation/Foundation.h>

@protocol ESOmnitureMediaPlaybackDelegate;

@interface ESOmnitureMediaPlayback : NSObject

@property ( nonatomic, retain, readonly ) NSDate* openTime;
@property ( nonatomic, retain, readonly ) NSString* name;
@property ( nonatomic, retain, readonly ) NSString* playerName;
@property ( nonatomic, assign, readonly ) NSTimeInterval length;
@property ( nonatomic, assign, readonly ) NSTimeInterval offset;
@property ( nonatomic, assign, readonly ) NSTimeInterval timePlayed;

@property ( nonatomic, assign ) id< ESOmnitureMediaPlaybackDelegate > delegate;

+(id)playbackWithName:( NSString* )name_
           playerName:( NSString* )player_name_
               length:( NSTimeInterval )length_
            cuePoints:( NSString* )cue_points_
           milestones:( NSString* )milestones_
         trackSeconds:( NSTimeInterval )track_seconds_;

-(void)playWithOffset:( NSTimeInterval )offset_;
-(void)stopWithOffset:( NSTimeInterval )offset_;

-(void)close;

@end
