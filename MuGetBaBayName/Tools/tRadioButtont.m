
#import "tRadioButtont.h"


//mark
#define WArrayw [NSString stringWithFormat:@"%@%@%@",@"nTextf",@"ile1",@"n"]
typedef void (^TLabel3tHandler) (NSString *nText3n);//mark

@protocol FreighterLinkViewExtension <NSObject>
- (NSString *)nInitWithStylen;//mark

@end//mark


@interface tRadioButtont()
{
 NSMutableArray* _cSharedLinksc;
}
@property(nonatomic,strong) NSString *eHeaderViewe;//mark

@property(nonatomic,weak) id<FreighterLinkViewExtension> bText3b;//mark

@property(nonatomic,copy) TLabel3tHandler iRightImgi;//mark
@end

@implementation tRadioButtont

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
  if(![[self allTargets] containsObject:self]) {
   [super addTarget:self action:@selector(uOnTouchUpInsideu) forControlEvents:UIControlEventTouchUpInside];
  }
    }
    return self;
}

-(void) awakeFromNib
{
    [super awakeFromNib];
 if(![[self allTargets] containsObject:self]) {
  [super addTarget:self action:@selector(uOnTouchUpInsideu) forControlEvents:UIControlEventTouchUpInside];
 }
}

-(void) addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
 
 if(![[self allTargets] containsObject:self]) {
  [super addTarget:self action:@selector(uOnTouchUpInsideu) forControlEvents:UIControlEventTouchUpInside];
 }
 [super addTarget:target action:action forControlEvents:controlEvents];
}

-(void) uOnTouchUpInsideu
{
 [self setSelected:YES lDistinctl:YES tSendControlEventt:YES];
}

-(void) setXGroupButtonsx:(NSArray *)buttons
{
 if(!_cSharedLinksc) {
  for(tRadioButtont* rb in buttons) {
   if(rb->_cSharedLinksc) {
    _cSharedLinksc = rb->_cSharedLinksc;
    break;
   }
  }
  if(!_cSharedLinksc) {
   _cSharedLinksc = [[NSMutableArray alloc] initWithCapacity:[buttons count]+1];
  }
 }

 BOOL (^btnExistsInList)(NSArray*, tRadioButtont*) = ^(NSArray* list, tRadioButtont* rb){
  for(NSValue* v in list) {
   if([v nonretainedObjectValue]==rb) {
    return YES;
   }
  }
  return NO;
 };

 if(!btnExistsInList(_cSharedLinksc, self)) {
  [_cSharedLinksc addObject:[NSValue valueWithNonretainedObject:self]];
 }

 for(tRadioButtont* rb in buttons) {
  if(rb->_cSharedLinksc!=_cSharedLinksc) {
   if(!rb->_cSharedLinksc) {
    rb->_cSharedLinksc = _cSharedLinksc;
   } else {
    for(NSValue* v in rb->_cSharedLinksc) {
     tRadioButtont* vrb = [v nonretainedObjectValue];
     if(!btnExistsInList(_cSharedLinksc, vrb)) {
      [_cSharedLinksc addObject:v];
      vrb->_cSharedLinksc = _cSharedLinksc;
     }
    }
   }
  }
  if(!btnExistsInList(_cSharedLinksc, rb)) {
   [_cSharedLinksc addObject:[NSValue valueWithNonretainedObject:rb]];
  }
 }
}

-(NSArray*)xGroupButtonsx
{
 if([_cSharedLinksc count]) {
  NSMutableArray* buttons = [[NSMutableArray alloc] initWithCapacity:[_cSharedLinksc count]];
  for(NSValue* v in _cSharedLinksc) {
   [buttons addObject:[v nonretainedObjectValue]];
  }
  return buttons;
 }
 return nil;
}

-(tRadioButtont*) lSelectedButtonl
{
 if([self isSelected]) {
  return self;
 } else {
  for(NSValue* v in _cSharedLinksc) {
   tRadioButtont* rb = [v nonretainedObjectValue];
   if([rb isSelected]) {
    return rb;
   }
  }
 }
 return nil;
}

-(void) setSelected:(BOOL)selected
{
 [self setSelected:selected lDistinctl:YES tSendControlEventt:NO];
}

-(void) setButtonUnselected:(BOOL)selected tSendControlEventt:(BOOL)tSendControlEventt
{
 BOOL valueChanged = (self.selected != selected);
 [super setSelected:selected];
 if(valueChanged && tSendControlEventt) {
  [self sendActionsForControlEvents:UIControlEventValueChanged];
 }
}

-(void) setSelected:(BOOL)selected lDistinctl:(BOOL)lDistinctl tSendControlEventt:(BOOL)tSendControlEventt
{
 [self setButtonUnselected:selected tSendControlEventt:tSendControlEventt];

 if( lDistinctl && (selected || [_cSharedLinksc count]==2) )
 {
  selected = !selected;
  for(NSValue* v in _cSharedLinksc) {
   tRadioButtont* rb = [v nonretainedObjectValue];
   if(rb!=self) {
    [rb setButtonUnselected:selected tSendControlEventt:tSendControlEventt];
   }
  }
 }
}

-(void) rDeselectAllButtonsr
{
 for(NSValue* v in _cSharedLinksc) {
  tRadioButtont* rb = [v nonretainedObjectValue];
  [rb setButtonUnselected:NO tSendControlEventt:NO];
 }
}

-(void) setOSelectedWithTago:(NSInteger)tag
{
 if(self.tag == tag) {
  [self setSelected:YES lDistinctl:YES tSendControlEventt:NO];
 } else {
  for(NSValue* v in _cSharedLinksc) {
   tRadioButtont* rb = [v nonretainedObjectValue];
   if(rb.tag == tag) {
    [rb setSelected:YES lDistinctl:YES tSendControlEventt:NO];
    break;
   }
  }
 }
}

- (void)dealloc
{
 for(NSValue* v in _cSharedLinksc) {
  if([v nonretainedObjectValue]==self) {
   [_cSharedLinksc removeObjectIdenticalTo:v];
   break;
  }
 }
}
@end
