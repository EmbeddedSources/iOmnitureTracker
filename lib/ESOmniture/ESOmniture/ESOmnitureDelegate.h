#import <Foundation/Foundation.h>

@class ESOmniture;

@protocol ESOmnitureDelegate< NSObject >

-(void)omnitureDoPlugins:( ESOmniture* )omniture_;

@end
