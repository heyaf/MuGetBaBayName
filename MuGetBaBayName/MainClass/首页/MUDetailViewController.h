//
//  MUDetailViewController.h
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import "MUBaseViewController.h"
#import "MUNameModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MUDetailViewController : MUBaseViewController
PropertyString(xing);
PropertyString(mingzi);
PropertyString(bazi_id);

@property (nonatomic,strong) MUNameModel *namemodel;
@end

NS_ASSUME_NONNULL_END
