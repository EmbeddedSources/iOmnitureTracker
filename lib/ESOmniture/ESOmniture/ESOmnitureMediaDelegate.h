#import <Foundation/Foundation.h>

@class ESOmnitureMedia;
@class ESOmnitureMediaState;

/** The iPhone app media monitor implements the Objective-C delegate design pattern.
 Use this functionality to monitor the status of each video that is currently playing.
 With it, you can setup other variables (Props, eVars, Events) and call Media.track based on the current state of the video as it is playing.

 This is useful if you have code that tracks events, such as resizing and volume adjustments, that you want to send when the video finishes playing.
 */

@protocol ESOmnitureMediaDelegate< NSObject >

/** Is called for all media events
 @param media_ reference to ESOmnitureMedia for what event appeared
 @param state_ describes video state
 */
-(void)media:( ESOmnitureMedia* )media_
didChangeState:( ESOmnitureMediaState* )state_;

@end
