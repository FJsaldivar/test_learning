//
//  UICheckbox.swift
//  UalaFareUI
//
//  Created by Luis Perez on 31/08/22.
//

import UIKit

/// A checkbox that allows the selected and deselected state
@IBDesignable
final public class AbraCheckbox: UIControl {
    
    /// Returns if the checkbox is selected or not
    @IBInspectable
    public var isCheckboxSelected: Bool = false {
        didSet {
            configureModel()
            self.sendActions(for: .valueChanged)
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            configureModel()
        }
    }
    
    private var model: AbraCheckboxTheme = AbraThemeManager.theme.checkboxTheme()
    private let hapticGenerator = UINotificationFeedbackGenerator()

    private lazy var tappeableBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public override var intrinsicContentSize: CGSize {
        return self.bounds.size
    }
    
    /**
     - Parameters:
        - customFrame: a frame for the component, the default is zero
     - Returns: A checkbox
     */
    public convenience init(customFrame: CGRect = .zero) {
        self.init(model: AbraThemeManager.theme.checkboxTheme(), frame: customFrame)
    }
    
    public init(model: AbraCheckboxTheme, frame: CGRect = .zero) {
        self.model = model
        super.init(frame: frame)
        observeThemeUpdates()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        observeThemeUpdates()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        observeThemeUpdates()
    }
    
    public override func draw(_ rect: CGRect) {
        configureLayout(in: rect)
        configureLayer()
        configureModel()
    }
    
    private func configureLayout(in rect: CGRect) {
        self.addSubview(tappeableBackgroundView)
        tappeableBackgroundView.addSubview(statusImageView)
                
        NSLayoutConstraint.activate([
            tappeableBackgroundView.widthAnchor.constraint(equalTo: sizeAnchor(in: rect)),
            tappeableBackgroundView.heightAnchor.constraint(equalTo: sizeAnchor(in: rect)),
            tappeableBackgroundView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            tappeableBackgroundView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            statusImageView.topAnchor.constraint(equalTo: tappeableBackgroundView.topAnchor),
            statusImageView.leadingAnchor.constraint(equalTo: tappeableBackgroundView.leadingAnchor),
            statusImageView.trailingAnchor.constraint(equalTo: tappeableBackgroundView.trailingAnchor),
            statusImageView.bottomAnchor.constraint(equalTo: tappeableBackgroundView.bottomAnchor)
        ])
    }
    
    private func configureLayer() {
        tappeableBackgroundView.layer.cornerRadius = 4
        tappeableBackgroundView.layer.borderWidth = 1
    }
    
    private func configureModel() {
        configureBackgroundView()
        configureStatusImageView()
    }
    
    private func configureBackgroundView() {
        if isEnabled {
            tappeableBackgroundView.layer.borderColor = isCheckboxSelected ? model.selectedBorderColor.cgColor : model.unselectedBorderColor.cgColor
            tappeableBackgroundView.backgroundColor = isCheckboxSelected ? model.selectedBackgroundColor : model.unselectedBackgroundColor
        } else {
            tappeableBackgroundView.layer.borderColor = isCheckboxSelected ? model.selectedBorderColor.cgColor : model.disabledBorderColor.cgColor
            tappeableBackgroundView.backgroundColor = isCheckboxSelected ? model.disabledSelectedBackgroundColor : model.unselectedBackgroundColor
        }
    }
    
    private func configureStatusImageView() {
        statusImageView.contentMode = .scaleAspectFit
        statusImageView.image = model.icon.withTintColor(model.iconTintColor)
        statusImageView.backgroundColor = .clear
        statusImageView.isHidden = !isCheckboxSelected
    }
    
    private func sizeAnchor(in rect: CGRect) -> NSLayoutDimension {
        if rect.width > rect.height {
            return self.heightAnchor
        }
        return self.widthAnchor
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        hapticGenerator.prepare()
        pressBeganAnimation()
        isCheckboxSelected = !isCheckboxSelected
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        hapticGenerator.notificationOccurred(.success)
        pressEndAnimation()
    }
    
    private func pressBeganAnimation() {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveEaseIn]) { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        } completion: { _ in }
    }
    
    private func pressEndAnimation() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: [.curveEaseIn]) { [weak self] in
            self?.transform = CGAffineTransform.identity
        } completion: { _ in }
    }
}

extension AbraCheckbox: ThemeObserver {
    public func updateTheme() {
        configureModel()
    }
}
