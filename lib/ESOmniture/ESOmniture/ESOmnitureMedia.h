#import <Foundation/Foundation.h>

@class ESOmniture;

@protocol ESOmnitureMediaDelegate;

/** App Measurement for iPhone includes the Omniture Media Module,
 which provides several video tracking variables that help you configure the level of video tracking you need.
 */
@interface ESOmnitureMedia : NSObject

/** Private constructor is used by during create [ ESOmniture Media ]
 @param omniture_ initial value for self.omniture
 @see omniture
 */
-(id)initWithOmniture:( ESOmniture* )omniture_;

/** Reference to omniture instance.
 
 Method [ ESOmniture trackVideoReport:reportType: ] is called for tracking media
 */
@property ( nonatomic, assign ) ESOmniture* omniture;

/** Defines the interval, in seconds, for sending video tracking data to Omniture collection servers while the video is playing.
 The value must be set in increments of 5 seconds.
 
 The variable sends video tracking data at the start (when Media.open is called) and end (when Media.close is called) of the video,
 and on multiples of the value specified for Media.trackSeconds.
 For example, every 15 seconds that the video is playing.
 
 Media.trackSeconds tracks time spent viewing a video. It does not track how much of the video a visitor views.
 It does not distinguish between viewing the file from beginning to end, and replaying a portion of the video multiple times.
 
 @warning Do not use this variable simultaneously with Media.trackMilestones
 */
@property ( nonatomic, assign ) NSTimeInterval trackSeconds;

/** Defines the interval, as a percentage of the video watched, for sending video tracking data to Omniture collection servers.
 Specify the milestones as a comma-separated list of whole numbers. For example: 10 = 10%, 23 = 23%.

 The variable sends video tracking data at the start (when Media.open is called) and end (when Media.close is called) of the video,
 and on video percentages specified in Media.trackMilestones, based on the length of the video.

 Because these milestones are fixed points in the video, if a visitor views past the 10% milestone,
 then rewinds and passes the 10% milestone again, Omniture sends the tracking data multiple times.
 Similarly, if a visitor fast forwards past a milestone, Omniture does not send the tracking data for that milestone.
 
 @warning Do not use this variable simultaneously with Media.trackSeconds
 */
@property ( nonatomic, retain ) NSString* trackMilestones;

/** Defines cue points in the video by specifying a second offset and, optionally, a cue point name.
 For example, 5:first defines a cue point 5 seconds into the video with a name of “first”.
 */
@property ( nonatomic, retain ) NSString* cuePoints;

/** Set this variable to YES to automatically send data to Omniture collection servers at each of the defined cue points.
 
 Default is NO
 */
@property ( nonatomic, assign ) BOOL trackAtCuePoints;

/** Reference to ESOmnitureMediaDelegate instance
 */
@property ( nonatomic, assign ) id< ESOmnitureMediaDelegate > delegate;

/** @name Playback methods */

/** Prepares the media module to collect the following video tracking data. This method takes the following parameters:
 @param name_ The name of the video as you want it to appear in SiteCatalyst video reports
 @param length_ The length of the video in seconds
 @param player_name_ The name of the media player used to view the video, as you want it to appear in SiteCatalyst video reports.
 */
-(void)open:( NSString* )name_
     length:( NSTimeInterval )length_
 playerName:( NSString* )player_name_;

/** Ends video data collection and sends information to Omniture collection servers.
 Call this method at the end of the video. This method takes the following parameters:
 @param name_ The name of the video as you want it to appear in SiteCatalyst video reports.
 */
-(void)close:( NSString* )name_;

/** Call this method anytime a video starts playing
 @param name_ This must match the name used in Media.open
 @param offset_ The number of seconds into the video that play begins
 */
-(void)play:( NSString* )name_
     offset:( NSTimeInterval )offset_;

/** Tracks a stop event (stop, pause, etc.) for the specified video
 @param name_ This must match the name used in Media.open
 @param offset_ The number of seconds into the video that play begins
 */
-(void)stop:( NSString* )name_
     offset:( NSTimeInterval )offset_;

@end


/** Instance of this class provides the state of the video
 */
@interface ESOmnitureMediaState : NSObject

/// The name of the video given in the call to Media.open
@property ( nonatomic, retain, readonly ) NSString * name;
/// The length of the video in seconds given in the call to Media.open
@property ( nonatomic, assign, readonly ) NSTimeInterval length;
/// The name of the media player given in the call to Media.open
@property ( nonatomic, retain, readonly ) NSString* playerName;
/**
 A string containing the event name that caused the monitor call

 These events are:

 - OPEN: The first call to Media.open
 - CLOSE: When Media.close is called
 - PLAY: When Media.play is called
 - STOP: When Media.stop is called
 - MONITOR: When our automatic monitoring checks the state of the video while it's playing (every second)
 - SECONDS: At the second interval defined by the Media.trackSeconds variable
 - MILESTONE: At the milestones defined by the Media.trackMilestones variable
 - CUEPOINT: At the cue points defined by the Media.cuePoints variable (or the Media.open method)

 */
@property ( nonatomic, retain, readonly ) NSString* mediaEvent;

/// An NSDate object containing data about when Media.open was called
@property ( nonatomic, retain, readonly ) NSDate* openTime;
/// The current offset, in seconds, (actual point in the video) into the video
@property ( nonatomic, assign, readonly ) NSTimeInterval offset;
/// The cue point name. This is set only when the media event is a cue point
@property ( nonatomic, retain, readonly ) NSString * offsetName;
/// The current percentage of the video that has played, based on the video length and the current offset
@property ( nonatomic, assign, readonly ) double percent;
/// The total number of seconds played so far
@property ( nonatomic, assign, readonly ) NSTimeInterval timePlayed;
/// The current percentage of the video that has played, based on the video length and the current offset
@property ( nonatomic, assign, readonly ) double milestone;

@end
