import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    
    static let identefier = "CircleCollectionViewCell"
    private let myButton: UIButton = {
        let button = UIButton()
        button.setTitle("x", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = false
        button.frame = CGRect(x: 0, y: 0, width: 26, height: 26).integral
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        contentView.insertSubview(myButton, belowSubview: myImageView)
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
        myImageView.layer.shadowColor = UIColor.black.cgColor
        myImageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        myImageView.layer.shadowOpacity = 0.7
        myImageView.layer.shadowRadius = 4.0
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.masksToBounds = true
        myImageView.clipsToBounds = true
        myImageView.frame = contentView.bounds
//        myImageView.addSubview(myButton)
    }
    
    public func configure(with image: UIImage) {
        myImageView.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
}
