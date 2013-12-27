#import "ALAssetRepresentation+ALPData.h"

@implementation ALAssetRepresentation (ALPData)

- (NSData *)dataWithError:(NSError **)error
{
	const long long size = self.size;
	if(size > NSUIntegerMax)
	{
		if(error)
		{
			*error = [NSError errorWithDomain:NSCocoaErrorDomain code:NSFileReadTooLargeError userInfo:nil];
		}
		return nil;
	}
	
	return [self dataInRange:NSMakeRange(0, size) error:error];
}

- (NSData *)dataInRange:(NSRange)range error:(NSError **)error
{
	NSMutableData* data = [NSMutableData dataWithLength:range.length];
	
	NSUInteger length = [self getBytes:data.mutableBytes fromOffset:range.location length:range.length error:error];
	
	if(length != range.length)
	{
		[data setLength:length];
	}
	
	return data;
}

@end
