import UIKit

class CharacterCell: UITableViewCell {
   
   private let horizontalStack: UIStackView = {
       let stack = UIStackView()
       stack.translatesAutoresizingMaskIntoConstraints = false
       stack.axis = .horizontal
       stack.spacing = 16
       return stack
   }()

 private let imageCharacterView: UIImageView = {
       let image = UIImageView()
       image.translatesAutoresizingMaskIntoConstraints = false
       image.layer.cornerRadius = 18
       image.layer.masksToBounds = true
       image.backgroundColor = .blue
       image.backgroundColor = .systemGray2
       return image
   }()

   private let verticalStack: UIStackView = {
       let stack = UIStackView()
       stack.axis = .vertical
       stack.spacing = 8
       stack.distribution = .equalCentering
       return stack
   }()
   
   private let nameLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
       label.textColor = .black
       label.numberOfLines = 0
       return label
   }()
   
   private let releaseDateLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 14)
       label.textColor = .darkGray
       label.numberOfLines = 0
       return label
   }()
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
       setupContentView()
       addViewsInHierarchy()
       setupConstraints()
   }
   
   @available(*, unavailable)
   required init?(coder: NSCoder) {
       nil
   }

   func configure(character: Character) {
         nameLabel.text = character.name
       imageCharacterView.download(path: character.imageUrl ?? "")  
       
     }
 

  private func setupContentView() {
       selectionStyle = .none
      contentView.backgroundColor = UIColor(red: 122/255, green: 150/255, blue: 249/255, alpha: 1)
   }
   
   private func addViewsInHierarchy() {
       contentView.addSubview(horizontalStack)
       horizontalStack.addArrangedSubview(imageCharacterView)
       horizontalStack.addArrangedSubview(verticalStack)
       verticalStack.addArrangedSubview(UIView())
       verticalStack.addArrangedSubview(nameLabel)
       verticalStack.addArrangedSubview(UIView())
   }
   
   private func setupConstraints() {
       NSLayoutConstraint.activate([
           horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
           horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
           horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
           horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
       ])
       
       NSLayoutConstraint.activate([
           imageCharacterView.widthAnchor.constraint(equalToConstant: 90),
           imageCharacterView.heightAnchor.constraint(equalToConstant: 120)
       ])
   }

 

}
