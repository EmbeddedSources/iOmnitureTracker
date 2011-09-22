#import "ESOmnitureMedia.h"

#import "ESOmnitureMediaDelegate.h"

#import "ESOmnitureMediaPlayback.h"
#import "ESOmnitureMediaPlaybackDelegate.h"
#import "ESOmnitureMediaTrackPoint.h"

@interface ESOmnitureMediaState ()

@property ( nonatomic, retain ) ESOmnitureMediaPlayback* playback;
@property ( nonatomic, retain ) ESOmnitureMediaTrackPoint* trackPoint;

+(id)mediaStateWithPlayback:( ESOmnitureMediaPlayback* )playback_
                 trackPoint:( ESOmnitureMediaTrackPoint* )track_point_;

@end

@interface ESOmnitureMedia ()< ESOmnitureMediaPlaybackDelegate >

@property ( nonatomic, retain ) NSMutableDictionary* players;

@end


@implementation ESOmnitureMedia

@synthesize trackSeconds = _track_seconds;
@synthesize trackMilestones = _track_milestones;
@synthesize cuePoints = _cue_points;
@synthesize trackAtCuePoints = _track_at_cue_points;

@synthesize omniture = _omniture;
@synthesize players = _players;

@synthesize delegate = _delegate;

-(void)dealloc
{
   [ _track_milestones release ];
   [ _cue_points release ];
   [ _players release ];

   [ super dealloc ];
}

-(id)initWithOmniture:( ESOmniture* )omniture_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.players = [ NSMutableDictionary dictionary ];
   self.omniture = omniture_;

   return self;
}

-(id)init
{
   return [ self initWithOmniture: nil ];
}

-(void)open:( NSString* )name_
     length:( NSTimeInterval )length_
 playerName:( NSString* )player_name_
{
   ESOmnitureMediaPlayback* playback_ = [ self.players objectForKey: name_ ];
   if ( playback_ )
   {
      [ playback_ close ];
   }

   ESOmnitureMediaPlayback* new_playback_ = [ ESOmnitureMediaPlayback playbackWithName: name_
                                                                            playerName: player_name_
                                                                                length: length_
                                                                             cuePoints: self.cuePoints
                                                                            milestones: self.trackMilestones
                                                                          trackSeconds: self.trackSeconds ];
   new_playback_.delegate = self;
   [ self.players setObject: new_playback_ forKey: name_ ];
}

-(void)close:( NSString* )name_
{
   ESOmnitureMediaPlayback* playback_ = [ self.players objectForKey: name_ ];
   [ playback_ close ];
   [ self.players removeObjectForKey: name_ ];
}

-(void)play:( NSString* )name_
     offset:( NSTimeInterval )offset_
{
   ESOmnitureMediaPlayback* playback_ = [ self.players objectForKey: name_ ];
   [ playback_ playWithOffset: offset_ ];
}

-(void)stop:( NSString* )name_
     offset:( NSTimeInterval )offset_
{
   ESOmnitureMediaPlayback* playback_ = [ self.players objectForKey: name_ ];
   [ playback_ stopWithOffset: offset_ ];
}

#pragma mark ESOmnitureMediaPlaybackDelegate

-(void)mediaPlayback:( ESOmnitureMediaPlayback* )playback_
      didMoveToPoint:( ESOmnitureMediaTrackPoint* )track_point_
{
   if ( track_point_.type == ESOmnitureMediaTrackPointOpen )
   {
   }
   else if ( track_point_.type == ESOmnitureMediaTrackPointCuepoint )
   {
      if ( self.trackAtCuePoints )
      {
      }
   }

   [ self.delegate media: self
          didChangeState: [ ESOmnitureMediaState mediaStateWithPlayback: playback_ trackPoint: track_point_ ] ];
}

@end


@implementation ESOmnitureMediaState

@synthesize playback = _playback;
@synthesize trackPoint = _track_point;

-(void)dealloc
{
   [ _playback release ];
   [ _track_point release ];

   [ super dealloc ];
}

-(NSString*)name
{
   return self.playback.name;
}

-(NSTimeInterval)length
{
   return self.playback.length;
}

-(NSString*)playerName
{
   return self.playback.playerName;
}

-(NSString*)mediaEvent
{
   return self.trackPoint.stringType;
}

-(NSDate*)openTime
{
   return self.playback.openTime;
}

-(NSTimeInterval)offset
{
   return self.playback.offset;
}

-(NSString*)offsetName
{
   return self.trackPoint.name;
}

-(double)percent
{
   return fmin( 1.0, self.playback.offset / self.length ) * 100.0;//fmax( fmin( 1.0, self.playback.omnitureOffset / self.length ) * 100.0, 0.0 );
}

-(NSTimeInterval)timePlayed
{
   return self.playback.timePlayed;
}

-(double)milestone
{
   return self.trackPoint.milestone;
}

+(id)mediaStateWithPlayback:( ESOmnitureMediaPlayback* )playback_
                 trackPoint:( ESOmnitureMediaTrackPoint* )track_point_
{
   ESOmnitureMediaState* media_state_ = [ [ ESOmnitureMediaState alloc ] init ];
   media_state_.playback = playback_;
   media_state_.trackPoint = track_point_;
   return [ media_state_ autorelease ];
}

@end
