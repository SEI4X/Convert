//
//  ProfileViewController.swift
//  Convert
//
//  Created by Alexei Mashkov on 21.06.2021.
//

import UIKit
import LXPageControl

class ProfileViewController: UIViewController, UICollectionViewDataSource,
                             UICollectionViewDelegateFlowLayout {

    private var scrollView = UIScrollView()
    private let secondColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00)
    //UIColor(red: 0.23, green: 0.79, blue: 0.95, alpha: 1.00)
    private let photoLayout = UICollectionViewFlowLayout()
    private var photoCollectionView: UICollectionView?
    private var nameAndAge = UILabel()
    private var centerButton = UIButton()
    private var topMenuView = UIView()
    private var topButtonsStack = UIStackView()
    private var contactsBtn = UIButton()
    private var mediaBtn = UIButton()
    private var groupsBtn = UIButton()
    private var likesBtn = UIButton()
    private lazy var city = UILabel()
    private lazy var job = UILabel()
    private lazy var userDescription = UILabel()
    private lazy var education = UILabel()
    private lazy var maritalStatus = UILabel()
    private lazy var gender = UILabel()
    private lazy var height = UILabel()
    private lazy var sexualOrientation = UILabel()
    private lazy var alcohol = UILabel()
    private lazy var smoking = UILabel()
    private lazy var userChildren = UILabel()
    private lazy var interests = UILabel()
    private lazy var tags = UILabel()
    private let aboutlbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "About"
        lbl.font = .systemFont(ofSize: 20, weight: .bold)
        lbl.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        return lbl
    }()
    private lazy var pageControl: LXPageControl = {
        let pc = LXPageControl()
        pc.currentPage = 0
        pc.pages = 4
        pc.activeColor = secondColor
        pc.inactiveColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.9)
        pc.elementHeight = 3
        pc.elementWidth = view.frame.width / 4 - 4 * 5
        pc.cornerRadius = 1.5
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .white
        configNavigationBar()
        configureScrollView()
        configurePhotoCollectionView()
        configTopMenuView()
        configureCenterButton()
        configureNameAndAgeLbl()
        configureTopButtonsStackView()
        configureAboutLable()
    }
    
    private func configureScrollView() {
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.frame = CGRect(x: 0, y: 0,
                                  width: view.frame.width,
                                  height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        view.addSubview(scrollView)
    }
    
    private func configureNameAndAgeLbl() {
        scrollView.addSubview(nameAndAge)
        nameAndAge.text = "Mark Andreevich,  28"
        nameAndAge.textColor = .white
        nameAndAge.font = .systemFont(ofSize: 24, weight: .bold)
        nameAndAge.frame = CGRect(x: 15, y: view.frame.height / 2 - 45, width: view.frame.width - 20, height: 40)
    }
    
    private func configTopMenuView() {
        scrollView.addSubview(topMenuView)
        topMenuView.layer.cornerRadius = 40
        topMenuView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        topMenuView.translatesAutoresizingMaskIntoConstraints = false
        topMenuView.topAnchor
            .constraint(equalTo: photoCollectionView!.bottomAnchor,constant: -40).isActive = true
        topMenuView.widthAnchor
            .constraint(equalToConstant: view.frame.width).isActive = true
        topMenuView.trailingAnchor
            .constraint(equalTo: view.trailingAnchor).isActive = true
        topMenuView.heightAnchor
            .constraint(equalToConstant: 100).isActive = true
        topMenuView.backgroundColor = .white
    }
    
    private func configureCenterButton() {
        topMenuView.addSubview(centerButton)
        centerButton.layer.cornerRadius = 35
        centerButton.clipsToBounds = true
        centerButton.layer.borderWidth = 2.5
        centerButton.layer.borderColor = secondColor.cgColor
        
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        centerButton.centerXAnchor
            .constraint(equalTo: topMenuView.centerXAnchor).isActive = true
        centerButton.centerYAnchor
            .constraint(equalTo: topMenuView.topAnchor).isActive = true
        centerButton.widthAnchor
            .constraint(equalToConstant: 70).isActive = true
        centerButton.heightAnchor
            .constraint(equalToConstant: 70).isActive = true
        centerButton.backgroundColor = .white
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 45, weight: .light)
        let img = UIImage(named: "settings-icon", in: .main, with: imageConfig)
        img?.withTintColor(secondColor, renderingMode: .alwaysTemplate)
        centerButton.setImage(img, for: .normal)
        centerButton.tintColor = secondColor
    }
    
    private func configureTopButtonsStackView() {
        contactsBtn = createButton(firstText: "56", secondText: "Contacts")
        mediaBtn = createButton(firstText: "4", secondText: "Groups")
        groupsBtn = createButton(firstText: "22", secondText: "Photos")
        likesBtn = createButton(firstText: "56", secondText: "Likes")
        
        contactsBtn.tintColor = .white
        
        topMenuView.addSubview(topButtonsStack)
        topButtonsStack.addArrangedSubview(contactsBtn)
        topButtonsStack.addArrangedSubview(groupsBtn)
        topButtonsStack.addArrangedSubview(mediaBtn)
        topButtonsStack.addArrangedSubview(likesBtn)
        topButtonsStack.axis = .horizontal
        topButtonsStack.alignment = .center
        topButtonsStack.distribution = .fillEqually
        topButtonsStack.spacing = 1
        
        topButtonsStack.translatesAutoresizingMaskIntoConstraints = false
        topButtonsStack.leadingAnchor
            .constraint(equalTo: topMenuView.leadingAnchor, constant: 15).isActive = true
        topButtonsStack.trailingAnchor
            .constraint(equalTo: topMenuView.trailingAnchor, constant: -15).isActive = true
        topButtonsStack.bottomAnchor
            .constraint(equalTo: topMenuView.bottomAnchor, constant: -10).isActive = true
        topButtonsStack.heightAnchor
            .constraint(equalToConstant: 50).isActive = true
        topButtonsStack.backgroundColor = .clear
    }
    
    private func configureAboutLable() {
        scrollView.addSubview(aboutlbl)
        aboutlbl.translatesAutoresizingMaskIntoConstraints = false
        aboutlbl.topAnchor
            .constraint(equalTo: topMenuView.bottomAnchor, constant: 5).isActive = true
        aboutlbl.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 27).isActive = true
        aboutlbl.trailingAnchor
            .constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        aboutlbl.heightAnchor
            .constraint(equalToConstant: 25).isActive = true
    }
    
    private func configureCityLbl() {
        scrollView.addSubview(aboutlbl)
        aboutlbl.translatesAutoresizingMaskIntoConstraints = false
        aboutlbl.topAnchor
            .constraint(equalTo: topMenuView.bottomAnchor, constant: 5).isActive = true
        aboutlbl.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 27).isActive = true
        aboutlbl.trailingAnchor
            .constraint(equalTo: scrollView.trailingAnchor, constant: -10).isActive = true
        aboutlbl.heightAnchor
            .constraint(equalToConstant: 25).isActive = true
    }
    
    private func createButton(firstText: NSString, secondText: NSString) -> UIButton {
        let btn = UIButton()
        btn.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        let buttonText: NSString = "\(firstText)\n\(secondText)" as NSString

        //getting the range to separate the button title strings
        let newlineRange: NSRange = buttonText.range(of: "\n")

        //getting both substrings
        var substring1 = ""
        var substring2 = ""

        if(newlineRange.location != NSNotFound) {
            substring1 = buttonText.substring(to: newlineRange.location)
            substring2 = buttonText.substring(from: newlineRange.location)
        }

            //assigning diffrent fonts to both substrings
        let font1: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        let attributes1 = [NSMutableAttributedString.Key.font: font1]
        let attrString1 = NSMutableAttributedString(string: substring1,
                                                    attributes: attributes1)

        let font2: UIFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        let attributes2 = [NSMutableAttributedString.Key.font: font2]
        let attrString2 = NSMutableAttributedString(string: substring2,
                                                    attributes: attributes2)

            //appending both attributed strings
        attrString1.append(attrString2)

            //assigning the resultant attributed strings to the button
        btn.setAttributedTitle(attrString1, for: [])
        btn.titleLabel?.textAlignment = NSTextAlignment.center
        btn.setTitleColor(UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1), for: .normal)
        
        return btn
    }
    
    // MARK: - COllection view configuration
    private func configurePhotoCollectionView() {
        photoLayout.sectionInset = .zero
        photoLayout.scrollDirection = .horizontal
        
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        pageControl.frame = CGRect(x: 0, y: topPadding /*topPadding*/,
                                   width: view.frame.width, height: 5)
        photoCollectionView = UICollectionView(
            frame: CGRect(x: 0, y: 0,
                          width: view.frame.width,
                          height: view.frame.height / 2 + 80),
            collectionViewLayout: photoLayout)
        photoCollectionView!.backgroundColor = .white
        photoCollectionView!.register(UICollectionViewCell.self,
                                      forCellWithReuseIdentifier: "cell")
        photoCollectionView?.showsHorizontalScrollIndicator = false
        photoCollectionView?.showsVerticalScrollIndicator = false
        photoCollectionView?.isPagingEnabled = true
        photoCollectionView?.dataSource = self
        photoCollectionView?.delegate = self
        
        scrollView.addSubview(photoCollectionView!)
        scrollView.addSubview(pageControl)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        let img = UIImageView(frame: CGRect(x: 0, y: 0,
                                            width: cell.frame.width,
                                            height: cell.frame.height))
        img.image = UIImage(named: "test")
        img.contentMode = .scaleAspectFill
        cell.backgroundView = img
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height / 2 + 80)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / photoCollectionView!.frame.width)
    }
}

//MARK: - Just for canvas

import SwiftUI

struct AdvancedProvider2: PreviewProvider {
    static var previews: some View {
        ContainterView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainterView: UIViewControllerRepresentable {
        
        let tabBar = ProfileViewController()
        func makeUIViewController(context: UIViewControllerRepresentableContext<AdvancedProvider2.ContainterView>) -> ProfileViewController {
            return tabBar
        }
        
        func updateUIViewController(_ uiViewController: AdvancedProvider2.ContainterView.UIViewControllerType, context: UIViewControllerRepresentableContext<AdvancedProvider2.ContainterView>) {
            
        }
    }
}
