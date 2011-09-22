#import <Foundation/Foundation.h>

@class ESOmnitureMediaPlayback;
@class ESOmnitureMediaTrackPoint;

@protocol ESOmnitureMediaPlaybackDelegate< NSObject >

-(void)mediaPlayback:( ESOmnitureMediaPlayback* )playback_
      didMoveToPoint:( ESOmnitureMediaTrackPoint* )track_point_;

@end
