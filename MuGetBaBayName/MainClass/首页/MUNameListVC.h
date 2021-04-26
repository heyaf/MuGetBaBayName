//
//  MUNameListVC.h
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import "MUBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MUNameListVC : MUBaseViewController

PropertyString(bazi_id); //八字ID；
PropertyString(firstname);
PropertyString(name_type);

@end

NS_ASSUME_NONNULL_END
