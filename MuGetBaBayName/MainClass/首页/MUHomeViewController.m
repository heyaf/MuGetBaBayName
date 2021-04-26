//
//  MUHomeViewController.m
//  MuGetBaBayName
//
//  Created by iOS on 2021/4/26.
//

#import "MUHomeViewController.h"
#import "MUNameListVC.h"
#import <AdSupport/AdSupport.h>

@interface MUHomeViewController ()<UITextFieldDelegate>

@property (nonatomic,strong)ZXTextField *textfile1;
@property (nonatomic,strong)ZXTextField *textfile2;

@property (nonatomic,strong) NSString *MUid;
@property (nonatomic,strong) UIView *sexSeclectVIew;

@property (nonatomic,strong) NSString *xingStr;
@property (nonatomic,strong) NSString *dateStr;

@property (nonatomic,strong) NSString *nametype;
@property (nonatomic,strong) NSString *sextype;
@end

@implementation MUHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = KWhiteColor;
    _nametype = @"2";
    _sextype = @"2";
    self.navigationItem.title = @"起名";
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.image = IMAGE_NAMED(@"mainBgView");
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageview];

    [self CreatDetailUI];
}
-(void)CreatDetailUI{
    [self createMoreBtn];
   CGRect frame = CGRectMake(50, 180+30+20, KScreenWidth-100, 40);
   _textfile1 = [[ZXTextField alloc] initWithFrame:frame withIcon:@"xingStr.png" withPlaceholderText:@"姓氏"];
   _textfile1.frame = frame;
   _textfile1.inputText.tag =200;
   _textfile1.inputText.autocapitalizationType = UITextAutocapitalizationTypeNone;
   _textfile1.inputText.autocorrectionType = UITextAutocorrectionTypeNo;
   _textfile1.inputText.keyboardType = UIKeyboardTypeDefault;
   _textfile1.inputText.delegate = self;
   _textfile1.inputText.textColor = KGrayColor;
   UIView *view = [[UIView alloc] initWithFrame:frame];
   [self.view addSubview:view];
   ViewBorderRadius(view, 20, 0.5, KRedColor);
   

   [self.view addSubview:_textfile1];
   
   CGRect frame2 = CGRectMake(50, 180+30+20+30+40, KScreenWidth-100, 40);
   _textfile2 = [[ZXTextField alloc] initWithFrame:frame2 withIcon:@"birthdayDataStr.png" withPlaceholderText:@"生辰"];
   _textfile2.frame = frame2;
   _textfile2.inputText.tag =201;
   _textfile2.inputText.autocapitalizationType = UITextAutocapitalizationTypeNone;
   _textfile2.inputText.autocorrectionType = UITextAutocorrectionTypeNo;
   _textfile2.inputText.keyboardType = UIKeyboardTypeDefault;
   _textfile2.inputText.delegate = self;
   _textfile2.inputText.textColor = KGrayColor;
   
   [self.view addSubview:_textfile2];
   
   
   
   UIButton *dataBtn = [UIButton buttonWithType:0];
   dataBtn.frame = frame2;
   ViewBorderRadius(dataBtn, 20, 0.5, KRedColor);
   [dataBtn addTarget:self action:@selector(MudataButtonClicked) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:dataBtn];
   
   [self creatMoreSexBtn];
   
   UIButton *makesureBtn = [UIButton buttonWithType:0];
   [self.view addSubview:makesureBtn];
   [makesureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(self.sexSeclectVIew).mas_offset(@(80+40));
       make.left.mas_equalTo(self.view).mas_offset(80);
       make.right.mas_equalTo(self.view).mas_offset(-80);
       make.height.mas_offset(50);
   }];
   
   ViewRadius(makesureBtn, 25);
   makesureBtn.backgroundColor = KRedColor;
   [makesureBtn setTitle:@"确定" forState:0];
   [makesureBtn setTitleColor:KWhiteColor forState:0];
   [makesureBtn addTarget:self action:@selector(confirmBtnClicked) forControlEvents:UIControlEventTouchUpInside];
}
- (void)createMoreBtn {
    
    
    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
    CGFloat margin = KScreenWidth-160-100;
    CGRect btnRect = CGRectMake(50, 180, 80, 25);
    NSArray *NameArr = @[@"双字", @"单字"];
    for (int i=0;i<NameArr.count;i++) {
        NSString* optionTitle = NameArr[i];
        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect];
        
        [btn addTarget:self action:@selector(onRadioButtonValueChanged1:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.x += (margin+100);
        btn.tag = 500+i;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setImage:[UIImage imageNamed:@"oneChoose"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"oneChoose_sel"] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 55)];
        [self.view addSubview:btn];
        [buttonsArray addObject:btn];
    }
    
    [buttonsArray[0] setGroupButtons:buttonsArray]; // 把按钮放进群组中
    
    [buttonsArray[0] setSelected:YES]; // 初始化第一个按钮为选中状态
    
}
- (void)creatMoreSexBtn{
    _sexSeclectVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 80)];
    [self.view addSubview:_sexSeclectVIew];
    [_sexSeclectVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self->_textfile2).mas_offset(@(20+40));
        make.height.mas_offset(@(100));
    }];
    
    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
    CGFloat margin = KScreenWidth-160-100;
    CGRect btnRect = CGRectMake(50, 10, 80, 60);
    NSArray *normalIconArr = @[@"manIcon",@"womanIcon"];
    NSArray *selIconArr = @[@"manIcon_sel",@"womanIcon_sec"];
    NSArray *NameArr = @[@"男孩", @"女孩"];

    for (int i=0;i<normalIconArr.count;i++) {
        NSString* optionTitle = NameArr[i];

        RadioButton* btn = [[RadioButton alloc] initWithFrame:btnRect];
        [btn addTarget:self action:@selector(onRadioButtonValueChanged2:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.x += (margin+100);
        btn.tag = 400+i;
        [btn setTitle:optionTitle forState:UIControlStateNormal];

        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setImage:[UIImage imageNamed:normalIconArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selIconArr[i]] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [_sexSeclectVIew addSubview:btn];
        [buttonsArray addObject:btn];
    }
    
    [buttonsArray[0] setGroupButtons:buttonsArray]; // 把按钮放进群组中
    
    [buttonsArray[0] setSelected:YES]; // 初始化第一个按钮为选中状态
}

#pragma mark ---选择日期---

- (void)MudataButtonClicked{
    [self.textfile1.inputText resignFirstResponder];
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeDateHourMinute;
    datePickManager.confirmButtonTextColor = KRedColor;
    [self presentViewController:datePickManager animated:false completion:nil];

    datePicker.selectedDate = ^(NSDateComponents *dateComponents) {
        NSString *month = dateComponents.month<10?[NSString stringWithFormat:@"0%li",(long)dateComponents.month]:kStringFormat(@"%li",(long)dateComponents.month);
        NSString *day = dateComponents.day<10?[NSString stringWithFormat:@"0%li",(long)dateComponents.day]:kStringFormat(@"%li",(long)dateComponents.day);
        NSString *dateStr = [NSString stringWithFormat:@"%li-%@-%@",(long)dateComponents.year,month,day];
        self->_textfile2.inputText.text = [NSString stringWithFormat:@"%li-%@-%@ %li:%li",(long)dateComponents.year,month,day,(long)dateComponents.hour,(long)dateComponents.minute];
        self.dateStr = dateStr;
        self->_textfile2.inputText.backgroundColor = RGB(204, 220, 229);

    };

}

-(void)confirmBtnClicked{
    if (self.dateStr.length==0||self.textfile1.inputText.text.length==0) {
        [SVProgressHUD showInfoWithStatus:@"请正确输入您的信息"];
    }else{
        _xingStr = self.textfile1.inputText.text;
        [self getNetWorking];
    }
}

- (void)getNetWorking{

    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];

    NSDictionary *dic = @{
                        @"first_name":self->_xingStr,
                        @"name_type":self.nametype,
                        @"sex":self.sextype,
                        @"birthday":NSStringFormat(@"%@ 12:00:00",self.dateStr),
                        @"appname":@"naming_fugui_iphone",
                        @"client":@"iPhone",
                        @"device":@"iPhone",
                        @"market":@"appstore",
                        @"openudid":@"82257E72-44DC-43AD-A6AF-26BF2DF4B676",
                        @"sign":@"52ece8b5537a9ddbdbc8e3a478fa64ed",
                        @"ver":@"1.8",
                        @"idfa":[self getIDFA],
                        @"user_id":@""

                        };
    NSString *urlStr = @"get_bazi_id";

    [manager POST:[baseUrl stringByAppendingString:urlStr] parameters:dic headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dateDic = (NSDictionary *)responseObject;
            self.MUid = dateDic[@"data"][@"bazi_id"];
            [self goDetailController];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:@"网络请求失败，请稍后重试"];

        }];
}
// 获取IDFA的方法
-(NSString *)getIDFA
{
    SEL advertisingIdentifierSel = sel_registerName("advertisingIdentifier");
    SEL UUIDStringSel = sel_registerName("UUIDString");

    ASIdentifierManager *manager = [ASIdentifierManager sharedManager];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if([manager respondsToSelector:advertisingIdentifierSel]) {

        id UUID = [manager performSelector:advertisingIdentifierSel];

        if([UUID respondsToSelector:UUIDStringSel]) {

            return [UUID performSelector:UUIDStringSel];

        }

    }
#pragma clang diagnostic pop
    return nil;
}
-(void)goDetailController{
    MUNameListVC *namelistVC = [[MUNameListVC alloc] init];
    namelistVC.bazi_id = self.MUid;
    namelistVC.firstname = self.xingStr;
    namelistVC.name_type = self.nametype;
    namelistVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:namelistVC animated:YES];
    
}
#pragma mark ---单选按钮---
- (void)onRadioButtonValueChanged1:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag ==500) {
        _nametype = @"1";
    }else{
        _nametype = @"2";
    }
}
- (void)onRadioButtonValueChanged2:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag ==400) {
        _sextype = @"2";
    }else{
        _sextype = @"1";
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text.length <= 0 && textField.tag ==200) {
        [_textfile1 textBeginEditing];
    }else if (textField.text.length <= 0 && textField.tag ==201){
        [_textfile2 textEndEditing];
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length <= 0 && textField.tag ==200) {
        [_textfile1 textEndEditing];
    }else if (textField.text.length <= 0 && textField.tag ==201){
    }
}
@end
