//
//  GoogleTableController.h
//  GoogleMapsIOS
//
//  Created by Pablo Robles Sánchez on 3/15/15.
//  Copyright (c) 2015 Pablo Robles Sánchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface GoogleTableController : UITableViewController

<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *locations;

@property(strong, nonatomic) ViewController *detailView;

@end
