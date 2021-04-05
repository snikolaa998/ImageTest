//
//  ViewController.swift
//  CircleImageView
//
//  Created by User on 3.4.21..
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    private var collectionView: UICollectionView!
    var imageArray: [UIImage] = []
    @IBOutlet weak var buttonUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layerColor = CAGradientLayer()
        let colorTop = UIColor(red: 122.0 / 255.0, green: 115.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 179.0 / 255.0, green: 100.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0).cgColor
        layerColor.startPoint = CGPoint(x: 0.5, y: 1.0)
        layerColor.endPoint = CGPoint(x: 0.5, y: 0.0)
        layerColor.colors = [colorTop, colorBottom]
        layerColor.locations = [0.0, 1.0]
        layerColor.frame = buttonUI.bounds
        buttonUI.layer.cornerRadius = 10
        layerColor.cornerRadius = buttonUI.layer.cornerRadius
        layerColor.masksToBounds = true
        buttonUI.layer.insertSublayer(layerColor, below: buttonUI.imageView?.layer)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cellSize = self.view.bounds.size.width * 0.16
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CircleCollectionViewCell.self, forCellWithReuseIdentifier: CircleCollectionViewCell.identefier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        guard let myCollection = collectionView else {
            return
        }
        view.addSubview(myCollection)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: self.view.frame.size.height * 0.10).integral
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCollectionViewCell.identefier, for: indexPath) as! CircleCollectionViewCell
        cell.configure(with: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageArray.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            if imageArray.count == 5 {
                imageArray[4] = image
                collectionView.reloadData()
            } else {
                imageArray.append(image)
                collectionView.reloadData()
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickPhotoButton(_ sender: UIButton) {
        
        if imageArray.count == 5 {
            let alert = UIAlertController(title: "Whoops! Maximum number of picture is 5.", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Okay", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            present(imagePickerController, animated: true)
        }
        
    }
    
}

