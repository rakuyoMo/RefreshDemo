import UIKit

class ViewController: BaseTableViewController {
    private lazy var dataSource = [
        ["A": ["1", "2", "3"]],
        ["B": ["1", "2", "3"]],
    ]
}

// MARK: - Life cycle

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "List"
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
//        tableView.estimatedRowHeight = 0
//        tableView.estimatedSectionHeaderHeight = 0
//        tableView.estimatedSectionFooterHeight = 0
        
        refresh()
    }
}

// MARK: - Request

extension ViewController {
    override func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) { [weak self] in
            guard let this = self else { return }
            
            this.refreshControl.endRefreshing()
            
            this.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return dataSource[section].keys.first
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].values.first?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = {
            let data = dataSource[indexPath.section]
            let key = data.keys.first ?? "not find key"
            let value = data.values.first?[indexPath.row] ?? "not find value"
            
            return key + " - " + value
        }()
        
        return cell
    }
}
