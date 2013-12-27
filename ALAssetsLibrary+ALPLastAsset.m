#import "ALAssetsLibrary+ALPLastAsset.h"

@implementation ALAssetsLibrary (ALPLastAsset)

- (void)lastAssetWithCompletionHandler:(void(^)(ALAsset *asset, NSError *error))completionHandler
{
	completionHandler = [completionHandler copy];
	
	[self enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
		[group setAssetsFilter:ALAssetsFilter.allPhotos];
		
		NSUInteger numberOfAssets = group.numberOfAssets;
		if(numberOfAssets > 0)
		{
			[group enumerateAssetsAtIndexes:[NSIndexSet indexSetWithIndex:numberOfAssets-1] options:0 usingBlock:^(ALAsset* asset, NSUInteger index, BOOL* stop) {

				dispatch_async(dispatch_get_main_queue(), ^{
					if(asset != nil)
					{
						if(completionHandler != nil)
						{
							completionHandler(asset, nil);
						}
					}
				});
			
				*stop = YES;
			}];
		}
		*stop = YES;
	} failureBlock:^(NSError *error) {
		if(error != nil)
		{
			if(completionHandler != nil)
			{
				completionHandler(nil, error);
			}
		}
	}];
	
}

@end
