#import "ESOmnitureMediaPlaybackInfo.h"

#import "ESOmnitureMediaTrackPoint.h"
#import "ESOmnitureTrackPointFactory.h"

@interface ESOmnitureMediaPlaybackInfo ()

@property ( nonatomic, retain ) NSMutableDictionary* info;

@end

@implementation ESOmnitureMediaPlaybackInfo

@synthesize info = _info;

-(void)dealloc
{
   [ _info release ];
   
   [ super dealloc ];
}

-(id)init
{
   if ( !( self = [ super init ] ) )
      return nil;
   
   self.info = [ NSMutableDictionary dictionary ];
   
   return self;
}

+(id)playbackInfoWithLength:( NSTimeInterval )length_
                  cuePoints:( NSString* )cue_points_
                 milestones:( NSString* )milestones_
               trackSeconds:( NSTimeInterval )track_seconds_
{
   ESOmnitureMediaPlaybackInfo* info_ = [ [ self alloc ] init ];
   ESOmnitureTrackPointFactory* facory_ = [ ESOmnitureTrackPointFactory factoryWithLength: length_ ];
   [ info_ addTrackPoints: [ facory_ pointsWithCuePointsValue: cue_points_ ] ];
   [ info_ addTrackPoints: [ facory_ pointsWithMilestoneValue: milestones_ ] ];
   [ info_ addTrackPoints: [ facory_ pointsWithDuration: track_seconds_ ] ];
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

-(NSSet*)trackPointsForOffset:( NSTimeInterval )offset_
{
   NSSet* points_ = [ self.info objectForKey: [ self keyForOffset: offset_ ] ];
   
   if ( !points_ )
   {
      return [ NSSet setWithObject: [ ESOmnitureMediaTrackPoint monitorPoint ] ];
   }
   
   NSMutableSet* all_points_ = [ NSMutableSet setWithSet: points_ ];
   [ all_points_ addObject: [ ESOmnitureMediaTrackPoint monitorPoint ] ];
   
   return all_points_;
}

@end