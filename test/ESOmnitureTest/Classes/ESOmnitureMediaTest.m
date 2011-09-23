//#import <ESOmniture/ESOmnitureMedia.h>
//#import <ESOmniture/ESOmnitureMediaDelegate.h>

#import <ESOmniture/Detail/ESOmnitureMediaTrackPoint.h>
#import <ESOmniture/Detail/ESOmnitureMediaPlaybackInfo.h>
#import <ESOmniture/Detail/ESOmnitureTrackPointFactory.h>

@interface ESOmnitureMediaTest : GHTestCase

@end

@implementation ESOmnitureMediaTest

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

   NSDictionary* second_points_ = [ factory_ pointsWithDuration: 50.0 ];
   NSDictionary* expected_second_result_ = [ NSDictionary dictionaryWithObjectsAndKeys: [ ESOmnitureMediaTrackPoint secondsPoint ], [ NSNumber numberWithDouble: 50.0 ]
                                            , [ ESOmnitureMediaTrackPoint secondsPoint ], [ NSNumber numberWithDouble: 100.0 ]
                                            , [ ESOmnitureMediaTrackPoint secondsPoint ], [ NSNumber numberWithDouble: 150.0 ]
                                            , nil ];

   GHAssertTrue( [ second_points_ isEqualToDictionary: expected_second_result_ ], @"Check second points generation" );
}

-(void)testPlaybackInfo
{
   ESOmnitureMediaPlaybackInfo* playback_ = [ ESOmnitureMediaPlaybackInfo playbackInfoWithLength: 100.0
                                                                                       cuePoints: @"10:ten,30:thirty,60:sixty"
                                                                                      milestones: @"10,50,60"
                                                                                    trackSeconds: 20 ];

   NSSet* points_10_ = [ playback_ trackPointsForOffset: 10.0 ];
   NSSet* expected_points_10_ = [ NSSet setWithObjects: [ ESOmnitureMediaTrackPoint monitorPoint ]
                                 , [ ESOmnitureMediaTrackPoint cuePointWithName: @"ten" ]
                                 , [ ESOmnitureMediaTrackPoint pointWithMilestone: 10.0 ]
                                 , nil ];

   GHAssertTrue( [ points_10_ isEqualToSet: expected_points_10_ ], @"Check points with offset 10" );

   NSSet* points_35_ = [ playback_ trackPointsForOffset: 35.0 ];
   NSSet* expected_points_35_ = [ NSSet setWithObjects: [ ESOmnitureMediaTrackPoint monitorPoint ], nil ];

   GHAssertTrue( [ points_35_ isEqualToSet: expected_points_35_ ], @"Check points with offset 35" );

   NSSet* points_60_ = [ playback_ trackPointsForOffset: 60.0 ];
   NSSet* expected_points_60_ = [ NSSet setWithObjects: [ ESOmnitureMediaTrackPoint monitorPoint ]
                                 , [ ESOmnitureMediaTrackPoint cuePointWithName: @"sixty" ]
                                 , [ ESOmnitureMediaTrackPoint pointWithMilestone: 60.0 ]
                                 , [ ESOmnitureMediaTrackPoint secondsPoint ]
                                 , nil ];

   GHAssertTrue( [ points_60_ isEqualToSet: expected_points_60_ ], @"Check points with offset 60" );
}

@end
