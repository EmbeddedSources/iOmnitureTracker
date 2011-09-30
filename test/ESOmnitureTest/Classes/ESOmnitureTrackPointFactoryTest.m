#import <ESOmniture/Detail/ESOmnitureMediaTrackPoint.h>
#import <ESOmniture/Detail/ESOmnitureTrackPointFactory.h>

@interface ESOmnitureTrackPointFactoryTest : GHTestCase

@end

@implementation ESOmnitureTrackPointFactoryTest

-(void)testPointsFactory
{
   ESOmnitureTrackPointFactory* factory_ = [ ESOmnitureTrackPointFactory factoryWithLength: 200.0 ];
   NSDictionary* cue_points_ = [ factory_ pointsWithCuePointsValue: @"50:quarter,100:half,199:last" ];
   NSDictionary* expected_cue_result_ = [ NSDictionary dictionaryWithObjectsAndKeys: [ ESOmnitureMediaTrackPoint cuePointWithName: @"quarter" ], [ NSNumber numberWithDouble: 50.0 ]
                                         , [ ESOmnitureMediaTrackPoint cuePointWithName: @"half" ], [ NSNumber numberWithDouble: 100.0 ]
                                         , [ ESOmnitureMediaTrackPoint cuePointWithName: @"last" ], [ NSNumber numberWithDouble: 199.0 ]
                                         , nil ];
   
   GHAssertTrue( [ cue_points_ isEqualToDictionary: expected_cue_result_ ], @"Check cue points parse" );
   
   NSDictionary* milestone_points_ = [ factory_ pointsWithMilestoneValue: @"10,50,75" ];
   NSDictionary* expected_milestone_result_ = [ NSDictionary dictionaryWithObjectsAndKeys: [ ESOmnitureMediaTrackPoint pointWithMilestone: 10.0 ], [ NSNumber numberWithDouble: 20.0 ]
                                               , [ ESOmnitureMediaTrackPoint pointWithMilestone: 50.0 ], [ NSNumber numberWithDouble: 100.0 ]
                                               , [ ESOmnitureMediaTrackPoint pointWithMilestone: 75.0 ], [ NSNumber numberWithDouble: 150.0 ]
                                               , nil ];
   
   GHAssertTrue( [ milestone_points_ isEqualToDictionary: expected_milestone_result_ ], @"Check miletstone points parse" );
}

@end
