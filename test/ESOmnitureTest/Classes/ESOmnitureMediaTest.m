#import <ESOmniture/ESOmniture.h>
#import <ESOmniture/ESOmnitureDelegate.h>
#import <ESOmniture/ESOmnitureMedia.h>
#import <ESOmniture/Detail/ESOmnitureVariable.h>

@interface ESOmnitureMediaCheckDelegate : NSObject< ESOmnitureDelegate >

@property ( nonatomic, retain ) NSArray* reports;
@property ( nonatomic, retain ) GHAsyncTestCase* testCase;
@property ( nonatomic, assign ) SEL testSelector;
@property ( nonatomic, assign ) NSUInteger reportIndex;


@end

@implementation ESOmnitureMediaCheckDelegate

@synthesize reports = _reports;
@synthesize testCase = _test_case;
@synthesize testSelector = _test_selector;
@synthesize reportIndex = _report_index;

-(void)dealloc
{
   [ _reports release ];
   [ _test_case release ];

   [ super dealloc ];
}

-(id)initWithReports:( NSArray* )reports_
       asyncTestCase:( GHAsyncTestCase* )test_case_
            selector:( SEL )selector_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.reports = reports_;
   self.testCase = test_case_;
   self.testSelector = selector_;

   return self;
}

+(id)checkDelegateWithReports:( NSArray* )reports_
                asyncTestCase:( GHAsyncTestCase* )test_case_
                     selector:( SEL )selector_
{
   return [ [ [ self alloc ] initWithReports: reports_
                               asyncTestCase: test_case_
                                    selector: selector_ ] autorelease ];
}

-(void)omnitureDoPlugins:( ESOmniture* )omniture_
{
   NSString* expected_pe_ = self.reportIndex == 0
      ? ESOmnitureVideoReportStart
      : ESOmnitureVideoReportOthers;
   NSString* pe_ = [ omniture_ valueForKey: ESOmnitureVariableLinkType ];

   if ( ![ pe_ isEqualToString: expected_pe_ ] )
   {
      [ self.testCase notify: kGHUnitWaitStatusFailure forSelector: self.testSelector ];
      return;
   }

   NSString* expected_pev3_ = [ self.reports objectAtIndex: self.reportIndex ];
   NSString* pev3_ = [ omniture_ valueForKey: ESOmnitureVariableVideoReports ];

   if ( ![ pev3_ isEqualToString: expected_pev3_ ] )
   {
      [ self.testCase notify: kGHUnitWaitStatusFailure forSelector: self.testSelector ];
      return;
   }

   self.reportIndex += 1;

   if ( self.reportIndex == [ self.reports count ] )
   {
      [ self.testCase notify: kGHUnitWaitStatusSuccess forSelector: self.testSelector ];
   }
}

@end


@interface ESOmnitureMediaTest : GHAsyncTestCase

@property ( nonatomic, retain ) ESOmniture* omniture;

@end

@implementation ESOmnitureMediaTest

@synthesize omniture = _omniture;

-(void)dealloc
{
   [ _omniture release ];

   [ super dealloc ];
}

-(void)setUp
{
   ESOmniture* omniture_ = [ [ ESOmniture alloc ] init ];
   
   omniture_.usePlugins = YES;
   omniture_.visitorNamespace = @"RequiredVariable";
   
   self.omniture = omniture_;
   
   [ omniture_ release ];
}

-(void)tearDown
{
   self.omniture = nil;
}

-(void)testReportTypes
{
   GHAssertTrue( [ ESOmnitureVideoReportOthers isEqualToString: @"m_o" ]
                , @"ESOmnitureVideoReportOthers"
                );

   GHAssertTrue( [ ESOmnitureVideoReportStart isEqualToString: @"m_s" ]
                , @"ESOmnitureVideoReportStart"
                );
}

