//
//  MUNameModel.h
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface MUNameModel : JSONModel
PropertyString(jiMing);
PropertyString(wuXing);
PropertyString(pinYin);

@end

NS_ASSUME_NONNULL_END
