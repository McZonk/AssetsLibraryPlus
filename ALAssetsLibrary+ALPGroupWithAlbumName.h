#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibrary (ALPGroupWithAlbumName)

- (void)assetsGroupWithAlbumName:(NSString *)name create:(BOOL)create resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock;

@end
