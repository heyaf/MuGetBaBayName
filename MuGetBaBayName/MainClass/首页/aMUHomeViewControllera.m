
#import "aMUHomeViewControllera.h"
#import "bMUNameListVCb.h"
#import <AdSupport/AdSupport.h>

@interface aMUHomeViewControllera ()<UITextFieldDelegate>

@property (nonatomic,strong)LinkTextbookTheatre *hTextfile1h;
@property (nonatomic,strong)LinkTextbookTheatre *jTextfile2j;

@property (nonatomic,strong) NSString *mMUidm;
@property (nonatomic,strong) UIView *fSexSeclectVIewf;

@property (nonatomic,strong) NSString *oXingStro;
@property (nonatomic,strong) NSString *dateColleague;

@property (nonatomic,strong) NSString *vNametypev;
@property (nonatomic,strong) NSString *zSextypez;
@end

@implementation aMUHomeViewControllera

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KWhiteColor;
    _vNametypev = @"2";
    _zSextypez = @"2";
    self.navigationItem.title = [NSString stringWithFormat:@"%@%@",@"宝宝",@"起名"];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageview.image = IMAGE_NAMED(@"masterYetVista");
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageview];

    [self fCreatDetailUIf];
}
-(void)fCreatDetailUIf{
    [self produceFewerPasteboard];
   CGRect frame = CGRectMake(50, 180+30+20, KBShieldWidth-100, 40);
   _hTextfile1h = [[LinkTextbookTheatre alloc] initWithFrame:frame sWithIcons:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"oXi",@"n",@"gStr",@"o",@".pn",@"g"] kWithPlaceholderTextk:[NSString stringWithFormat:@"%@%@",@"姓",@"氏"]];
   _hTextfile1h.frame = frame;
   _hTextfile1h.zInputTextz.tag =200;
   _hTextfile1h.zInputTextz.autocapitalizationType = UITextAutocapitalizationTypeNone;
   _hTextfile1h.zInputTextz.autocorrectionType = UITextAutocorrectionTypeNo;
   _hTextfile1h.zInputTextz.keyboardType = UIKeyboardTypeDefault;
   _hTextfile1h.zInputTextz.delegate = self;
   _hTextfile1h.zInputTextz.textColor = KGrayColor;
   UIView *view = [[UIView alloc] initWithFrame:frame];
   [self.view addSubview:view];
   ViewBorderRadius(view, 20, 0.5, KRedColor);
   

   [self.view addSubview:_hTextfile1h];
   
   CGRect frame2 = CGRectMake(50, 180+30+20+30+40, KBShieldWidth-100, 40);
   _jTextfile2j = [[LinkTextbookTheatre alloc] initWithFrame:frame2 sWithIcons:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"yBirthdayD",@"ataStry",@".",@"p",@"n",@"g"] kWithPlaceholderTextk:[NSString stringWithFormat:@"%@%@",@"生",@"辰"]];
   _jTextfile2j.frame = frame2;
   _jTextfile2j.zInputTextz.tag =201;
   _jTextfile2j.zInputTextz.autocapitalizationType = UITextAutocapitalizationTypeNone;
   _jTextfile2j.zInputTextz.autocorrectionType = UITextAutocorrectionTypeNo;
   _jTextfile2j.zInputTextz.keyboardType = UIKeyboardTypeDefault;
   _jTextfile2j.zInputTextz.delegate = self;
   _jTextfile2j.zInputTextz.textColor = KGrayColor;
   
   [self.view addSubview:_jTextfile2j];
   
   
   
   UIButton *dataBtn = [UIButton buttonWithType:0];
   dataBtn.frame = frame2;
   ViewBorderRadius(dataBtn, 20, 0.5, KRedColor);
   [dataBtn addTarget:self action:@selector(uMudataButtonClickedu) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:dataBtn];
   
   [self jCreatMoreSexBtnj];
   
   UIButton *makesureBtn = [UIButton buttonWithType:0];
   [self.view addSubview:makesureBtn];
   [makesureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.mas_equalTo(self.fSexSeclectVIewf).mas_offset(@(80+40));
       make.left.mas_equalTo(self.view).mas_offset(80);
       make.right.mas_equalTo(self.view).mas_offset(-80);
       make.height.mas_offset(50);
   }];
   
   ViewRadius(makesureBtn, 25);
   makesureBtn.backgroundColor = KRedColor;
   [makesureBtn setTitle:[NSString stringWithFormat:@"%@%@",@"确",@"定"] forState:0];
   [makesureBtn setTitleColor:KWhiteColor forState:0];
   [makesureBtn addTarget:self action:@selector(uConfirmBtnClickedu) forControlEvents:UIControlEventTouchUpInside];
}
- (void)produceFewerPasteboard {
    
    
    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
    CGFloat margin = KBShieldWidth-160-100;
    CGRect btnRect = CGRectMake(50, 180, 80, 25);
    NSArray *NameArr = @[[NSString stringWithFormat:@"%@%@",@"双",@"字"], [NSString stringWithFormat:@"%@%@",@"单",@"字"]];
    for (int i=0;i<NameArr.count;i++) {
        NSString* optionTitle = NameArr[i];
        tRadioButtont* btn = [[tRadioButtont alloc] initWithFrame:btnRect];
        
        [btn addTarget:self action:@selector(eOnRadioButtonValueChanged1e:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.x += (margin+100);
        btn.tag = 500+i;
        [btn setTitle:optionTitle forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@%@",@"jOn",@"eChoose",@"j"]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%@%@",@"iOneChoo",@"se_",@"seli"]] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 55)];
        [self.view addSubview:btn];
        [buttonsArray addObject:btn];
    }
    
    [buttonsArray[0] setXGroupButtonsx:buttonsArray]; 
    
    [buttonsArray[0] setSelected:YES]; 
    
}
- (void)jCreatMoreSexBtnj{
    _fSexSeclectVIewf = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KBShieldWidth, 80)];
    [self.view addSubview:_fSexSeclectVIewf];
    [_fSexSeclectVIewf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self->_jTextfile2j).mas_offset(@(20+40));
        make.height.mas_offset(@(100));
    }];
    
    NSMutableArray* buttonsArray = [NSMutableArray arrayWithCapacity:3];
    CGFloat margin = KBShieldWidth-160-100;
    CGRect btnRect = CGRectMake(50, 10, 80, 60);
    NSArray *normalIconArr = @[[NSString stringWithFormat:@"%@%@",@"manki",@"ndPicture"],[NSString stringWithFormat:@"%@%@%@%@%@",@"uWo",@"man",@"I",@"con",@"u"]];
    NSArray *selIconArr = @[[NSString stringWithFormat:@"%@%@%@",@"dManIcon_s",@"el",@"d"],[NSString stringWithFormat:@"%@%@%@%@",@"e",@"WomanIcon_",@"sec",@"e"]];
    NSArray *NameArr = @[[NSString stringWithFormat:@"%@%@",@"男",@"孩"], [NSString stringWithFormat:@"%@%@",@"女",@"孩"]];

    for (int i=0;i<normalIconArr.count;i++) {
        NSString* optionTitle = NameArr[i];

        tRadioButtont* btn = [[tRadioButtont alloc] initWithFrame:btnRect];
        [btn addTarget:self action:@selector(oOnRadioButtonValueChanged2o:) forControlEvents:UIControlEventValueChanged];
        btnRect.origin.x += (margin+100);
        btn.tag = 400+i;
        [btn setTitle:optionTitle forState:UIControlStateNormal];

        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [btn setImage:[UIImage imageNamed:normalIconArr[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selIconArr[i]] forState:UIControlStateSelected];
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        [_fSexSeclectVIewf addSubview:btn];
        [buttonsArray addObject:btn];
    }
    
    [buttonsArray[0] setXGroupButtonsx:buttonsArray]; 
    
    [buttonsArray[0] setSelected:YES]; 
}


