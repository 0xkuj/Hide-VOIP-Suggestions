
@interface CNUIUserActionItem
@property (nonatomic, strong, readwrite) NSString* label;
@end
%hook CNUIUserActionListModel
/*
-(void)setActions:(id)arg1 {
	NSLog(@"0xkuj 1");
	%orig(nil);
	return;
}
*/
-(id)actions {
	NSArray* removeVoipActions = %orig;
	NSMutableArray* retval = [NSMutableArray arrayWithArray:removeVoipActions];
	NSMutableArray *discardedItems = [NSMutableArray array];
	for (CNUIUserActionItem* action in removeVoipActions) {
		//NSLog(@"0xkuj action label.. %@", action.label);
		if (![action.label containsString:@"_$!"] && ![action.label containsString:@"iPhone"]) {
			//NSLog(@"0xkuj will remove.. label.. %@", ((CNUIUserActionItem*)action).label);
			[discardedItems addObject:action];
		}
	}

	[retval removeObjectsInArray:discardedItems];
	return (NSArray*)retval;
}
%end