-(void)testVideoPoints
{
   [ self prepare ];

   NSString* report_format_ = @"VideoPoints--**--18--**--PlayerName--**--%d--**--%d--**--%@";
   NSTimeInterval timestamp_ = [ [ NSDate date ] timeIntervalSince1970 ];

   NSArray* reports_ = [ NSArray arrayWithObjects: [ NSString stringWithFormat: report_format_, 0, (int)timestamp_, @"S1L1" ]//Start: 2
                        , [ NSString stringWithFormat: report_format_, 1, (int)timestamp_, @"L1L2" ]//Cue Point: 3:first
                        , [ NSString stringWithFormat: report_format_, 4, (int)timestamp_, @"L2L5" ]//Cue Point: 6:second
                        , [ NSString stringWithFormat: report_format_, 5, (int)timestamp_, @"L5L6" ]//Second: 5
                        , [ NSString stringWithFormat: report_format_, 7, (int)timestamp_, @"L6L8" ]//Milestone: 50
                        , [ NSString stringWithFormat: report_format_, 10, (int)timestamp_, @"L8L11" ]//Second: 10
                        , [ NSString stringWithFormat: report_format_, 15, (int)timestamp_, @"L11L16" ]//Second: 15
                        , [ NSString stringWithFormat: report_format_, 16, (int)timestamp_, @"L16E17" ]//End: 18
                        , nil ];

   self.omniture.delegate = [ ESOmnitureMediaCheckDelegate checkDelegateWithReports: reports_                                                                           
                                                                  asyncTestCase: self
                                                                       selector: _cmd ];

   self.omniture.Media.trackSeconds = 5.0;
   self.omniture.Media.cuePoints = @"3:first,6:second";
   self.omniture.Media.trackMilestones = @"50";
   self.omniture.Media.trackAtCuePoints = YES;

   [ self.omniture.Media open: @"VideoPoints" length: 18.0 playerName: @"PlayerName" ];
   [ self.omniture.Media play: @"VideoPoints" offset: 2.0 ];

   [ self.omniture.Media performSelector: @selector( close: ) withObject: @"VideoPoints" afterDelay: 17.0 ];
   
   [ self waitForStatus: kGHUnitWaitStatusSuccess timeout: 18.0 ];
}

-(void)action_1:( ESOmniture* )omniture_
{
   [ omniture_.Media stop: @"VideoActions" offset: 5.0 ];
   [ self performSelector: @selector( action_2: ) withObject: omniture_ afterDelay: 5.0 ];
}

-(void)action_2:( ESOmniture* )omniture_
{
   [ omniture_.Media play: @"VideoActions" offset: 14.0 ];
   [ self performSelector: @selector( action_3: ) withObject: omniture_ afterDelay: 5.0 ];
}

-(void)action_3:( ESOmniture* )omniture_
{
   [ omniture_.Media close: @"VideoActions" ];
}

-(void)testVideoActions
{
   [ self prepare ];

   NSString* report_format_ = @"VideoActions--**--18--**--PlayerName--**--%d--**--%d--**--%@";
   NSTimeInterval timestamp_ = [ [ NSDate date ] timeIntervalSince1970 ];
   
   NSArray* reports_ = [ NSArray arrayWithObjects: [ NSString stringWithFormat: report_format_, 0, (int)timestamp_, @"S0L0" ]//Start: 0
                        , [ NSString stringWithFormat: report_format_, 4, (int)timestamp_, @"L0E4S13L14" ]//Second: 4
                        , [ NSString stringWithFormat: report_format_, 7, (int)timestamp_, @"L14E17" ]//End
                        , nil ];

   self.omniture.delegate = [ ESOmnitureMediaCheckDelegate checkDelegateWithReports: reports_                                                                           
                                                                  asyncTestCase: self
                                                                       selector: _cmd ];

   //trackAtCuePoints = NO by default
   self.omniture.Media.cuePoints = @"2:first";
   self.omniture.Media.trackSeconds = 4.0;

   [ self.omniture.Media open: @"VideoActions" length: 18.0 playerName: @"PlayerName" ];
   [ self.omniture.Media play: @"VideoActions" offset: 0.0 ];
   
   [ self performSelector: @selector( action_1: ) withObject: self.omniture afterDelay: 3.0 ];

   [ self waitForStatus: kGHUnitWaitStatusSuccess timeout: 20.0 ];
}

@end
