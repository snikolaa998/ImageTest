import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
    static let identefier = "CircleCollectionViewCell"
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderWidth = 1.0
        self.backgroundColor = .blue
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
