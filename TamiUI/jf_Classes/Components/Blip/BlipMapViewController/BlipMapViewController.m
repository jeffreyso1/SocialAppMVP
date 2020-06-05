//
//  BlipMapViewController.m
//  Tami
//
//  Created by Roman Mironenko on 2016-07-01.
//  Copyright © 2016 Roman Mironenko. All rights reserved.
//

#import "BlipMapViewController.h"
#import "BlipDetailViewController.h"
#import "BlipPagesViewController.h"
#import "BlipPopupCell.h"
#import "BlipDetail.h"
#import "TMIServerUtil.h"
#import "TestDataManager.h"
#import "StoryboardList.h"

@interface BlipMapViewController ()

@property (strong, nonatomic) IBOutlet XMapView *xMapView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *launchPadView;
@property (nonatomic) CLLocation *lastLocation;
@property (nonatomic) BlipDetail *selectedBlip;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic) NSArray *blips;

@end

@implementation BlipMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.xMapView initialize];
    self.xMapView.clusteringGroupNrofPins = 5;
    self.xMapView.clusteringRadius = 80;
    self.xMapView.enableClusteringRadiusAutoAdjust = NO;
    [LocationService sharedInstance].locationDelegate = self;
    [self locateUser];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(screenWidth, BPUCellHeight);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    
    [self.collectionView registerClass:[BlipPopupCell class] forCellWithReuseIdentifier:@"BlipPopupCell"];
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    self.blips = [[NSArray alloc] init];
    [[TestDataManager sharedInstance] getBlipPosts:^(NSURLResponse *response, id responseObject, NSError *error) {
        self.blips = [NSArray yy_modelArrayWithClass:[BlipDetail class] json:responseObject];
        [self.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)locateUser {
    [self.xMapView setRegion:MKCoordinateRegionMake(CLLocationCoordinate2DMake([[LocationService sharedInstance] currentLocation].coordinate.latitude, [[LocationService sharedInstance] currentLocation].coordinate.longitude), MKCoordinateSpanMake(0.025, 0.025)) animated:YES];
}

- (IBAction)clickedLaunch:(id)sender {
    self.launchPadView.hidden = !self.launchPadView.hidden;
    self.collectionView.hidden = !self.collectionView.hidden;
}

- (IBAction)clickedLaunchPadControl:(id)sender {
    switch ([sender tag]) {
        case 201:
            // Locate me
            [self locateUser];
            break;
        case 202:
            // reLoad
            break;
        case 203:
            // audio toggle
            break;
        case 204:
            // zoom button
            break;
        default:
            break;
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.blips.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BlipPopupCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BlipPopupCell" forIndexPath:indexPath];
    BlipDetail *blipContent = [self.blips objectAtIndex:indexPath.row];
    cell.blipBannerImage.image = nil;
    [cell.blipBannerImage setImageWithURL:[NSURL URLWithString:blipContent.imageUrl]];
    //cell.creatorThumbnail
    cell.creatorName.text = blipContent.createdBy;
    cell.heartCount.text = blipContent.likeCount.stringValue;
    cell.commentCount.text = blipContent.commentCount.stringValue;
    cell.blipBody.text = blipContent.textContent;
    NSDate *commentDate = [NSDate dateWithString:blipContent.dateTime formatString:@"yyyy-MM-dd hh:mmaa"];
    cell.timesAgo.text = [commentDate timeAgoSinceNow];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath.row;
    BlipPagesViewController *vc = [[StoryboardList blipStoryboard] instantiateViewControllerWithIdentifier:@"BlipPagesViewController"];
    vc.blips = self.blips;
    vc.selectedIndex = self.selectedIndex;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - LocationServicesDelegate
-(void)LocationUpdate:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    if(newLocation != nil){
        self.lastLocation = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
        MKMapRect mRect = MKMapRectInset(self.xMapView.visibleMapRect, self.xMapView.visibleMapRect.size.width/5, self.xMapView.visibleMapRect.size.height/5);
        MKMapPoint neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
        MKMapPoint swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
        CLLocationCoordinate2D neCoord = MKCoordinateForMapPoint(neMapPoint);
        CLLocationCoordinate2D swCoord = MKCoordinateForMapPoint(swMapPoint);
        BOOL needToReCenter = NO;
        if (newLocation.coordinate.latitude < swCoord.latitude || newLocation.coordinate.longitude< swCoord.longitude){
            needToReCenter = YES;
        }
        if (newLocation.coordinate.latitude > neCoord.latitude || newLocation.coordinate.longitude> neCoord.longitude){
            needToReCenter = YES;
        }
        
        if (needToReCenter) {
            
        }
    }
}

#pragma mark - XMapView Delegate
- (void)xmapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{

}

- (MKOverlayRenderer *)xmapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer* lineView = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    lineView.strokeColor = [UIColor blueColor];
    lineView.lineWidth = 4;
    return lineView;
}

- (void)xmapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
}

- (MKAnnotationView *)xmapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    return nil;
}

- (void)xmapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{

}

- (void)xmapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    NSLog(@"regionDidChangeAnimated");
}

- (void)xmapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    NSLog(@"regionWillChangeAnimated");
}


@end
