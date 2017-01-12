//
//  ViewController.m
//  SimulationPageAnimation
//
//  Created by Lois_pan on 16/11/29.
//  Copyright © 2016年 Lois_pan. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+PGQTransition.h"
#import "UINavigationController+PGQTransition.h"


enum {ExamplePDF, ExampleImage, ExampleProcedural, NumExamples};

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TableViewController";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"lorem" ofType:@"txt"];
//    NSString * textString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return NumExamples;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 20;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    switch (indexPath.section) {
        case ExamplePDF: cell.textLabel.text = @"PDF example"; break;
        case ExampleImage: cell.textLabel.text = @"Image example"; break;
        case ExampleProcedural: cell.textLabel.text = @"Procedural example"; break;
        default: cell.textLabel.text = @"";
    }    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController;
    switch (indexPath.row) {
        case ExamplePDF:
            break;
        case ExampleImage:
            break;
        case ExampleProcedural:
            break;
        default:
            viewController = nil;
    }
    
    //跳转方式
//    1.present
//    [self pgq_presentViewController:viewController makeTransition:^(PGQTransitionProperty *transition) {
//        transition.animationType = PGQTransitionAnimationTypeSysFade;
//        transition.animationTime = 1.0;
//    }];
    
//    2.push
//    [self.navigationController pgq_pushViewController:viewController makeTransition:^(PGQTransitionProperty *transition) {
//    }];
    
    if (viewController)
        [self.navigationController pushViewController:viewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
