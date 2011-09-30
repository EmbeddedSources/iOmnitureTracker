#import "ESOmnitureTrackPointFactory.h"

#import "ESOmnitureMediaTrackPoint.h"

enum
{
   ESOmnitureCuePointOffsetIndex
   , ESOmnitureCuePointNameIndex
   , ESOmnitureCuePointFieldsCount
};

@interface ESOmnitureTrackPointFactory ()

@property ( nonatomic, assign ) NSTimeInterval length;

@end


@implementation ESOmnitureTrackPointFactory

@synthesize length = _length;

+(id)factoryWithLength:( NSTimeInterval )length_
{
   ESOmnitureTrackPointFactory* factory_ = [ [ self alloc ] init ];
   factory_.length = length_;
   return [ factory_ autorelease ];
}

-(NSDictionary*)pointsWithMilestoneValue:( NSString* )milestone_
{
   NSArray* milestones_ = [ milestone_ componentsSeparatedByString: @"," ];
   NSMutableDictionary* points_ = [ NSMutableDictionary dictionaryWithCapacity: [ milestones_ count ] ];
   
   for ( NSString* point_ in milestones_ )
   {
      double milestone_ = [ point_ doubleValue ];
      NSNumber* offset_ = [ NSNumber numberWithDouble: ceil( milestone_ * self.length / 100.0 ) ];
      if ( ![ points_ objectForKey: offset_ ] )
      {
         [ points_ setObject: [ ESOmnitureMediaTrackPoint pointWithMilestone: milestone_ ]
                      forKey: offset_ ];
      }
   }

   return points_;
}

-(NSDictionary*)pointsWithCuePointsValue:( NSString* )cue_points_
{
   NSArray* points_array_ = [ cue_points_ componentsSeparatedByString: @"," ];
   NSMutableDictionary* points_ = [ NSMutableDictionary dictionaryWithCapacity: [ points_array_ count ] ];
   
   for ( NSString* point_ in points_array_ )
   {
      NSArray* point_info_ = [ point_ componentsSeparatedByString: @":" ];
      if ( [ point_info_ count ] >= ESOmnitureCuePointFieldsCount )
      {
         NSNumber* offset_ = [ NSNumber numberWithDouble: [ [ point_info_ objectAtIndex: ESOmnitureCuePointOffsetIndex ] doubleValue ] ];
         [ points_ setObject: [ ESOmnitureMediaTrackPoint cuePointWithName: [ point_info_ objectAtIndex: ESOmnitureCuePointNameIndex ] ]
                      forKey: offset_ ];
      }
   }
   
   return points_;
}

@end
