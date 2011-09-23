#import <Foundation/Foundation.h>

@class ESOmnitureMediaPlayback;

@protocol ESOmnitureMediaPlaybackDelegate< NSObject >

-(void)mediaPlayback:( ESOmnitureMediaPlayback* )playback_
     didMoveToPoints:( NSSet* )track_points_;

@end
