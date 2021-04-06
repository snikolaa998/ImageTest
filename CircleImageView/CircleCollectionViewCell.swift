import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identefier = "CircleCollectionViewCell"
    public let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setTitle("x", for: .normal)
        deleteButton.titleLabel?.textAlignment = .center
        deleteButton.backgroundColor = .white
        deleteButton.layer.cornerRadius = 12
        deleteButton.layer.masksToBounds = false
        deleteButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20).integral
        deleteButton.setTitleColor(.red, for: .normal)
        return deleteButton
    }()
    
    private let myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.layer.shadowColor = UIColor.black.cgColor
        myImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        myImageView.layer.shadowOpacity = 0.7
        myImageView.layer.shadowRadius = 4.0
        return myImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        contentView.insertSubview(deleteButton, aboveSubview: myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.masksToBounds = true
        self.myImageView.layer.cornerRadius = self.frame.size.height / 2
        myImageView.layer.borderWidth = 1.0
        myImageView.layer.borderColor = UIColor.white.cgColor
        
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.masksToBounds = true
        myImageView.clipsToBounds = true
        myImageView.frame = contentView.bounds
    }
    
    public func configure(with image: UIImage) {
        myImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
}
