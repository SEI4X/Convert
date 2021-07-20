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

    var scrollView = UIScrollView()
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
    private lazy var cityIcon = UIImageView()
    private lazy var job = UILabel()
    private lazy var jobIcon = UIImageView()
    private lazy var userDescription = UILabel()
    private lazy var userDescriptionIcon = UIImageView()
    private lazy var education = UILabel()
    private lazy var educationIcon = UIImageView()
    private lazy var maritalStatus = UILabel()
    private lazy var maritalStatusIcon = UIImageView()
    private lazy var gender = UILabel()
    private lazy var genderIcon = UIImageView()
    private lazy var height = UILabel()
    private lazy var heightIcon = UIImageView()
    private lazy var sexualOrientation = UILabel()
    private lazy var sexualOrientationIcon = UIImageView()
    private lazy var alcohol = UILabel()
    private lazy var alcoholIcon = UIImageView()
    private lazy var smoking = UILabel()
    private lazy var smokingIcon = UIImageView()
    private lazy var userChildren = UILabel()
    private lazy var userChildrenIcon = UIImageView()
    private lazy var interests = UILabel()
    private lazy var interestsIcon = UIImageView()
    private lazy var tags = UILabel()
    private lazy var tagsIcon = UIImageView()
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
        
        configureCity()
        configureJob()
        configureDescription()
        configureEducation()
        configureGender()
        configureSexualOrientation()
        configureMaritalStatus()
        configureDateOfBirth()
        
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
    
    // MARK: - Configure main information
    
    private func configureCity() {
        scrollView.addSubview(cityIcon)
        scrollView.addSubview(city)
        
        cityIcon.image = UIImage(named: "marker-icon")
        cityIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        city.text = "Moscow"
        city.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        city.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        cityIcon.translatesAutoresizingMaskIntoConstraints = false
        cityIcon.topAnchor
            .constraint(equalTo: aboutlbl.bottomAnchor, constant: 15).isActive = true
        cityIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        cityIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        cityIcon.heightAnchor
            .constraint(equalToConstant: city.text == "" ? 0 : 20).isActive = true
        
        city.translatesAutoresizingMaskIntoConstraints = false
        city.centerYAnchor
            .constraint(equalTo: cityIcon.centerYAnchor).isActive = true
        city.leadingAnchor
            .constraint(equalTo: cityIcon.trailingAnchor, constant: 10).isActive = true
        city.heightAnchor
            .constraint(equalToConstant: city.text == "" ? 0 : 20).isActive = true
    }
    
    private func configureJob() {
        scrollView.addSubview(jobIcon)
        scrollView.addSubview(job)
        
        jobIcon.image = UIImage(named: "job-icon")
        jobIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        job.text = "Head of the company SeichX LLC"
        job.numberOfLines = 0
        job.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        job.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        jobIcon.translatesAutoresizingMaskIntoConstraints = false
        jobIcon.topAnchor
            .constraint(equalTo: cityIcon.bottomAnchor, constant: 15).isActive = true
        jobIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        jobIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        jobIcon.heightAnchor
            .constraint(equalToConstant: job.text == "" ? 0 : 20).isActive = true
        
        job.translatesAutoresizingMaskIntoConstraints = false
        job.topAnchor
            .constraint(equalTo: jobIcon.topAnchor).isActive = true
        job.leadingAnchor
            .constraint(equalTo: jobIcon.trailingAnchor, constant: 10).isActive = true
        job.widthAnchor
            .constraint(equalToConstant: view.frame.width - 60).isActive = true
        
        if job.text == "" {
            jobIcon.topAnchor
                .constraint(equalTo: cityIcon.bottomAnchor, constant: 0).isActive = true
            jobIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
            job.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    private func configureDescription() {
        scrollView.addSubview(userDescriptionIcon)
        scrollView.addSubview(userDescription)
        
        userDescriptionIcon.image = UIImage(named: "description-icon")
        userDescriptionIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        userDescription.text = "Student of BMSTU. Hockey player. Love drink beer and smoke weed"
        userDescription.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        userDescription.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        userDescription.numberOfLines = 0
        
        userDescriptionIcon.translatesAutoresizingMaskIntoConstraints = false
        userDescriptionIcon.topAnchor
            .constraint(equalTo: jobIcon.bottomAnchor, constant: 15).isActive = true
        userDescriptionIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        userDescriptionIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        userDescriptionIcon.heightAnchor
            .constraint(equalToConstant: userDescription.text == "" ? 0 : 20).isActive = true
        
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        userDescription.topAnchor
            .constraint(equalTo: userDescriptionIcon.topAnchor).isActive = true
        userDescription.leadingAnchor
            .constraint(equalTo: userDescriptionIcon.trailingAnchor, constant: 10).isActive = true
        userDescription.widthAnchor
            .constraint(equalToConstant: view.frame.width - 60).isActive = true
        
        if userDescription.text == "" {
            userDescriptionIcon.topAnchor
                .constraint(equalTo: jobIcon.bottomAnchor, constant: 0).isActive = true
            userDescriptionIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
            userDescription.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    private func configureEducation() {
        scrollView.addSubview(educationIcon)
        scrollView.addSubview(education)
        
        educationIcon.image = UIImage(named: "education-icon")
        educationIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        education.text = "Bauman Moscow State Technical University (2018 - 2022)"
        education.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        education.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        education.numberOfLines = 0
        
        educationIcon.translatesAutoresizingMaskIntoConstraints = false
        educationIcon.topAnchor
            .constraint(equalTo: userDescription.bottomAnchor, constant: 15).isActive = true
        educationIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        educationIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        educationIcon.heightAnchor
            .constraint(equalToConstant: 20).isActive = true
        
        education.translatesAutoresizingMaskIntoConstraints = false
        education.topAnchor
            .constraint(equalTo: educationIcon.topAnchor).isActive = true
        education.leadingAnchor
            .constraint(equalTo: educationIcon.trailingAnchor, constant: 10).isActive = true
        education.widthAnchor
            .constraint(equalToConstant: view.frame.width - 60).isActive = true
        
        if education.text == "" {
            educationIcon.topAnchor
                .constraint(equalTo: userDescription.bottomAnchor, constant: 0).isActive = true
            educationIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
            education.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    private func configureGender() {
        scrollView.addSubview(genderIcon)
        scrollView.addSubview(gender)
        
        genderIcon.image = UIImage(named: "gender-icon")
        genderIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        gender.text = "Male"
        gender.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        gender.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        gender.numberOfLines = 0
        
        genderIcon.translatesAutoresizingMaskIntoConstraints = false
        genderIcon.topAnchor
            .constraint(equalTo: education.bottomAnchor, constant: 15).isActive = true
        genderIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        genderIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        genderIcon.heightAnchor
            .constraint(equalToConstant: 20).isActive = true
        
        gender.translatesAutoresizingMaskIntoConstraints = false
        gender.topAnchor
            .constraint(equalTo: genderIcon.topAnchor).isActive = true
        gender.leadingAnchor
            .constraint(equalTo: genderIcon.trailingAnchor, constant: 10).isActive = true
        gender.widthAnchor
            .constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        
        if gender.text == "" {
            genderIcon.topAnchor
                .constraint(equalTo: education.bottomAnchor, constant: 0).isActive = true
            genderIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
            gender.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    private func configureSexualOrientation() {
        scrollView.addSubview(sexualOrientationIcon)
        scrollView.addSubview(sexualOrientation)
        
        sexualOrientationIcon.image = UIImage(named: "sexual-orientation-icon")
        sexualOrientationIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        sexualOrientation.text = "Heterosexual"
        sexualOrientation.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        sexualOrientation.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        sexualOrientation.numberOfLines = 0
        
        sexualOrientationIcon.translatesAutoresizingMaskIntoConstraints = false
        sexualOrientationIcon.topAnchor
            .constraint(equalTo: gender.bottomAnchor, constant: 15).isActive = true
        sexualOrientationIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        sexualOrientationIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        sexualOrientationIcon.heightAnchor
            .constraint(equalToConstant: 20).isActive = true
        
        sexualOrientation.translatesAutoresizingMaskIntoConstraints = false
        sexualOrientation.topAnchor
            .constraint(equalTo: sexualOrientationIcon.topAnchor).isActive = true
        sexualOrientation.leadingAnchor
            .constraint(equalTo: sexualOrientationIcon.trailingAnchor, constant: 10).isActive = true
        sexualOrientation.widthAnchor
            .constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        
        if sexualOrientation.text == "" {
            sexualOrientationIcon.topAnchor
                .constraint(equalTo: gender.bottomAnchor, constant: 0).isActive = true
            sexualOrientationIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
            sexualOrientation.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    private func configureMaritalStatus() {
        scrollView.addSubview(maritalStatusIcon)
        scrollView.addSubview(maritalStatus)
        
        maritalStatusIcon.image = UIImage(named: "marital-icon")
        maritalStatusIcon.tintColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        maritalStatus.text = "Single"
        maritalStatus.textColor = UIColor(red: 0.22, green: 0.22, blue: 0.22, alpha: 1)
        maritalStatus.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        maritalStatus.numberOfLines = 0
        
        maritalStatusIcon.translatesAutoresizingMaskIntoConstraints = false
        maritalStatusIcon.topAnchor
            .constraint(equalTo: sexualOrientation.bottomAnchor, constant: 15).isActive = true
        maritalStatusIcon.leadingAnchor
            .constraint(equalTo: scrollView.leadingAnchor, constant: 15).isActive = true
        maritalStatusIcon.widthAnchor
            .constraint(equalToConstant: 20).isActive = true
        maritalStatusIcon.heightAnchor
            .constraint(equalToConstant: 20).isActive = true
        
        maritalStatus.translatesAutoresizingMaskIntoConstraints = false
        maritalStatus.topAnchor
            .constraint(equalTo: maritalStatusIcon.topAnchor).isActive = true
        maritalStatus.leadingAnchor
            .constraint(equalTo: maritalStatusIcon.trailingAnchor, constant: 10).isActive = true
        maritalStatus.widthAnchor
            .constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        maritalStatus.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -90).isActive = true
        
        if maritalStatus.text == "" {
            maritalStatusIcon.topAnchor
                .constraint(equalTo: sexualOrientation.bottomAnchor,
                            constant: 0).isActive = true
            maritalStatusIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
            maritalStatus.heightAnchor.constraint(equalToConstant: 0).isActive = true
        }
    }
    
    private func configureDateOfBirth() {}
    private func configureHeight() {}
    private func configureChildren() {}
    private func configureSmokeAndAlcohol() {}
    private func configureInterests() {}
    private func configureTags() {}
    private func configureLinks() {}
    
    // MARK: - COllection view configuration
    private func configurePhotoCollectionView() {
        photoLayout.sectionInset = .zero
        photoLayout.scrollDirection = .horizontal
        
        //let window = UIApplication.shared.windows[0]
        //let topPadding = window.safeAreaInsets.top
        pageControl.frame = CGRect(x: 0, y: 40 /*topPadding*/,
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
