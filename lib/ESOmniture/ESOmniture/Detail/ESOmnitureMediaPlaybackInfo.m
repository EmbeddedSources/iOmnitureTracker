#import "ESOmnitureMediaPlaybackInfo.h"

#import "ESOmnitureMediaTrackPoint.h"
#import "ESOmnitureTrackPointFactory.h"

@interface ESOmnitureMediaPlaybackInfo ()

@property ( nonatomic, assign ) NSTimeInterval trackSeconds;
@property ( nonatomic, retain ) NSMutableDictionary* info;

-(void)addTrackPoints:( NSDictionary* )points_;

-(void)addTrackPoint:( ESOmnitureMediaTrackPoint* )point_
           forOffset:( NSTimeInterval )offset_;

@end

@implementation ESOmnitureMediaPlaybackInfo

@synthesize trackSeconds = _track_seconds;
@synthesize info = _info;

-(void)dealloc
{
   [ _info release ];
   
   [ super dealloc ];
}

-(id)initWithTrackSeconds:( NSTimeInterval )track_seconds_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.trackSeconds = track_seconds_;
   self.info = [ NSMutableDictionary dictionary ];

   return self;
}

+(id)playbackInfoWithLength:( NSTimeInterval )length_
                  cuePoints:( NSString* )cue_points_
                 milestones:( NSString* )milestones_
               trackSeconds:( NSTimeInterval )track_seconds_
{
   ESOmnitureMediaPlaybackInfo* info_ = [ [ self alloc ] initWithTrackSeconds: track_seconds_ ];
   ESOmnitureTrackPointFactory* factory_ = [ ESOmnitureTrackPointFactory factoryWithLength: length_ ];
   [ info_ addTrackPoints: [ factory_ pointsWithCuePointsValue: cue_points_ ] ];
   [ info_ addTrackPoints: [ factory_ pointsWithMilestoneValue: milestones_ ] ];
   return [ info_ autorelease ];
}

-(NSNumber*)keyForOffset:( NSTimeInterval )offset_
{
   return [ NSNumber numberWithInt: (int)offset_ ];
}

-(void)addTrackPoints:( NSDictionary* )points_
{
   for ( NSNumber* offset_ in points_ )
   {
      ESOmnitureMediaTrackPoint* point_ = [ points_ objectForKey: offset_ ];
      [ self addTrackPoint: point_ forOffset: [ offset_ doubleValue ] ];
   }
}

-(void)addTrackPoint:( ESOmnitureMediaTrackPoint* )point_
           forOffset:( NSTimeInterval )offset_
{
   NSNumber* offset_key_ = [ self keyForOffset: offset_ ];
   
   NSMutableSet* points_ = [ self.info objectForKey: offset_key_ ];
   if ( !points_ )
   {
      points_ = [ NSMutableSet setWithObject: point_ ];
      [ self.info setObject: points_ forKey: offset_key_ ];
   }
   else
   {
      [ points_ addObject: point_ ];
   }
}

-(BOOL)shouldTrackTimePlayed:( NSTimeInterval )time_played_
{
   if ( self.trackSeconds <= 0.0 || time_played_ == 0.0 )
      return NO;

   return fmod( time_played_, self.trackSeconds ) == 0.0;
}

-(NSSet*)trackPointsForOffset:( NSTimeInterval )offset_
                   timePlayed:( NSTimeInterval )time_played_
{
   NSMutableSet* points_ = [ NSMutableSet setWithObject: [ ESOmnitureMediaTrackPoint monitorPoint ] ];
   NSSet* predefined_points_ = [ self.info objectForKey: [ self keyForOffset: offset_ ] ];

   [ points_ unionSet: predefined_points_ ];

   if ( [ self shouldTrackTimePlayed: time_played_ ] )
   {
      [ points_ addObject: [ ESOmnitureMediaTrackPoint secondsPoint ] ];
   }

   return points_;
}

@end