//
//  IMDPPlaceHolder.m
//  DemoCatalogo
//
//  Created by il Malvagio Dottor Prosciutto
//  No Copyright but attribution is appreciated
//

#import "IMDPPlaceHolder.h"

@implementation IMDPPlaceHolder

/** Placeholder UI object: the label text is the name of the class that replace it at runtime.
	Put this label in the exact place you want a view from another nib.
	At runtime the label take it's text, tag and frame properties and use them to load and configure the desired object . In details:
	placeholder.text: name of the new class (that must implement initWithFrame:)
	placeholder.frame: frame of the new object also.
	placeholder.tag: the new object will have the same tag of the placeholder, to easily retrive it.
	it also copy some other useful properties like alpha and autoresizingMask, and if you need more just add ;)
	After creating and adding to superview the new object the placeholder remove itself.
	
	NOTE: Since ARC you cannot anymore replace "self" in methods not called "init", so you can't simply subclass the awakeFromNib of the actual class and replace the "unused" self with the one loaded from nib.
	Using the placeholder we get the necessary level of indirection: it allow us to load the real object calling the initWithFrame (method that you have to explict subclass also) where is possible to replace "self".
	See IMDPComplexView as example.
 */
- (void) awakeFromNib
{
	[super awakeFromNib];
	
	UIView* theRealView = [[NSClassFromString(self.text) alloc] initWithFrame:self.frame];
	theRealView.tag = self.tag;
	theRealView.alpha = self.alpha;
	theRealView.autoresizingMask = self.autoresizingMask;
	theRealView.hidden = self.hidden;
	
	[self.superview addSubview:theRealView];
	[self removeFromSuperview];
}
@end
