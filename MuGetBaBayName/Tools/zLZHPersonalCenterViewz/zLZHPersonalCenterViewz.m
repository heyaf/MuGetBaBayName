
#import "zLZHPersonalCenterViewz.h"
#import "yLZHPersonalCenterCelly.h"
#import "DesktopLintelPerspective.h"

@interface zLZHPersonalCenterViewz()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView ;
@property(nonatomic,strong)DesktopLintelPerspective * copingPurview ;
@property(nonatomic,strong)NSArray * pCenterArrp ;
@property(nonatomic,assign)BOOL followUsherHeader ;

@end

@implementation zLZHPersonalCenterViewz

-(instancetype)initWithFrame:(CGRect)frame pCenterArrp:(NSArray *)pCenterArrp followUsherHeader:(BOOL)followUsherHeader{
    if ([super initWithFrame:frame]) {
        self.pCenterArrp = pCenterArrp ;
        self.followUsherHeader = followUsherHeader ;
        [self addSubview:self.tableView ];
    }
    return self ;
}
-(void)setExpandHalfwayProperlyCapabilities:(NSArray *)expandHalfwayProperlyCapabilities{
    _expandHalfwayProperlyCapabilities = expandHalfwayProperlyCapabilities ;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.pCenterArrp.count ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * rowArr = self.pCenterArrp[section];
    return rowArr.count ;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    yLZHPersonalCenterCelly * cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"%@%@%@%@",@"pc",@"C",@"el",@"l"] forIndexPath:indexPath] ;
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;

    
    NSArray * rowArr = self.pCenterArrp[indexPath.section];
    cell.kCenterNSk = rowArr[indexPath.row] ;
    
    NSArray * extendArr = self.expandHalfwayProperlyCapabilities[indexPath.section] ;
    cell.broadenHalfwayFlopNorth = extendArr[indexPath.row] ;
    
    
    if (indexPath.row==rowArr.count-1) {
        cell.rumpYokeHanker = @"Long" ;
    }
    return cell ;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray * rowArr = self.pCenterArrp[indexPath.section];

    if ([self.delegate respondsToSelector:@selector(mDidSelectRowTitlem:)]) {
        [self.delegate mDidSelectRowTitlem:rowArr[indexPath.row]];
    }
}

-(void)dTapHeaderClickd{
    if ([self.delegate respondsToSelector:@selector(mTapHeaderm)]) {
        [self.delegate mTapHeaderm];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.followUsherHeader && section==0) {
        return 120 ;
    }
   
    return 0.01f ;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (self.followUsherHeader && section==0) {
        return self.copingPurview;
    }
    UIView * copingPurview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0.01)];
    return copingPurview;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 15 ;
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * copingPurview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 15)];
    return copingPurview;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.frame];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor] ;
        _tableView.dataSource = self ;
        _tableView.delegate = self ;
        _tableView.rowHeight = 45 ;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
        [_tableView registerClass:[yLZHPersonalCenterCelly class] forCellReuseIdentifier:[NSString stringWithFormat:@"%@%@%@%@",@"pc",@"C",@"el",@"l"]];
    }
    return _tableView ;
}

-(DesktopLintelPerspective *)copingPurview{
    if (!_copingPurview) {
        _copingPurview = [DesktopLintelPerspective iIntHeaderViewi];
        _copingPurview.frame = CGRectMake(0, 0, self.frame.size.width, 120) ;
        [_copingPurview addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dTapHeaderClickd)]];
    }
    return _copingPurview ;
}

@end
