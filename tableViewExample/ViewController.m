//
//  ViewController.m
//  tableViewExample
//
//  Created by Rajeev Kumar on 13/03/14.
//  Copyright (c) 2014 rajeev. All rights reserved.
//

#import "ViewController.h"

static NSString *  EvenCellIdentifier = @"EvenCell";
static NSString * OddCellIdentifier = @"oddCell";

@interface ViewController () <UITabBarDelegate, UITableViewDataSource>

@end

@implementation ViewController
{
    NSMutableArray * _dataItems;
}

-(id) initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self){
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    _dataItems = [[NSMutableArray alloc] initWithCapacity:20];
    for(NSInteger i=0;i<100;i++){
        [_dataItems addObject:[NSString stringWithFormat:@"Data #%d", i]];
    }
    
    UINib *nib = [UINib nibWithNibName:OddCellIdentifier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:OddCellIdentifier];
    
    nib = [UINib nibWithNibName:EvenCellIdentifier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:EvenCellIdentifier];
}

-(void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - table view data source
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataItems.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row % 2 ==0){
        cell = [tableView dequeueReusableCellWithIdentifier:EvenCellIdentifier forIndexPath:indexPath];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:OddCellIdentifier forIndexPath:indexPath];
    }
    
    UILabel *label = (UILabel*)[cell viewWithTag:100];
    label.text = _dataItems[indexPath.row];
    return cell;
}

@end
