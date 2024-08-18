//
//  OnboardingViewController.swift
//  MoCapture
//
//  Created by Cynthia D'Phoenix on 8/18/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    private let imageView = UIImageView()
    private let darkOverlayView = UIView()
    private let titleLabel = UILabel()
    private let pageTitleLabel = UILabel()
    private let descriptionLabel = UILabel()
    let skipButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        view.backgroundColor = .white

        // Image View Setup
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "onboard2")
        view.addSubview(imageView)

        // Dark Overlay View Setup
        darkOverlayView.translatesAutoresizingMaskIntoConstraints = false
        darkOverlayView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        view.addSubview(darkOverlayView)
        
        // Page Title Label Setup
        pageTitleLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        pageTitleLabel.textColor = .systemPink
        pageTitleLabel.textAlignment = .center
        pageTitleLabel.text = "MO-CAPTURE"
        pageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageTitleLabel)

        // Title Label Setup
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "MoCapture App is a fun application that captures images with a mustache"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)

        // Description Label Setup
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Have fun"
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        
        // skip button setup
        skipButton.setTitle("Let's go", for: .normal)
        skipButton.backgroundColor = .white
        skipButton.setTitleColor(.black, for: .normal)
        skipButton.layer.cornerRadius = 20
        skipButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        view.addSubview(skipButton)

        // Constraints
        NSLayoutConstraint.activate([
            
            // Image View Constraints
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Page Title Label Constraints
            pageTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Dark Overlay View Constraints
            darkOverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            darkOverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkOverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            darkOverlayView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

            // Title Label Constraints
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            // Description Label Constraints
            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Skip Button Constraints
            skipButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    
    @objc func skipButtonTapped() {
        let eventVC = CaptureListViewController()
        navigationController?.pushViewController(eventVC, animated: true)
        
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
               
        let navigationController = UINavigationController(rootViewController: eventVC)
        UIApplication.shared.windows.first?.rootViewController = navigationController
          
    }

}

