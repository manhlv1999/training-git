import UIKit

class FormHeaderView: UITableViewHeaderFooterView {
        var stackView: UIStackView = {
            var stackview = UIStackView()
            stackview.axis = .vertical
            stackview.spacing = 10
            stackview.distribution = .fill
            stackview.translatesAutoresizingMaskIntoConstraints = false
            return stackview
        }()
        
        var titleLabel: UILabel = {
            var label = UILabel()
            label.text = "Mini Form"
            label.font = .boldSystemFont(ofSize: 27)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        var subTitleLabel: UILabel = {
            var label = UILabel()
            label.text = "Mini form groups multi-entry is one page"
            label.textColor = .systemGray
            label.font = .systemFont(ofSize: 15)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        var data: PersonModel! {
            didSet {
                filldata()
            }
        }
        override init(reuseIdentifier: String?) {
            super.init(reuseIdentifier: reuseIdentifier)
            setUpUI()
            setUpConstraints()
        }
        func setUpUI(){
            self.addSubview(stackView)
            stackView.addArrangedSubview(titleLabel)
            stackView.addArrangedSubview(subTitleLabel)
        }
        func setUpConstraints(){
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
                stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
                stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            ])
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        func filldata(){
            if data == nil {return}
            
            titleLabel.text = data.title
            subTitleLabel.text = data.subtitle
        }
    }


