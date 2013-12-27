#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetRepresentation (ALPData)

- (NSData *)dataWithError:(NSError **)error;
- (NSData *)dataInRange:(NSRange)range error:(NSError **)error;

@end
