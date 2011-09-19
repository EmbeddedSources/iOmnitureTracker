#import <Foundation/Foundation.h>

extern NSString* const ESOmnitureVariableTimestamp;
extern NSString* const ESOmnitureVariableVisitorId;
extern NSString* const ESOmnitureVariableVisitorNamespace;
extern NSString* const ESOmnitureVariablePageName;
extern NSString* const ESOmnitureVariableEvents;
extern NSString* const ESOmnitureVariableCharset;
extern NSString* const ESOmnitureVariableLinkType;
extern NSString* const ESOmnitureVariableLinkURL;
extern NSString* const ESOmnitureVariableLinkName;
extern NSString* const ESOmnitureVariableVideoReports;

NSString* ESOmnitureVariableEVar( NSUInteger index_ );
NSString* ESOmnitureVariableProp( NSUInteger index_ );

@interface ESOmnitureVariable : NSObject< NSCopying >
{
@private
   NSString* _name;
   NSString* _value;
}

@property ( nonatomic, copy, readonly ) NSString* name;
@property ( nonatomic, copy, readonly ) NSString* value;
@property ( nonatomic, assign, readonly ) BOOL isDefined;

+(id)variableWithName:( NSString* )name_
                value:( NSString* )value_;

-(NSString*)argumentValue;

@end


@interface ESMutableOmnitureVariable : ESOmnitureVariable

@property ( nonatomic, copy ) NSString* value;

+(id)variableWithName:( NSString* )name_;

+(id)eVarWithIndex:( NSUInteger )index_;

+(id)propWithIndex:( NSUInteger )index_;

@end


@interface ESRequiredOmnitureVariable : ESMutableOmnitureVariable

@end
