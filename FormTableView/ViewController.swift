import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView = {
        var tableview = UITableView(frame: .zero, style: .grouped)
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = 200
        tableview.register(CustomFormTableViewCell.self, forCellReuseIdentifier: "CustomFormTableViewCell")
        tableview.register(FormHeaderView.self, forHeaderFooterViewReuseIdentifier: "FormHeaderView")
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
     var datasource = [SectionModel]() {
         didSet {
             tableView.reloadData()
         }
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpConstraints()
        datasource = SectionModel.getList()
    }
    func setUpUI() {
        self.tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "FormHeaderView") as! FormHeaderView
            return header
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 500
    }
}
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return datasource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomFormTableViewCell", for: indexPath) as! CustomFormTableViewCell
        cell.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        cell.data = datasource[indexPath.section].items[indexPath.row]
        
        if indexPath.row == 0 {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
}

