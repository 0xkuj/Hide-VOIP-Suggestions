
@interface CNUIUserActionItem
@property (nonatomic, strong, readwrite) NSString* label;
@end
%hook CNUIUserActionListModel
-(id)actions {
	NSArray* origVOIPActions = %orig;
	NSMutableArray* editedVOIPActions = [NSMutableArray arrayWithArray:origVOIPActions];
	NSMutableArray *discardedItems = [NSMutableArray array];
	for (CNUIUserActionItem* action in origVOIPActions) {
		if (action.label != nil && ![action.label containsString:@"_$!"] && ![action.label containsString:@"iPhone"] && ![action.label containsString:@"FaceTime"]) {
			[discardedItems addObject:action];
		}
	}

	[editedVOIPActions removeObjectsInArray:discardedItems];
	return (NSArray*)editedVOIPActions;
}
%end