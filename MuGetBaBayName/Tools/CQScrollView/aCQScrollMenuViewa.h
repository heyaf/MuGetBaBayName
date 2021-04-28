
#import <UIKit/UIKit.h>

@class aCQScrollMenuViewa;
@protocol rCQScrollMenuViewDelegater <NSObject>
- (void)coilFareHorizon:(aCQScrollMenuViewa *)coilFareHorizon clickedButtonAtIndex:(NSInteger)index;

@end

@interface aCQScrollMenuViewa : UIScrollView

@property (nonatomic,weak) id <rCQScrollMenuViewDelegater> fareUnbuttonChatterDelegate;

@property (nonatomic,strong) NSArray *sTitleArrays;

@property (nonatomic,assign) NSInteger eCurrentButtonIndexe;

@end
