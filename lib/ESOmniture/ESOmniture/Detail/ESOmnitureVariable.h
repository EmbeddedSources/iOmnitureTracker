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
@property ( nonatomic, copy ) NSString* value;

@end

@interface ESOmnitureContext : NSObject
{
@private
   NSArray* _variables;
}

+(id)context;

-(ESOmnitureVariable*)variableWithName:( NSString* )name_;

-(NSString*)urlArguments;

@end
