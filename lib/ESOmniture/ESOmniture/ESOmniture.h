#import <Foundation/Foundation.h>

extern NSString* const ESOmnitureCustomLink;
extern NSString* const ESOmnitureDownloadLink;
extern NSString* const ESOmnitureExitLink;

extern NSString* const ESOmnitureVideoReportStart;
extern NSString* const ESOmnitureVideoReportOthers;

@class ESOmnitureMedia;

@protocol ESOmnitureDelegate;

/** Omniture track engine.

 Read App_Measurement_for_iPhone_Implementation_Guide.pdf for details
 */

@interface ESOmniture : NSObject

/**
 @see usePlugins
 */
@property ( nonatomic, assign ) id< ESOmnitureDelegate > delegate;

/** @name Application config variables */

/** The report suite or report suites (multi-suite tagging) that you wish to track. Separate multiple report suites with commas.
 
 You cannot override this variable using variable overrides.
 */
@property ( nonatomic, copy ) NSString* account;

/** The Omniture collection servers that receive the event tracking data. Consult your Omniture representative to find out how you should set this value.
 
 112 specifies the San Jose, CA collection servers, while 122 specifies the Dallas, TX collection servers. By default, this variable is 112 (San Jose).
 */
@property ( nonatomic, copy ) NSString* dc;

/** The domain used to set cookies. For more information about namespace, see the SiteCatalyst Implementation Guide.
 */
@property ( nonatomic, copy ) NSString* visitorNamespace;

/** Unique identifier for each visitor.
 
 Default is iPhone device ID.
 */
@property ( nonatomic, copy ) NSString* visitorId;

/** User charset.
 
 Default is UTF-8
 */
@property ( nonatomic, copy ) NSString* charSet;

/** A Boolean value that determines whether track information should be print to console.
 
 Default is NO
 */
@property ( nonatomic, assign ) BOOL debugTracking;

/** A Boolean value that determines whether user can apply additional variables in delegate method [ESOmnitureDelegate omnitureDoPlugins:].
 
 Default is NO
 @see delegate
 */
@property ( nonatomic, assign ) BOOL usePlugins;

/** @name Track config variables */

/** Current page. Default is application name
 */
@property ( nonatomic, copy ) NSString* pageName;

/** Names of events separated with comma
 */
@property ( nonatomic, copy ) NSString* events;

/// User custom property
@property ( nonatomic, copy ) NSString* prop1;
/// User custom property
@property ( nonatomic, copy ) NSString* prop2;
/// User custom property
@property ( nonatomic, copy ) NSString* prop3;
/// User custom property
@property ( nonatomic, copy ) NSString* prop4;
/// User custom property
@property ( nonatomic, copy ) NSString* prop5;
/// User custom property
@property ( nonatomic, copy ) NSString* prop6;
/// User custom property
@property ( nonatomic, copy ) NSString* prop7;
/// User custom property
@property ( nonatomic, copy ) NSString* prop8;
/// User custom property
@property ( nonatomic, copy ) NSString* prop9;
/// User custom property
@property ( nonatomic, copy ) NSString* prop10;
/// User custom property
@property ( nonatomic, copy ) NSString* prop11;
/// User custom property
@property ( nonatomic, copy ) NSString* prop12;
/// User custom property
@property ( nonatomic, copy ) NSString* prop13;
/// User custom property
@property ( nonatomic, copy ) NSString* prop14;
/// User custom property
@property ( nonatomic, copy ) NSString* prop15;
/// User custom property
@property ( nonatomic, copy ) NSString* prop16;
/// User custom property
@property ( nonatomic, copy ) NSString* prop17;
/// User custom property
@property ( nonatomic, copy ) NSString* prop18;
/// User custom property
@property ( nonatomic, copy ) NSString* prop19;
/// User custom property
@property ( nonatomic, copy ) NSString* prop20;
/// User custom property
@property ( nonatomic, copy ) NSString* prop21;
/// User custom property
@property ( nonatomic, copy ) NSString* prop22;
/// User custom property
@property ( nonatomic, copy ) NSString* prop23;
/// User custom property
@property ( nonatomic, copy ) NSString* prop24;
/// User custom property
@property ( nonatomic, copy ) NSString* prop25;
/// User custom property
@property ( nonatomic, copy ) NSString* prop26;
/// User custom property
@property ( nonatomic, copy ) NSString* prop27;
/// User custom property
@property ( nonatomic, copy ) NSString* prop28;
/// User custom property
@property ( nonatomic, copy ) NSString* prop29;
/// User custom property
@property ( nonatomic, copy ) NSString* prop30;
/// User custom property
@property ( nonatomic, copy ) NSString* prop31;
/// User custom property
@property ( nonatomic, copy ) NSString* prop32;
/// User custom property
@property ( nonatomic, copy ) NSString* prop33;
/// User custom property
@property ( nonatomic, copy ) NSString* prop34;
/// User custom property
@property ( nonatomic, copy ) NSString* prop35;
/// User custom property
@property ( nonatomic, copy ) NSString* prop36;
/// User custom property
@property ( nonatomic, copy ) NSString* prop37;
/// User custom property
@property ( nonatomic, copy ) NSString* prop38;
/// User custom property
@property ( nonatomic, copy ) NSString* prop39;
/// User custom property
@property ( nonatomic, copy ) NSString* prop40;
/// User custom property
@property ( nonatomic, copy ) NSString* prop41;
/// User custom property
@property ( nonatomic, copy ) NSString* prop42;
/// User custom property
@property ( nonatomic, copy ) NSString* prop43;
/// User custom property
@property ( nonatomic, copy ) NSString* prop44;
/// User custom property
@property ( nonatomic, copy ) NSString* prop45;
/// User custom property
@property ( nonatomic, copy ) NSString* prop46;
/// User custom property
@property ( nonatomic, copy ) NSString* prop47;
/// User custom property
@property ( nonatomic, copy ) NSString* prop48;
/// User custom property
@property ( nonatomic, copy ) NSString* prop49;
/// User custom property
@property ( nonatomic, copy ) NSString* prop50;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar1;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar2;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar3;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar4;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar5;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar6;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar7;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar8;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar9;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar10;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar11;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar12;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar13;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar14;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar15;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar16;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar17;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar18;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar19;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar20;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar21;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar22;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar23;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar24;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar25;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar26;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar27;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar28;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar29;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar30;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar31;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar32;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar33;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar34;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar35;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar36;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar37;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar38;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar39;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar40;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar41;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar42;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar43;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar44;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar45;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar46;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar47;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar48;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar49;
/// User custom variable
@property ( nonatomic, copy ) NSString* eVar50;

