- (void) safeCellUpdate: (NSUInteger) section withRow : (NSUInteger) row {
    // It's important to invoke reloadRowsAtIndexPaths implementation on main thread, as it wont work on non-UI thread
    
    NSUInteger lastSection = [self.commentTableView numberOfSections];
    if (lastSection == 0) {
        return;
    }
    lastSection -= 1;
    if (section > lastSection) {
        return;
    }
    NSUInteger lastRowNumber = [self.commentTableView numberOfRowsInSection:section];
    if (lastRowNumber == 0) {
        return;
    }
    lastRowNumber -= 1;
    if (row > lastRowNumber) {
        return;
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    @try {
        if ([[self.commentTableView indexPathsForVisibleRows] indexOfObject:indexPath] == NSNotFound) {
            // Cells not visible can be ignored
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.commentTableView beginUpdates];
            [self.commentTableView endUpdates];
//            [self.commentTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        });
    }
    
    @catch ( NSException *e ) {
        // Don't really care if it doesn't work.
        // It's just to refresh the view and if an exception occurs it's most likely that that is what's happening in parallel.
        // Nothing needs done
        return;
    }
}
