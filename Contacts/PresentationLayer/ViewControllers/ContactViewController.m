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
    UILabel *titleLabel;
    BOOL isInPickingMode;
    NSNumber *pickCount;
    ContactNavigationBarItemStackView *navigationBarItemView;
    UIBarButtonItem *sendMessageBarButtonItem;
    NSArray *pickedContactFullnames;
}

@end

@implementation ContactViewController

//MARK: Init views and services
- (void)setupViews {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if(!navigationBarItemView) {
        navigationBarItemView = [[ContactNavigationBarItemStackView alloc] initWithWidth:self.view.bounds.size.width andHeight:self.navigationController.navigationBar.frame.size.height];
        [self.navigationItem setTitleView:navigationBarItemView];
    }
    if(!sendMessageBarButtonItem) {
        sendMessageBarButtonItem = [[UIBarButtonItem alloc]
                                    initWithTitle: @"Send SMS"
                                    style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(sendMessage)];
        [self.navigationItem setRightBarButtonItem:sendMessageBarButtonItem];
        [sendMessageBarButtonItem setEnabled:NO];
    }
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
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(updateSendSMSButton:) name:@"com.piendop.contactPickerCollectionViewState" object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name: CNContactStoreDidChangeNotification object: nil];
    [NSNotificationCenter.defaultCenter removeObserver:self name:@"com.piendop.contactPickerCollectionViewState" object:nil];
}

//MARK: Contacts Notification
- (void)updateContacts {
    [stackView updateContacts];
}

- (void)updateSendSMSButton:(NSNotification *)notification {
    NSDictionary *info = notification.userInfo;
    NSString *state = info[@"state"];
    if([state isEqualToString:@"empty"]) {
        [sendMessageBarButtonItem setEnabled:NO];
    }else if([state isEqualToString:@"fit"]) {
        [sendMessageBarButtonItem setEnabled:YES];
    }else {
        [sendMessageBarButtonItem setEnabled:YES];
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"Limitation reach"
                                              message:@"Can't invite more than 5 people at a time"
                                              preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:nil]];
        [self presentViewController:alertController animated:true completion:nil];
    }
}

//MARK: Send message
- (void)sendMessage {
    pickedContactFullnames = [stackView getPickedContactFullnames];
    NSMutableString *text = [NSMutableString stringWithString:@"Send invitation to "];
    for(int i = 0; i < pickedContactFullnames.count-1; ++i) {
        [text appendFormat:@"%@, ", pickedContactFullnames[i]];
    }
    [text appendFormat:@"%@.", pickedContactFullnames[pickedContactFullnames.count-1]];
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"Send invitation"
                                          message:text
                                          preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction
                                actionWithTitle:@"Ok"
                                style:UIAlertActionStyleDefault
                                handler:nil]];
    [self presentViewController:alertController animated:true completion:nil];
}

@end
