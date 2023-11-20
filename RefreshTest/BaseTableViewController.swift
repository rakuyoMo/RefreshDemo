import UIKit

class BaseTableViewController: UIViewController {
    private(set) lazy var tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    lazy var refreshControl = UIRefreshControl()
    
    @objc
    dynamic func refresh() { }
}

// MARK: - Life cycle

extension BaseTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(_refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.backgroundColor = .systemGroupedBackground
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Request

private extension BaseTableViewController {
    @objc
    func _refresh(_ control: UIRefreshControl) {
        NSLog("Target refresh：")
//        Thread.callStackSymbols.forEach { print($0) }
        
        requestWithRefresh()
        
//        let selector = #selector(requestWithRefresh)
//        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: selector, object: nil)
//        perform(selector, with: nil, afterDelay: 0.3)
    }
    
    @objc
    func requestWithRefresh() {
        refresh()
    }
}
