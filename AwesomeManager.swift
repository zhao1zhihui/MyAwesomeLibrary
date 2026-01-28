import UIKit

public class AwesomeManager {
    
    public static let shared = AwesomeManager()
    
    private init() {}
    
    /// 显示一个简单的提示
    /// - Parameter message: 提示信息
    public func showMessage(_ message: String) {
        let alert = UIAlertController(
            title: "Awesome Library",
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        if let rootVC = UIApplication.shared.keyWindow?.rootViewController {
            rootVC.present(alert, animated: true)
        }
    }
    
    /// 验证邮箱格式
    /// - Parameter email: 邮箱地址
    /// - Returns: 是否有效
    public func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
}

// 扩展 UIView
public extension UIView {
    
    /// 添加阴影效果
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - radius: 阴影半径
    ///   - offset: 阴影偏移
    ///   - opacity: 阴影透明度
    func addShadow(
        color: UIColor = .black,
        radius: CGFloat = 4,
        offset: CGSize = .zero,
        opacity: Float = 0.2
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    /// 添加圆角
    /// - Parameter radius: 圆角半径
    func roundCorners(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}

// 自定义控件示例
public class AwesomeButton: UIButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius = 8
        contentEdgeInsets = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
    }
    
    public override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.7 : 1.0
        }
    }
}