- (void)uMudataButtonClickedu{
    [self.hTextfile1h.zInputTextz resignFirstResponder];
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    PGDatePicker *datePicker = datePickManager.datePicker;
    datePicker.datePickerMode = PGDatePickerModeDateHourMinute;
    datePickManager.confirmButtonTextColor = KRedColor;
    [self presentViewController:datePickManager animated:false completion:nil];

    datePicker.selectedDate = ^(NSDateComponents *dateComponents) {
        NSString *month = dateComponents.month<10?[NSString stringWithFormat:@"0%li",(long)dateComponents.month]:kStringFormat(@"%li",(long)dateComponents.month);
        NSString *day = dateComponents.day<10?[NSString stringWithFormat:@"0%li",(long)dateComponents.day]:kStringFormat(@"%li",(long)dateComponents.day);
        NSString *dateColleague = [NSString stringWithFormat:@"%li-%@-%@",(long)dateComponents.year,month,day];
        self->_jTextfile2j.zInputTextz.text = [NSString stringWithFormat:@"%li-%@-%@ %li:%li",(long)dateComponents.year,month,day,(long)dateComponents.hour,(long)dateComponents.minute];
        self.dateColleague = dateColleague;
        self->_jTextfile2j.zInputTextz.backgroundColor = RGB(204, 220, 229);

    };

}

