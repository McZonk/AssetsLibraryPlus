#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibrary (ALPLastAsset)

- (void)lastAssetWithCompletionHandler:(void(^)(ALAsset *asset, NSError *error))completionHandler;

@end
