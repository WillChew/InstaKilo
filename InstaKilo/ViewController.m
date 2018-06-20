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

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic,strong)NSArray *imagesArray;
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollection;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout*)self.imagesCollection.collectionViewLayout;
    
    layout.itemSize = CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
//    NSArray *skyArray = @[[UIImage imageNamed:@"sky1"], [UIImage imageNamed:@"sky2"], [UIImage imageNamed:@"sky3"], [UIImage imageNamed:@"sky4"]];
//    NSArray *everythingElse = @[[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"], [UIImage imageNamed:@"4"], [UIImage imageNamed:@"5"], [UIImage imageNamed:@"6"]];
//    self.imagesArray = [NSArray arrayWithObjects:skyArray, everythingElse, nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return 2;
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imagesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCellCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    
    cell.imageView.image = self.imagesArray[indexPath.item];
    
    
    
    return cell;
}
@end
