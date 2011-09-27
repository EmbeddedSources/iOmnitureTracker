#import "ESOmnitureMediaPlayback.h"

#import "ESOmnitureMediaPlaybackDelegate.h"

#import "ESOmniture.h"

#import "ESOmnitureMediaTrackPoint.h"
#import "ESOmnitureMediaPlaybackInfo.h"
#import "ESOmnitureMediaPlaybackAction.h"

@interface ESOmnitureMediaPlayback ()

@property ( nonatomic, retain ) NSDate* openTime;
@property ( nonatomic, retain ) NSString* name;
@property ( nonatomic, retain ) NSString* playerName;
@property ( nonatomic, assign ) NSTimeInterval length;
@property ( nonatomic, retain ) ESOmnitureMediaPlaybackInfo* trackInfo;
@property ( nonatomic, assign ) NSTimeInterval offset;
@property ( nonatomic, assign ) NSTimeInterval timePlayed;
@property ( nonatomic, retain ) NSMutableArray* actions;
@property ( nonatomic, assign ) NSTimeInterval nextPointOffset;
@property ( nonatomic, assign ) NSTimer* currentTimer;


@end


@implementation ESOmnitureMediaPlayback

@synthesize openTime = _open_time;
@synthesize name = _name;
@synthesize playerName = _player_name;
@synthesize length = _length;
@synthesize trackInfo = _track_info;
@synthesize offset = _offset;
@synthesize timePlayed = _time_played;
@synthesize actions = _actions;
@synthesize nextPointOffset = _next_point_offset;
@synthesize currentTimer = _current_timer;
@synthesize delegate = _delegate;

-(void)dealloc
{
   [ _open_time release ];
   [ _name release ];
   [ _player_name release ];
   [ _track_info release ];
   [ _actions release ];
   [ _current_timer invalidate ];

   [ super dealloc ];
}

-(id)initWithName:( NSString* )name_
       playerName:( NSString* )player_name_
           length:( NSTimeInterval )length_
        trackInfo:( ESOmnitureMediaPlaybackInfo* )info_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.actions = [ NSMutableArray array ];
   self.name = name_;
   self.playerName = player_name_;
   self.length = length_;
   self.trackInfo = info_;
   
   return self;
}

+(id)playbackWithName:( NSString* )name_
           playerName:( NSString* )player_name_
               length:( NSTimeInterval )length_
            trackInfo:( ESOmnitureMediaPlaybackInfo* )info_
{
   return [ [ [ self alloc ] initWithName: name_
                               playerName: player_name_
                                   length: length_
                                trackInfo: info_ ] autorelease ];
}

+(id)playbackWithName:( NSString* )name_
           playerName:( NSString* )player_name_
               length:( NSTimeInterval )length_
            cuePoints:( NSString* )cue_points_
           milestones:( NSString* )milestones_
         trackSeconds:( NSTimeInterval )track_seconds_
{
   return [ self playbackWithName: name_
                       playerName: player_name_
                           length: length_
                        trackInfo: [ ESOmnitureMediaPlaybackInfo playbackInfoWithLength: length_
                                                                              cuePoints: cue_points_
                                                                             milestones: milestones_
                                                                           trackSeconds: track_seconds_ ] ];
}

-(void)invalidateCurrentTimer
{
   [ self.currentTimer invalidate ];
   self.currentTimer = nil;
}

-(void)startTimerWithDelay:( NSTimeInterval )delay_
{
   NSAssert( self.currentTimer == nil, @"ESOmniture previous timer should be stopped" );

   NSDate* fire_date_ = [ [ NSDate date ] dateByAddingTimeInterval: delay_ ];

   NSTimer* timer_ = [ [ NSTimer alloc ] initWithFireDate: fire_date_
                                                 interval: 1.0
                                                   target: self
                                                 selector: @selector( fireTrackPoint: )
                                                 userInfo: nil
                                                  repeats: YES ];

   self.currentTimer = timer_;

   [ [ NSRunLoop currentRunLoop ] addTimer: timer_ forMode: NSDefaultRunLoopMode ];

   [ timer_ release ];
}

-(void)playWithOffset:( NSTimeInterval )offset_
{
   self.offset = offset_;
   [ self invalidateCurrentTimer ];
   
   NSTimeInterval seconds_offset_ = ceil( offset_ );
   self.nextPointOffset = seconds_offset_ == offset_
      ? offset_ + 1.0
      : seconds_offset_;

   if ( self.nextPointOffset >= self.length )
      return;

   if ( !self.openTime )
   {
      self.openTime = [ NSDate date ];
      [ self.actions addObject: [ ESOmnitureMediaPlaybackAction openActionWithOffset: offset_ ] ];
      [ self.delegate mediaPlayback: self
                    didMoveToPoints: [ NSSet setWithObject: [ ESOmnitureMediaTrackPoint openPoint ] ] ];
   }
   else
   {
      [ self.actions addObject: [ ESOmnitureMediaPlaybackAction playActionWithOffset: offset_ ] ];
   }

   [ self startTimerWithDelay: self.nextPointOffset - offset_ ];
}

-(void)stopWithOffset:( NSTimeInterval )offset_
{
   self.offset = offset_;
   [ self invalidateCurrentTimer ];

   [ self.actions addObject: [ ESOmnitureMediaPlaybackAction stopActionWithOffset: offset_ ] ];

   [ self.delegate mediaPlayback: self
                  didMoveToPoints: [ NSSet setWithObject: [ ESOmnitureMediaTrackPoint stopPoint ] ] ];
}

-(void)close
{
   [ self stopWithOffset: self.offset ];

   [ self.delegate mediaPlayback: self
                 didMoveToPoints: [ NSSet setWithObject: [ ESOmnitureMediaTrackPoint closePoint ] ] ];
}

-(NSString*)playbackTrack
{
   return [ NSString stringWithFormat: @"%@--**--%d--**--%@--**--%d--**--%d--**--%@"
           , self.name
           , (int)self.length
           , self.playerName
           , (int)self.timePlayed
           , (int)[ self.openTime timeIntervalSince1970 ]
           , [ self.actions componentsJoinedByString: @"" ]
           ];
}

-(void)trackInOmniture:( ESOmniture* )omniture_
{
   ESOmnitureMediaPlaybackAction* last_action_ = [ self.actions lastObject ];

   NSMutableArray* new_actions_ = [ NSMutableArray array ];

   if ( ![ last_action_.name isEqualToString: ESOmnitureMediaStopActionName ] )
   {
      ESOmnitureMediaPlaybackAction* track_action_ = [ ESOmnitureMediaPlaybackAction trackActionWithOffset: self.offset ];
      [ self.actions addObject: track_action_ ];
      [ omniture_ trackVideoReport: [ self playbackTrack ] reportType: [ last_action_ reportType ] ];

      [ new_actions_ addObject: track_action_ ];
   }
   else
   {
      [ omniture_ trackVideoReport: [ self playbackTrack ] reportType: [ last_action_ reportType ] ];
   }

   self.actions = new_actions_;
}

#pragma mark NSTimer

-(void)fireTrackPoint:( NSTimer* )timer_
{
   if ( self.currentTimer != timer_ )
      return;

   self.timePlayed += ( self.nextPointOffset - self.offset );

   self.offset = fmin( self.nextPointOffset, self.length );

   if ( self.offset == self.length )
   {
      [ self invalidateCurrentTimer ];
   }
   else
   {
      self.nextPointOffset += 1.0;
   }

   NSSet* points_ = [ self.trackInfo trackPointsForOffset: self.offset ];
   [ self.delegate mediaPlayback: self didMoveToPoints: points_ ];
}

@end
