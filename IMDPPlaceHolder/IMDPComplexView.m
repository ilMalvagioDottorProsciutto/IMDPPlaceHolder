//
//  IMDPComplexView.m
//  PlaceHolderDemo
//
//  Created by il Malvagio Dottor Prosciutto
//  No Copyright but attribution is appreciated
//

#import "IMDPComplexView.h"

@implementation IMDPComplexView

+ (id) newFromNib:(NSString*) nibName
{
	UINib *nib = [UINib nibWithNibName:nibName bundle:nil];	
	NSArray *nibArray = [nib instantiateWithOwner:nil options:nil];
    IMDPComplexView *me = [nibArray objectAtIndex: 0];
	
	return me;
}


- (id)initWithFrame:(CGRect)frame
{
	/* the standard [super ] call is useless, we load a new object from scratch from the nib
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }*/
	
	self = [IMDPComplexView newFromNib:NSStringFromClass(self.class)];
	self.frame = frame;
    return self;
}

@end
