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
    ContactService *contactService;
    ContactEmptyLabel *emptyLabel;
}

@end

@implementation ContactViewController

//MARK: Init views and services
- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        [self setupViews];
    }
    return self;
}
- (void)setupViews {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"Picker Contact"];
    if(!tableView) {//lazy loading
        tableView = [[ContactTableView alloc] init];
        [[self view] addSubview:tableView];
        [tableView setConstraints];
    }
    if(!emptyLabel) {
        emptyLabel = [[ContactEmptyLabel alloc] init];
        [[self view] addSubview:emptyLabel];
        [emptyLabel setConstraints];
    }
}
- (void)setupServices {
    if(!contactService) {
        contactService = [[ContactService alloc] init];
    }
    __weak ContactViewController *weakSelf = self;
    [[contactService sharedInstance] requestAccessForEntityType:CNEntityTypeContacts
                                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                ContactViewController *strongSelf = weakSelf;
                if(strongSelf) {
                    if(error) {
                        [strongSelf->tableView setHidden:YES];
                        [strongSelf->emptyLabel setHidden:NO];
                        [strongSelf->emptyLabel setText:@"Error when asking user's contacts' permission"];
                    }else if(!granted) {
                        [strongSelf->tableView setHidden:YES];
                        [strongSelf->emptyLabel setHidden:NO];
                        [strongSelf->emptyLabel setText:@"This app needs permission to access contacts. Please enable it in settings."];
                    }else if(granted && !error) {
                        [strongSelf->tableView setHidden:NO];
                        [strongSelf->emptyLabel setHidden:YES];
                        NSArray<CNContact *> * contacts = [strongSelf->contactService contacts];
                        ContactTableViewModel *viewModel = [[ContactTableViewModel alloc] initWithTableViewModel: [[ContactModelList alloc] initWithCNContacts:contacts]];
                        [strongSelf->tableView setDataSource:[[ContactTableViewDataSource alloc] initWithViewModel: viewModel]];
                        [strongSelf->tableView reloadData];
                    }
                }
            });
    }];
}
//MARK: View controller events
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self setupServices];
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
