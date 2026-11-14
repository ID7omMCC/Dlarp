#import <UIKit/UIKit.h>

@interface DlarpMainViewController : UIViewController
@property (nonatomic, strong) UITableView *appTableView;
@property (nonatomic, strong) NSArray *appList;
@end

@implementation DlarpMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Dlarp Hub";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.appList = @[
        @{ @"name": @"Discord Larp Edition", @"version": @"v1.0", @"status": @"جاهز للتشغيل" },
        @{ @"name": @"Custom Chat Mod", @"version": @"v2.1", @"status": @"مفعل" }
    ];
    
    self.appTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleInsetGrouped];
    self.appTableView.dataSource = (id<UITableViewDataSource>)self;
    self.appTableView.delegate = (id<UITableViewDelegate>)self;
    [self.view addSubview:self.appTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.appList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"AppCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSDictionary *app = self.appList[indexPath.row];
    cell.textLabel.text = app[@"name"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", app[@"version"], app[@"status"]];
    
    UIButton *openButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [openButton setTitle:@"فتح" forState:UIControlStateNormal];
    openButton.frame = CGRectMake(0, 0, 60, 30);
    [openButton addTarget:self action:@selector(openAppTapped:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryView = openButton;
    
    return cell;
}

- (void)openAppTapped:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Dlarp Container" 
                               message:@"جاري تشغيل بيئة الـ Larping وتجاوز القيود بنجاح!" 
                               preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"حسناً" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    DlarpMainViewController *mainVC = [[DlarpMainViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
