//
//  ViewController.m
//  InstaKilo
//
//  Created by Will Chew on 2018-06-20.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import "ViewController.h"
#import "ImageCellCollectionViewCell.h"
#import "Pictures.h"
#import "HeaderCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic,strong)NSArray<NSArray*> *imagesArray;
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollection;
@property (nonatomic, strong)NSArray *nameOfHeaders;
@property (nonatomic,strong) NSArray *skyArray;
@property (nonatomic,strong) NSArray *otherArray;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControlOutlet;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.imagesCollection.collectionViewLayout;
    
    layout.itemSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *skyArray = @[[[Pictures alloc]initWithImage:[UIImage imageNamed:@"sky1"] name:@"sky1"],
                          [[Pictures alloc]initWithImage:[UIImage imageNamed:@"sky2"] name:@"sky2"],
                          [[Pictures alloc]initWithImage:[UIImage imageNamed:@"sky3"] name:@"sky3"],
                          [[Pictures alloc]initWithImage:[UIImage imageNamed:@"sky4"] name:@"sky4"]];
    
    self.skyArray = skyArray;
    
    NSArray *everythingElseArray = @[[[Pictures alloc]initWithImage:[UIImage imageNamed:@"1"] name:@"1"],
                                     [[Pictures alloc]initWithImage:[UIImage imageNamed:@"2"] name:@"2"],
                                     [[Pictures alloc]initWithImage:[UIImage imageNamed:@"3"] name:@"3"],
                                     [[Pictures alloc]initWithImage:[UIImage imageNamed:@"4"] name:@"4"],
                                     [[Pictures alloc]initWithImage:[UIImage imageNamed:@"5"] name:@"5"],
                                     [[Pictures alloc]initWithImage:[UIImage imageNamed:@"6"] name:@"6"]];
    
    self.otherArray = everythingElseArray;
    
    self.imagesArray = @[skyArray, everythingElseArray];
    self.nameOfHeaders = @[@"Animals", @"Everything Else"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    
    if ([self.segmentedControlOutlet selectedSegmentIndex]==0){
        return 1;
    }
    if ([self.segmentedControlOutlet selectedSegmentIndex] == 1){
        return 1;
    } else {
        return [self.imagesArray count];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if ([self.segmentedControlOutlet selectedSegmentIndex] == 0){
        return [self.skyArray count];
    }
    if ([self.segmentedControlOutlet selectedSegmentIndex] == 1) {
        return [self.otherArray count];
    }
    
    else {
        return [[self.imagesArray objectAtIndex:section] count];
    }
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    
    
    //        cell.imageView.image = self.imagesArray[indexPath.section][indexPath.row];
    if ([self.segmentedControlOutlet selectedSegmentIndex] == 0){
        Pictures *pic = self.skyArray[indexPath.item];
        cell.imageView.image = pic.image;
        
        return cell;
    }
    if ([self.segmentedControlOutlet selectedSegmentIndex] == 1) {
        //        cell.imageView.image = self.imagesArray[indexPath.item];
        Pictures *pic = self.otherArray[indexPath.item];
        cell.imageView.image = pic.image;
        return cell;
    }
    else {
        Pictures *pic = self.imagesArray[indexPath.section][indexPath.row];
        cell.imageView.image = pic.image;
        return cell;
    }
    // this doesn't work because it's not sending me a string back, its sending me a UIImage
    //    cell.imageView.image = [UIImage imageNamed:[self.imagesArray[indexPath.section] objectAtIndex:indexPath.row]];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        if ([self.segmentedControlOutlet selectedSegmentIndex] == 0) {
            headerView.headerLabel.text = [self.nameOfHeaders objectAtIndex:0];
        }
        if ([self.segmentedControlOutlet selectedSegmentIndex] == 1) {
            headerView.headerLabel.text = [self.nameOfHeaders objectAtIndex:1];
        }else {
            NSString *headerString = [self.nameOfHeaders objectAtIndex: indexPath.section];
            NSString *title = headerString;
            headerView.headerLabel.text = title;
        }
        reusableView = headerView;
        
        
    }
    return reusableView;
}
- (IBAction)controlPressed:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        
        [self.imagesCollection reloadData];
        
        
    } if (sender.selectedSegmentIndex == 1) {
        
        [self.imagesCollection reloadData];
    }
    else {
        [self.imagesCollection reloadData];
    }
}

@end
