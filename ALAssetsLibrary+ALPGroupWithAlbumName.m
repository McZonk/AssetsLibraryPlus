#import "ALAssetsLibrary+ALPGroupWithAlbumName.h"

@implementation ALAssetsLibrary (ALPGroupWithAlbumName)

- (void)assetsGroupWithAlbumName:(NSString *)name create:(BOOL)create resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
	if(create)
	{
		__weak __typeof(self) weakSelf = self;
		[self addAssetsGroupAlbumWithName:name resultBlock:^(ALAssetsGroup *group) {
			__typeof(self) self = weakSelf;
			
			if(group != nil)
			{
				if(resultBlock)
				{
					resultBlock(group);
				}
				return;
			}
			
			[self assetsGroupWithAlbumName:name create:NO resultBlock:resultBlock failureBlock:failureBlock];
		} failureBlock:failureBlock];
		
		return;
	}
	
	[self enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
		if(group == nil)
		{
			if(*stop == NO)
			{
				if(resultBlock != nil)
				{
					resultBlock(nil);
				}
				*stop = YES;
			}
			return;
		}
		
		NSString *groupName = [group valueForProperty:ALAssetsGroupPropertyName];
		if([groupName isEqualToString:name])
		{
			if(resultBlock != nil)
			{
				resultBlock(group);
			}
			
			*stop = YES;
			return;
		}
	} failureBlock:failureBlock];
}

@end
