//
//  JAViewController.m
//  ImageLoaderExample
//
//  Created by Alexis Bronchart on 12/12/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "JAViewController.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <GPUImage/GPUImage.h>

@interface JAViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation JAViewController

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://kpimba.files.wordpress.com/2012/08/lolcat7.gif"]
                   placeholderImage:nil
                            options:SDWebImageRefreshCached
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
                              
                              if (error) {
                                  return;
                              }
                              
                              GPUImageGrayscaleFilter *grayscaleFilter = [[GPUImageGrayscaleFilter alloc] init];
                              UIImage *grayscaleImage = [grayscaleFilter imageByFilteringImage:image];
                              
                              self.imageView.image = grayscaleImage;
                          }];
}

@end
