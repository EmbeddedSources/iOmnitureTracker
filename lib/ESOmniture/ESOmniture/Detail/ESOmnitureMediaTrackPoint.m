#import "ESOmnitureMediaTrackPoint.h"

@interface ESOmnitureMediaTrackPoint ()

@property ( nonatomic, assign ) ESOmnitureMediaTrackPointType type;
@property ( nonatomic, assign ) double milestone;
@property ( nonatomic, retain ) NSString* name;

@end

@implementation ESOmnitureMediaTrackPoint

@synthesize type = _type;
@synthesize milestone = _milestone;
@synthesize name = _name;

-(id)initWithType:( ESOmnitureMediaTrackPointType )type_
        milestone:( double )milestone_
             name:( NSString* )name_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.type = type_;
   self.milestone = milestone_;
   self.name = name_;

   return self;
}

+(id)pointWithType:( ESOmnitureMediaTrackPointType )type_
{
   return [ [ [ self alloc ] initWithType: type_
                                milestone: 0.0
                                     name: nil ] autorelease ];
}

+(id)openPoint
{
   return [ self pointWithType: ESOmnitureMediaTrackPointOpen ];
}

+(id)closePoint
{
   return [ self pointWithType: ESOmnitureMediaTrackPointClose ];
}

+(id)playPoint
{
   return [ self pointWithType: ESOmnitureMediaTrackPointPlay ];
}

+(id)stopPoint
{
   return [ self pointWithType: ESOmnitureMediaTrackPointStop ];
}

+(id)cuePointWithName:( NSString* )name_
{
   return [ [ [ self alloc ] initWithType: ESOmnitureMediaTrackPointCuepoint
                                milestone: 0.0
                                     name: name_ ] autorelease ];
}

+(id)monitorPoint
{
   return [ self pointWithType: ESOmnitureMediaTrackPointMonitor ];
}

+(id)pointWithMilestone:( double )percent_
{
   return [ [ [ self alloc ] initWithType: ESOmnitureMediaTrackPointMilestone
                                milestone: percent_
                                     name: nil ] autorelease ];
}

+(id)secondsPoint
{
   return [ self pointWithType: ESOmnitureMediaTrackPointSeconds ];
}

-(NSString*)stringType
{
   switch ( self.type )
   {
      case ESOmnitureMediaTrackPointMonitor:
         return @"MONITOR";
      case ESOmnitureMediaTrackPointMilestone:
         return @"MILESTONE";
      case ESOmnitureMediaTrackPointCuepoint:
         return @"CUEPOINT";
      case ESOmnitureMediaTrackPointSeconds:
         return @"SECONDS";
      case ESOmnitureMediaTrackPointOpen:
         return @"OPEN";
      case ESOmnitureMediaTrackPointClose:
         return @"CLOSE";
      case ESOmnitureMediaTrackPointPlay:
         return @"PLAY";
      case ESOmnitureMediaTrackPointStop:
         return @"STOP";
   }

   return nil;
}

-(NSUInteger)hash
{
   return INT_MAX * ( self.milestone + self.type );
}

-(BOOL)isEqual:( id )other_
{
   if ( [ other_ class ] != [ self class ] )
      return NO;

   ESOmnitureMediaTrackPoint* other_point_ = ( ESOmnitureMediaTrackPoint* )other_;

   return self.type == other_point_.type && self.milestone == other_point_.milestone;
}

@end
