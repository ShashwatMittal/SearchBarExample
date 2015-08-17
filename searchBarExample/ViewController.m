//
//  ViewController.m
//  searchBarExample
//
//  Created by Shashwat Mittal on 17/8/2015.
//  Copyright (c) 2015 Shashwat Mittal. All rights reserved.
//

#import "ViewController.h"
#import "customCell.h"

@interface ViewController ()
{
    NSArray *displayArray, *dataArray;
    NSPredicate *predicate;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = @[@"Eric",@"Kate",@"Micheal",@"Tom",@"Jeremy",@"Shane",@"Robert",
        @"Martin"];
    displayArray = dataArray;
    [table setDataSource:self];
    [table setDelegate:self];
    [searchField setDelegate:self];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (![searchField.text isEqualToString:@""]) {
    predicate = [NSPredicate predicateWithFormat:@"SELF contains[cd] %@", searchField.text];
    displayArray = [dataArray filteredArrayUsingPredicate:predicate];
    }
    else
    {
        displayArray = dataArray;
    }
    [table reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [displayArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    customCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    cell.textLabel.text = [displayArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
