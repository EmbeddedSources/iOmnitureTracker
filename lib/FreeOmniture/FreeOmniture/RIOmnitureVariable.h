#import <Foundation/Foundation.h>

extern NSString* const RIOmnitureVariableTimestamp;
extern NSString* const RIOmnitureVariableVisitorId;
extern NSString* const RIOmnitureVariableVisitorNamespace;
extern NSString* const RIOmnitureVariablePageName;
extern NSString* const RIOmnitureVariableEvents;

@interface RIOmnitureVariable : NSObject
{
@private
   NSString* _name;
   NSString* _value;
}

@property ( nonatomic, copy, readonly ) NSString* name;
@property ( nonatomic, copy ) NSString* value;

@end

@interface RIOmnitureContext : NSObject
{
@private
   NSArray* _variables;
}

+(id)context;

-(RIOmnitureVariable*)variableWithName:( NSString* )name_;

-(NSString*)urlArguments;

@end