/** Media is used for manipulating playback information, for defining what points should be tracked
 */
@property ( nonatomic, retain, readonly ) ESOmnitureMedia* Media;

/** @name Methods */

/** Sends a standard page view to Omniture collection servers, along with any Track Config Variables that have values.
 */
-(void)track;

/** Same as track, except you can pass in a list of key-value pairs that indicates temporary variable overrides for that track call.
 @param variable_overrides_ Variables that are overriden
 @see track:
 */
-(void)track:( NSDictionary* )variable_overrides_;

/** Sends custom, download or exit link data to Omniture collection servers, along with any track config variables that have values.
 
 Use trackLink to track all activity that should not capture a page view.
 @param link_url_ Identifies the clicked URL. If no URL is specified, the name is used. Use this only when linking to a Web page from within your iPhone application. Otherwise, pass in nil for this parameter.
 @param link_type_ Identifies the link report that will display the URL or name. Supported values include: ESOmnitureCustomLink, ESOmnitureExitLink or ESOmnitureDownloadLink
 @param link_name_ The name that appears in the link report. If no name is specified, the report uses the URL.
 @see trackLink:linkType:linkName:variableOverrides:
 */
-(void)trackLink:( NSString* )link_url_
        linkType:( NSString* )link_type_
        linkName:( NSString* )link_name_;

/** Same as trackLink:linkType:linkName:, except you can pass in a list of key-value pairs that indicates temporary variable overrides for that trackLink call.
 @param link_url_ Identifies the clicked URL. If no URL is specified, the name is used. Use this only when linking to a Web page from within your iPhone application. Otherwise, pass in nil for this parameter.
 @param link_type_ Identifies the link report that will display the URL or name. Supported values include: ESOmnitureCustomLink, ESOmnitureExitLink or ESOmnitureDownloadLink
 @param link_name_ The name that appears in the link report. If no name is specified, the report uses the URL.
 @param variable_overrides_ Variables that are overriden
 @see trackLink:linkType:linkName:
 */
-(void)trackLink:( NSString* )link_url_
        linkType:( NSString* )link_type_
        linkName:( NSString* )link_name_
variableOverrides:( NSDictionary* )variable_overrides_;

/** Sends media report information
 @param video_report_ Video playback summary
 @param report_type_ ESOmnitureVideoReportStart or ESOmnitureVideoReportOthers
 */
-(void)trackVideoReport:( NSString* )video_report_
             reportType:( NSString* )report_type_;

@end
