//
//  ViewController.h
//  searchBarExample
//
//  Created by Shashwat Mittal on 17/8/2015.
//  Copyright (c) 2015 Shashwat Mittal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
{
    IBOutlet UITableView *table;
    IBOutlet UISearchBar *searchField;
}

@end

