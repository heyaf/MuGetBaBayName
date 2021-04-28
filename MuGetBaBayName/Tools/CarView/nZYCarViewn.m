
#import "nZYCarViewn.h"
#import "rZYCarViewLayoutr.h"
#import "mZYCarCollectionViewCellm.h"

@interface nZYCarViewn()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)rZYCarViewLayoutr *aCarViewLayouta;
@property (nonatomic, assign) CGSize dViewSized;
@property (nonatomic, assign) CGFloat cLasttimePointc;
@end
@implementation nZYCarViewn
-(NSMutableArray *)array{
    if (!_array) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}
-(UICollectionView* )collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.aCarViewLayouta];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerNib:[UINib nibWithNibName:[NSString stringWithFormat:@"%@%@%@%@%@",@"mZYCarColle",@"c",@"tionViewCe",@"ll",@"m"] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%@",@"ite",@"m"]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
    }
    return _collectionView;
}

-(rZYCarViewLayoutr *)aCarViewLayouta{
    if (!_aCarViewLayouta) {
        _aCarViewLayouta = [[rZYCarViewLayoutr alloc]init];
        _aCarViewLayouta.itemSize = CGSizeMake(self.dViewSized.height*0.8, self.dViewSized.height*0.8);
        _aCarViewLayouta.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _aCarViewLayouta;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.dViewSized = self.frame.size;
        [self addSubview:self.collectionView];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
    [self setVSlideEndv];
}
-(void)setVSlideEndv{
    CGPoint collectionViewPoint = self.collectionView.contentOffset;
   
    CGFloat hViewWidthh = CGRectGetWidth(self.collectionView.frame);
    CGFloat hItemHeighth = self.dViewSized.height*0.8;
    CGFloat index = roundf((self.collectionView.contentOffset.x) /hViewWidthh);
    collectionViewPoint.x = hItemHeighth * index;
    [self.collectionView setContentOffset:collectionViewPoint animated:YES];
  
}

-(void)setXArrayDatax:(NSArray *)array dSuperScrollViewd:(UIScrollView *)dSuperScrollViewd{
    
    [self.array removeAllObjects];
    if (array.count<=0) {
        return;
    }
    [self.array addObjectsFromArray:array];
    NSInteger index = 10;
    for (int i = 0; i<index; i++) {
        [self.array addObjectsFromArray:self.array];
    }

}
-(void)setKArraypinyink:(NSArray *)PYarray name:(NSArray *)nameArr qWuxingq:(NSArray *)wuxingArr dSuperScrollViewd:(UIScrollView *)dSuperScrollViewd{
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    mZYCarCollectionViewCellm *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%@",@"ite",@"m"] forIndexPath:indexPath];
    [cell setModel:[self.array objectAtIndex:indexPath.item]];
   
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    eZYCarModele *model =[self.array objectAtIndex:indexPath.item];
    if (self.block) {
        self.block(model.tNameStrt);
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x<300) {
        CGPoint point = CGPointMake(0+(self.array.count/2*self.frame.size.height*0.8),
                                    self.collectionView.contentOffset.y);
        [self.collectionView setContentOffset:point animated:NO];
    }else if (scrollView.contentOffset.x>(self.array.count*self.frame.size.height*0.8)-500){
        CGPoint point = CGPointMake(0+(self.array.count/2*self.frame.size.height*0.8),
                                    self.collectionView.contentOffset.y);
        [self.collectionView setContentOffset:point animated:NO];
    }
}
@end
