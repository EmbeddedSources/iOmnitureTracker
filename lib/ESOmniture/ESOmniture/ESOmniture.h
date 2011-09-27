#import <Foundation/Foundation.h>

extern NSString* const ESOmnitureCustomLink;
extern NSString* const ESOmnitureDownloadLink;
extern NSString* const ESOmnitureExitLink;

extern NSString* const ESOmnitureVideoReportStart;
extern NSString* const ESOmnitureVideoReportOthers;

@class ESOmnitureMedia;

@protocol ESOmnitureDelegate;

@interface ESOmniture : NSObject

@property ( nonatomic, assign ) id< ESOmnitureDelegate > delegate;

@property ( nonatomic, copy ) NSString* account;
@property ( nonatomic, copy ) NSString* dc;
@property ( nonatomic, copy ) NSString* visitorNamespace;
@property ( nonatomic, copy ) NSString* visitorId;
@property ( nonatomic, copy ) NSString* charSet;
@property ( nonatomic, copy ) NSString* pageName;
@property ( nonatomic, copy ) NSString* events;

@property ( nonatomic, assign ) BOOL debugTracking;
@property ( nonatomic, assign ) BOOL usePlugins;

@property ( nonatomic, copy ) NSString* prop1;
@property ( nonatomic, copy ) NSString* prop2;
@property ( nonatomic, copy ) NSString* prop3;
@property ( nonatomic, copy ) NSString* prop4;
@property ( nonatomic, copy ) NSString* prop5;
@property ( nonatomic, copy ) NSString* prop6;
@property ( nonatomic, copy ) NSString* prop7;
@property ( nonatomic, copy ) NSString* prop8;
@property ( nonatomic, copy ) NSString* prop9;
@property ( nonatomic, copy ) NSString* prop10;
@property ( nonatomic, copy ) NSString* prop11;
@property ( nonatomic, copy ) NSString* prop12;
@property ( nonatomic, copy ) NSString* prop13;
@property ( nonatomic, copy ) NSString* prop14;
@property ( nonatomic, copy ) NSString* prop15;
@property ( nonatomic, copy ) NSString* prop16;
@property ( nonatomic, copy ) NSString* prop17;
@property ( nonatomic, copy ) NSString* prop18;
@property ( nonatomic, copy ) NSString* prop19;
@property ( nonatomic, copy ) NSString* prop20;
@property ( nonatomic, copy ) NSString* prop21;
@property ( nonatomic, copy ) NSString* prop22;
@property ( nonatomic, copy ) NSString* prop23;
@property ( nonatomic, copy ) NSString* prop24;
@property ( nonatomic, copy ) NSString* prop25;
@property ( nonatomic, copy ) NSString* prop26;
@property ( nonatomic, copy ) NSString* prop27;
@property ( nonatomic, copy ) NSString* prop28;
@property ( nonatomic, copy ) NSString* prop29;
@property ( nonatomic, copy ) NSString* prop30;
@property ( nonatomic, copy ) NSString* prop31;
@property ( nonatomic, copy ) NSString* prop32;
@property ( nonatomic, copy ) NSString* prop33;
@property ( nonatomic, copy ) NSString* prop34;
@property ( nonatomic, copy ) NSString* prop35;
@property ( nonatomic, copy ) NSString* prop36;
@property ( nonatomic, copy ) NSString* prop37;
@property ( nonatomic, copy ) NSString* prop38;
@property ( nonatomic, copy ) NSString* prop39;
@property ( nonatomic, copy ) NSString* prop40;
@property ( nonatomic, copy ) NSString* prop41;
@property ( nonatomic, copy ) NSString* prop42;
@property ( nonatomic, copy ) NSString* prop43;
@property ( nonatomic, copy ) NSString* prop44;
@property ( nonatomic, copy ) NSString* prop45;
@property ( nonatomic, copy ) NSString* prop46;
@property ( nonatomic, copy ) NSString* prop47;
@property ( nonatomic, copy ) NSString* prop48;
@property ( nonatomic, copy ) NSString* prop49;
@property ( nonatomic, copy ) NSString* prop50;
@property ( nonatomic, copy ) NSString* eVar1;
@property ( nonatomic, copy ) NSString* eVar2;
@property ( nonatomic, copy ) NSString* eVar3;
@property ( nonatomic, copy ) NSString* eVar4;
@property ( nonatomic, copy ) NSString* eVar5;
@property ( nonatomic, copy ) NSString* eVar6;
@property ( nonatomic, copy ) NSString* eVar7;
@property ( nonatomic, copy ) NSString* eVar8;
@property ( nonatomic, copy ) NSString* eVar9;
@property ( nonatomic, copy ) NSString* eVar10;
@property ( nonatomic, copy ) NSString* eVar11;
@property ( nonatomic, copy ) NSString* eVar12;
@property ( nonatomic, copy ) NSString* eVar13;
@property ( nonatomic, copy ) NSString* eVar14;
@property ( nonatomic, copy ) NSString* eVar15;
@property ( nonatomic, copy ) NSString* eVar16;
@property ( nonatomic, copy ) NSString* eVar17;
@property ( nonatomic, copy ) NSString* eVar18;
@property ( nonatomic, copy ) NSString* eVar19;
@property ( nonatomic, copy ) NSString* eVar20;
@property ( nonatomic, copy ) NSString* eVar21;
@property ( nonatomic, copy ) NSString* eVar22;
@property ( nonatomic, copy ) NSString* eVar23;
@property ( nonatomic, copy ) NSString* eVar24;
@property ( nonatomic, copy ) NSString* eVar25;
@property ( nonatomic, copy ) NSString* eVar26;
@property ( nonatomic, copy ) NSString* eVar27;
@property ( nonatomic, copy ) NSString* eVar28;
@property ( nonatomic, copy ) NSString* eVar29;
@property ( nonatomic, copy ) NSString* eVar30;
@property ( nonatomic, copy ) NSString* eVar31;
@property ( nonatomic, copy ) NSString* eVar32;
@property ( nonatomic, copy ) NSString* eVar33;
@property ( nonatomic, copy ) NSString* eVar34;
@property ( nonatomic, copy ) NSString* eVar35;
@property ( nonatomic, copy ) NSString* eVar36;
@property ( nonatomic, copy ) NSString* eVar37;
@property ( nonatomic, copy ) NSString* eVar38;
@property ( nonatomic, copy ) NSString* eVar39;
@property ( nonatomic, copy ) NSString* eVar40;
@property ( nonatomic, copy ) NSString* eVar41;
@property ( nonatomic, copy ) NSString* eVar42;
@property ( nonatomic, copy ) NSString* eVar43;
@property ( nonatomic, copy ) NSString* eVar44;
@property ( nonatomic, copy ) NSString* eVar45;
@property ( nonatomic, copy ) NSString* eVar46;
@property ( nonatomic, copy ) NSString* eVar47;
@property ( nonatomic, copy ) NSString* eVar48;
@property ( nonatomic, copy ) NSString* eVar49;
@property ( nonatomic, copy ) NSString* eVar50;

@property ( nonatomic, retain, readonly ) ESOmnitureMedia* Media;

-(void)track;
-(void)track:( NSDictionary* )variable_overrides_;

-(void)trackLink:( NSString* )link_url_
        linkType:( NSString* )link_type_
        linkName:( NSString* )link_name_;

-(void)trackLink:( NSString* )link_url_
        linkType:( NSString* )link_type_
        linkName:( NSString* )link_name_
variableOverrides:( NSDictionary* )variable_overrides_;

-(void)trackVideoReport:( NSString* )video_report_
             reportType:( NSString* )report_type_;

@end
