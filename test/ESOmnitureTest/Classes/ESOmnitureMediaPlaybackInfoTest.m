#import <ESOmniture/Detail/ESOmnitureMediaTrackPoint.h>
#import <ESOmniture/Detail/ESOmnitureMediaPlaybackInfo.h>

@interface ESOmnitureMediaPlaybackInfoTest : GHTestCase

@end

@implementation ESOmnitureMediaPlaybackInfoTest

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
