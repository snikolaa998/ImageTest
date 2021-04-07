import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identefier = "CircleCollectionViewCell"
    private let outerView: UIView = {
        let outerView = UIView()
        outerView.clipsToBounds = false
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.3
        outerView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        outerView.layer.shadowRadius = 1
        
        return outerView
    }()
    public let deleteButton: UIButton = {
        let deleteButton = UIButton()
        let image = UIImage(named: "x_button")
        deleteButton.setImage(image, for: .normal)
        deleteButton.titleLabel?.textAlignment = .center
        deleteButton.backgroundColor = .white
        deleteButton.layer.cornerRadius = 10
        deleteButton.layer.masksToBounds = false
        deleteButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20).integral
        deleteButton.setTitleColor(.red, for: .normal)
        return deleteButton
    }()
    
    private let myImageView: UIImageView = {
        let myImageView = UIImageView()
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = myImageView.frame.height / 2
        return myImageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        myImageView.frame = outerView.bounds
//        outerView.layer.shadowPath = UIBezierPath(roundedRect: outerView.bounds, cornerRadius: myImageView.frame.height / 2).cgPath
        contentView.addSubview(outerView)
        outerView.addSubview(myImageView)
        contentView.insertSubview(deleteButton, aboveSubview: myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.masksToBounds = false
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
