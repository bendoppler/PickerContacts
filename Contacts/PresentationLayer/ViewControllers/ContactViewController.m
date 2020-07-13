//
//  ViewController.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController () {
    CircleCheckBox *checkBox;
    ContactTableView *tableView;
}

@end

@implementation ContactViewController

//MARK: Init view and bind view model
- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews {
    if(!tableView) {//lazy loading
        tableView = [[ContactTableView alloc] init];
    }
    [[self view] addSubview:tableView];
    [tableView setConstraints];
}
//MARK: View controller events
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"Picker Contact"];
    [[self view] addSubview:checkBox];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupData) name:CNContactStoreDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name: CNContactStoreDidChangeNotification object: nil];
}

@end
