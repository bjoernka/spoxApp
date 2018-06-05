//
//  NewsData.h
//  spoxApp
//
//  Created by Björn Kaczmarek on 04.06.18.
//  Copyright © 2018 Björn Kaczmarek. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 Data for the News. Every News-Cell consists of an image, a headline, a category and the news-text.
 */

@interface NewsData : NSObject

@property (strong, nonatomic) NSArray* images;
@property (strong, nonatomic) NSArray* headline;
@property (strong, nonatomic) NSArray* category;
@property (strong, nonatomic) NSArray* newstext;

@end
