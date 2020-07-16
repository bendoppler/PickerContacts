//
//  ViewController.m
//  Contacts
//
//  Created by Do Thai Bao on 7/10/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController () {
    ContactStackView *stackView;
    ContactService *contactService;
    BOOL isInPickingMode;
}

@end

@implementation ContactViewController

//MARK: Init views and services
- (void)setupViews {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"Picker Contact"];
    if(!contactService) {
        contactService = [[ContactService alloc] init];
    }
    if(!stackView) {
        stackView = [[ContactStackView alloc] initWithService:contactService];
        [self.view addSubview:stackView];
        [stackView
         setConstraintWithHeight:self.view.frame.size.height-self.navigationController.navigationBar.frame.size.height - UIApplication.sharedApplication.statusBarFrame.size.height
         andOriginY:self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height];
    }
}

//MARK: View controller events
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateContacts) name:CNContactStoreDidChangeNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name: CNContactStoreDidChangeNotification object: nil];
}

//MARK: Contacts Notification
- (void)updateContacts {
    [stackView updateContacts];
}

@end
