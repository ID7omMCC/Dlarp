#import <UIKit/UIKit.h>

@interface Dlarp999xViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *appsArray;
@end

@implementation Dlarp999xViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dlarp Hub [999x Mode]";
    
    self.view.backgroundColor = [UIColor colorWithRed:0.08 green:0.08 blue:0.12 alpha:1.0];
    
    self.appsArray = [NSMutableArray arrayWithArray:@[
        @{ @"name": @"Discord (999x Larp Edition)", @"status": @"جاهز للحقن وتعديل المحادثات", @"badge": @"999x" },
        @{ @"name": @"Custom Chat Bypasser", @"status": @"مفعل - فك القيود بالكامل", @"badge": @"VIP" },
        @{ @"name": @"Social Hub & Requests", @"status": @"مراقبة المضافين وتعديل الطلبات", @"badge": @"Active" }
    ]];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"Cell999x";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSDictionary *appInfo = self.appsArray[indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:0.12 green:0.12 blue:0.18 alpha:1.0];
    cell.textLabel.text = appInfo[@"name"];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.text = appInfo[@"status"];
    cell.detailTextLabel.textColor = [UIColor systemGreenColor];
    
    UIButton *launchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [launchBtn setTitle:@"تشغيل 999x" forState:UIControlStateNormal];
    launchBtn.frame = CGRectMake(0, 0, 90, 36);
    launchBtn.backgroundColor = [UIColor systemIndigoColor];
    [launchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    launchBtn.layer.cornerRadius = 10;
    launchBtn.tag = indexPath.row;
    [launchBtn addTarget:self action:@selector(launch999xAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = launchBtn;
    
    return cell;
}

- (void)launch999xAction:(UIButton *)sender {
    NSDictionary *appInfo = self.appsArray[sender.tag];
    NSString *msg = [NSString stringWithFormat:@"تم تفعيل وضع 999x الخارق على [%@] بنجاح! جاري تجاوز الحماية وفتح بيئة الـ Larping الكاملة.", appInfo[@"name"]];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"🚀 Dlarp 999x Engine" 
                               message:msg 
                               preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"إغلاق" style:UIAlertActionStyleDestructive handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions {
    self.window = [[UIWindow alloc] init];
    Dlarp999xViewController *vc = [[Dlarp999xViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.barStyle = UIBarStyleBlack;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
