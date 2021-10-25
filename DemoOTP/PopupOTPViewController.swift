//
//  PopupOTPViewController.swift
//  DemoOTP
//
//  Created by iOS Dev on 25/10/2564 BE.
//

import UIKit

class PopupOTPViewController: UIViewController {
    
    enum State {
        case Sending, Confirm
    }

    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var confirmView: UIView!
    @IBOutlet weak var sendingView: UIView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var otpView: SROTPView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    @IBOutlet weak var lblMessage: UILabel?
    
    
    var onSuccess: (()->())?
    var isDone = false
    var state = State.Sending {
        didSet {
            sendingView.isHidden = state == .Confirm
            confirmView.isHidden = state == .Sending
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        setupOtpView()
    }
    
    func setupInterface() {
        setupOtpView()
        textField.delegate = self
        textField.underlined(2)
        btnConfirm.setupCorner(2)
        btnConfirm.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7647058824, blue: 0.5607843137, alpha: 1)
        btnConfirm.setHolder(false, textColor: .white, bgColor: #colorLiteral(red: 0.2039215686, green: 0.7647058824, blue: 0.5607843137, alpha: 1))
        subTitleLabel.text = "ระบบจะส่งรหัส OT ไปให้ท่าน \nเพื่อยืนยันการเปลี่ยนแปลงเบอร์โทรศัพท์"
    }
    
    func setupOtpView() {
        otpView.otpTextFieldsCount = 6
        otpView.otpTextFieldActiveBorderColor = #colorLiteral(red: 0.3725490196, green: 0.462745098, blue: 0.8980392157, alpha: 1)
        otpView.otpTextFieldDefaultBorderColor = UIColor.lightGray
        otpView.otpTextFieldFontColor = UIColor.black
        otpView.activeHeight = 2
        otpView.inactiveHeight = 2
        otpView.otpType = .UnderLined
        otpView.size = 40
        otpView.otpEnteredString = { pin in
            if pin.count == 6 {
                self.validateOTP(pin)
            }
        }
        otpView.setUpOtpView()
    }
    
    func setEnableButton(_ isEnabled: Bool) {
        btnConfirm.setHolder(isEnabled, textColor: .white, bgColor: #colorLiteral(red: 0.2039215686, green: 0.7647058824, blue: 0.5607843137, alpha: 1))
    }
    
    
    // MARK: - Action
    
    @IBAction func sendOTPAction(_ sender: UIButton) {
        if let number = textField.text {
            self.sendOTP(number)
        }
    }
    
}


extension PopupOTPViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != ""  {
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            textField.text = newString.formattedNumber()
            let replacing = newString.removingWhitespaces()
            setEnableButton(replacing.regex(.phone) || replacing.count == 10)
            return false
        }
        setEnableButton(false)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.underlined(2,color: #colorLiteral(red: 0.3725490196, green: 0.462745098, blue: 0.8980392157, alpha: 1))
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.underlined(2)
        }
    }
}


extension PopupOTPViewController {
    
    func sendOTP(_ phoneNo: String) {
        self.state = .Confirm
        self.lblSubtitle.text = "รหัสถูกส่งไปทาง SMS ที่เบอร์\n" + phoneNo
        self.lblMessage?.text = "(Ref No: 1234)"
        self.otpView.textFieldsCollection[0].becomeFirstResponder()
        self.otpView.refreshView()
    }
    
    func validateOTP(_ otp: String) {
        self.onSuccess?()
    }
}
