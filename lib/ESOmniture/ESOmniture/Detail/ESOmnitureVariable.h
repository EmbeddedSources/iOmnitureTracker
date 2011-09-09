#import <Foundation/Foundation.h>

extern NSString* const ESOmnitureVariableTimestamp;
extern NSString* const ESOmnitureVariableVisitorId;
extern NSString* const ESOmnitureVariableVisitorNamespace;
extern NSString* const ESOmnitureVariablePageName;
extern NSString* const ESOmnitureVariableEvents;

NSString* ESOmnitureVariableEVar( NSUInteger index_ );
NSString* ESOmnitureVariableProp( NSUInteger index_ );

@interface ESOmnitureVariable : NSObject
{
@private
   NSString* _name;
   NSString* _value;
}

@property ( nonatomic, copy, readonly ) NSString* name;
@property ( nonatomic, copy, readonly ) NSString* value;

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
