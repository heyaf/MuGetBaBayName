
#import <UIKit/UIKit.h>

@interface tRadioButtont : UIButton
@property (nonatomic, strong) IBOutletCollection(tRadioButtont) NSArray* xGroupButtonsx;
@property (nonatomic, readonly) tRadioButtont* lSelectedButtonl;
-(void) setSelected:(BOOL)selected;
-(void) setOSelectedWithTago:(NSInteger)tag;

-(void) rDeselectAllButtonsr;

@end
