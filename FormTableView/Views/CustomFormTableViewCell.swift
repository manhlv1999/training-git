import UIKit

class CustomFormTableViewCell: UITableViewCell {
    
    var backGroundView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackView: UIStackView = {
        var stackview = UIStackView()
        stackview.axis = .horizontal
        stackview.spacing = 10
        stackview.distribution = .fill
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    var headerLabel: UILabel = {
        var label = UILabel()
        label.font = .boldSystemFont(ofSize: 23)
        label.text = "Basic Infoemation"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Blood T"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var subTitleLabel: UILabel = {
        var label = UILabel()
        label.text = "B+"
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var data: SettingModel! {
        didSet {
            filldata()
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        setUpConstraints()
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
    }
    func setUpUI(){
        self.addSubview(backGroundView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            backGroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backGroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backGroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            backGroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            stackView.leadingAnchor.constraint(equalTo: self.backGroundView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.backGroundView.trailingAnchor, constant: -30),
            stackView.topAnchor.constraint(equalTo: self.backGroundView.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.backGroundView.bottomAnchor, constant: -20),
        ])
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func filldata() {
        if data == nil {return}
            
        headerLabel.text = data.header
        titleLabel.text = data.title
        subTitleLabel.text = data.subtitle
    
    }

}
