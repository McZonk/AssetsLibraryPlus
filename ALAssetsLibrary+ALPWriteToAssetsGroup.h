#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibrary (ALPWriteToAssetsGroup)

- (void)writeImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata group:(ALAssetsGroup *)group completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock;

@end
