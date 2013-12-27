#import "ALAssetsLibrary+ALPWriteToAssetsGroup.h"

@implementation ALAssetsLibrary (ALPWriteToAssetsGroup)

- (void)writeImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata group:(ALAssetsGroup *)group completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
	[self writeImageDataToSavedPhotosAlbum:imageData metadata:metadata completionBlock:^(NSURL *assetURL, NSError *error) {
		if(group == nil)
		{
			if(completionBlock != nil)
			{
				completionBlock(assetURL, error);
			}
			return;
		}
		
		if(error != nil)
		{
			if(completionBlock != nil)
			{
				completionBlock(assetURL, error);
			}
			return;
		}
		
		[self assetForURL:assetURL resultBlock:^(ALAsset *asset) {
			if(asset != nil)
			{
				[group addAsset:asset];
			}
			
			if(completionBlock != nil)
			{
				completionBlock(assetURL, nil);
			}
		} failureBlock:^(NSError *error) {
			if(completionBlock != nil)
			{
				completionBlock(assetURL, error);
			}
		}];
	}];
}

@end