-(void)uConfirmBtnClickedu{
    if (self.dateColleague.length==0||self.hTextfile1h.zInputTextz.text.length==0) {
        [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"%@%@%@",@"请正",@"确输入您的信",@"息"]];
    }else{
        _oXingStro = self.hTextfile1h.zInputTextz.text;
        [self getMeshingWork];
    }
}

- (void)getMeshingWork{

    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];

    NSDictionary *dic = @{
                        [NSString stringWithFormat:@"%@%@%@%@",@"fir",@"st_na",@"m",@"e"]:self->_oXingStro,
                        [NSString stringWithFormat:@"%@%@%@%@",@"describeTyp",@"ew",@"rit",@"e"]:self.vNametypev,
                        [NSString stringWithFormat:@"%@%@",@"se",@"x"]:self.zSextypez,
                        @"birthday":kStringFormat(@"%@ 12:00:00",self.dateColleague),
                        [NSString stringWithFormat:@"%@%@",@"ap",@"pname"]:[NSString stringWithFormat:@"%@%@%@%@%@%@",@"naming_",@"f",@"ugui_ip",@"ho",@"n",@"e"],
                        [NSString stringWithFormat:@"%@%@%@%@",@"c",@"li",@"e",@"nt"]:[NSString stringWithFormat:@"%@%@%@%@",@"iP",@"ho",@"n",@"e"],
                        [NSString stringWithFormat:@"%@%@%@",@"de",@"vic",@"e"]:[NSString stringWithFormat:@"%@%@%@%@",@"iP",@"ho",@"n",@"e"],
                        [NSString stringWithFormat:@"%@%@%@",@"ma",@"rke",@"t"]:[NSString stringWithFormat:@"%@%@%@%@",@"a",@"ppsto",@"r",@"e"],
                        [NSString stringWithFormat:@"%@%@%@",@"o",@"penud",@"id"]:[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",@"82257E7",@"2-",@"4",@"4",@"DC-43AD-A6AF-26B",@"F2DF4",@"B",@"67",@"6"],
                        [NSString stringWithFormat:@"%@%@%@",@"si",@"g",@"n"]:[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",@"52ece8b55",@"37a9dd",@"bdbc8e3a4",@"7",@"8f",@"a64",@"e",@"d"],
                        [NSString stringWithFormat:@"%@%@",@"v",@"er"]:[NSString stringWithFormat:@"%@%@",@"1",@".8"],
                        [NSString stringWithFormat:@"%@%@",@"i",@"dfa"]:[self getNIDFAn],
                        [NSString stringWithFormat:@"%@%@",@"u",@"ser_id"]:@""

                        };
    NSString *urlStr = [NSString stringWithFormat:@"%@%@%@%@%@",@"get",@"_ba",@"zi_",@"i",@"d"];

    [manager POST:[wBaseUrlw stringByAppendingString:urlStr] parameters:dic headers:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dateDic = (NSDictionary *)responseObject;
            self.mMUidm = dateDic[@"data"][@"bazi_id"];
            [self workContingentAccountant];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@%@%@%@",@"网络请求失败，",@"请稍后",@"重",@"试"]];

        }];
}

-(NSString *)getNIDFAn
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
-(void)workContingentAccountant{
    bMUNameListVCb *namelistVC = [[bMUNameListVCb alloc] init];
    namelistVC.lBazi_idl = self.mMUidm;
    namelistVC.qFirstnameq = self.oXingStro;
    namelistVC.describeTypewrite = self.vNametypev;
    namelistVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:namelistVC animated:YES];
    
}
- (void)eOnRadioButtonValueChanged1e:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    if (btn.tag ==500) {
        _vNametypev = @"1";
    }else{
        _vNametypev = @"2";
    }
}
- (void)oOnRadioButtonValueChanged2o:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag ==400) {
        _zSextypez = @"2";
    }else{
        _zSextypez = @"1";
    }
}
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.text.length <= 0 && textField.tag ==200) {
        [_hTextfile1h textualMatterEndRedact];
    }else if (textField.text.length <= 0 && textField.tag ==201){
        [_jTextfile2j fTextEndEditingf];
        
    }
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length <= 0 && textField.tag ==200) {
        [_hTextfile1h fTextEndEditingf];
    }else if (textField.text.length <= 0 && textField.tag ==201){
    }
}
@end
