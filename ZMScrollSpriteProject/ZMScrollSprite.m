//
//  ZMScrollSprite.m
//  ZMScrollSpriteProject
//
//  Created by Zouhair Mahieddine on 3/17/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

#import "ZMScrollSprite.h"

@interface ZMScrollSprite () <UIScrollViewDelegate>

@property(strong, nonatomic) UIScrollView *scrollView;
@property(strong, nonatomic) SKSpriteNode *contentSprite;

@end

@implementation ZMScrollSprite

#pragma mark Initialization
- (instancetype)initWithSize:(CGSize)size contentSize:(CGSize)contentSize {
    self = [super initWithColor:nil size:size];
    if (self) {
        _contentSprite = [SKSpriteNode spriteNodeWithColor:nil size:contentSize];
        _contentSprite.anchorPoint = CGPointMake(0, 0.5);
        [self addChild:_contentSprite];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollView.contentSize = contentSize;
        _scrollView.delegate = self;
        if (self.scene.view) {
            [self.scene.view addSubview:_scrollView];
        }
    }
    return self;
}
+ (instancetype)scrollSpriteWithSize:(CGSize)size contentSize:(CGSize)contentSize {
    return [[self alloc] initWithSize:size contentSize:contentSize];
}

#pragma mark SKSpriteNode Hierarchy Overloading
- (void)addChild:(SKNode *)node {
    if (node == self.contentSprite) {
        [super addChild:node];
    }
    else {
        [self.contentSprite addChild:node];
    }
}

#pragma mark UIScrollView Helpers
- (void)sceneDidMoveToView:(UIView *)view {
    if (self.scrollView.superview) {
        [self.scrollView removeFromSuperview];
    }
    [self.scene.view addSubview:self.scrollView];
}

#pragma mark Scrolling
@dynamic contentSize;
- (CGSize)contentSize {
    return self.scrollView.contentSize;
}
- (void)setContentSize:(CGSize)contentSize {
    [self.scrollView setContentSize:contentSize];
}
@dynamic contentOffset;
- (CGPoint)contentOffset {
    return self.scrollView.contentOffset;
}
- (void)setContentOffset:(CGPoint)contentOffset {
    [self.scrollView setContentOffset:contentOffset];
}
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
    [self.scrollView setContentOffset:contentOffset animated:YES];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.contentSprite.position = CGPointMake(- scrollView.contentOffset.x, scrollView.contentOffset.y);
}

@end
