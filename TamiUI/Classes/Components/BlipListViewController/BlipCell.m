//
//  BlipTableViewCell.m
//  TamiLab
//
//  Created by Admin on 2016-05-26.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "BlipCell.h"
#import "BlipCellWrapper.h"

@implementation BlipCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setData:(BlipCellWrapper*)data {
    self.wrapper=data;
    self.cellView.wrapper=data;
}

//- (void) setImageURL:(NSURL *)imageURL defaultImage:(UIImage*)defaultImage imageIndex:(NSInteger)imageIndex {
//    _imageIndex = imageIndex;
//    _defaultImage = defaultImage;
//    
//    
//    _senderView.alpha = 0.0f;
//    if(!__imageView){
//        __imageView = [[UIImageView alloc]init];
//        [__scrollView addSubview:__imageView];
//        __imageView.contentMode = UIViewContentModeScaleAspectFill;
//    }
//    __block UIImageView * _imageViewInTheBlock = __imageView;
//    __block MHFacebookImageViewerCell * _justMeInsideTheBlock = self;
//    __block UIScrollView * _scrollViewInsideBlock = __scrollView;
//    
//    [__imageView setImageWithURLRequest:[NSURLRequest requestWithURL:imageURL] placeholderImage:defaultImage success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        [_scrollViewInsideBlock setZoomScale:1.0f animated:YES];
//        [_imageViewInTheBlock setImage:image];
//        _imageViewInTheBlock.frame = [_justMeInsideTheBlock centerFrameFromImage:_imageViewInTheBlock.image];
//        
//    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
//        NSLog(@"Image From URL Not loaded");
//    }];
//    
//    if(_imageIndex==_initialIndex && !_isLoaded){
//        __imageView.frame = _originalFrameRelativeToScreen;
//        [UIView animateWithDuration:0.4f delay:0.0f options:0 animations:^{
//            __imageView.frame = [self centerFrameFromImage:__imageView.image];
//            CGAffineTransform transf = CGAffineTransformIdentity;
//            // Root View Controller - move backward
//            _rootViewController.view.transform = CGAffineTransformScale(transf, 0.95f, 0.95f);
//            // Root View Controller - move forward
//            //                _viewController.view.transform = CGAffineTransformScale(transf, 1.05f, 1.05f);
//            _blackMask.alpha = 1;
//        }   completion:^(BOOL finished) {
//            if (finished) {
//                _isAnimating = NO;
//                _isLoaded = YES;
//                if(_openingBlock)
//                    _openingBlock();
//            }
//        }];
//        
//    }
//    __imageView.userInteractionEnabled = YES;
//    [self addPanGestureToView:__imageView];
//    [self addMultipleGesture];
//    
//}

@end
