-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        NSInteger lastSectionIndex = [tableView numberOfSections] - 1;
        NSInteger lastRowIndex = [tableView numberOfRowsInSection:lastSectionIndex] - 1;
        if ((indexPath.section == lastSectionIndex) && (indexPath.row == lastRowIndex)) {
            // This is the last cell
            if ([arrayBalanceList count]!=0) {
                [self loadMore];
            }
        }
    }
}
