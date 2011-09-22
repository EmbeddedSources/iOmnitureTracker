#import <Foundation/Foundation.h>

@class ESOmnitureMedia;
@class ESOmnitureMediaState;

@protocol ESOmnitureMediaDelegate< NSObject >

-(void)media:( ESOmnitureMedia* )media_
didChangeState:( ESOmnitureMediaState* )state_;

@end
