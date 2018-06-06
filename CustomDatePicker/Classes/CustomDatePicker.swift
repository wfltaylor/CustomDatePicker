import UIKit


@IBDesignable open class CustomDatePicker: UIControl, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var pickerView = UIPickerView()
    
    var days = [String]()
    var months = [String]()
    var years = [String]()
    var currentYear = 2018
    var currentMonth = 4
    var currentDay = 2
    open var font: UIFont = UIFont.systemFont(ofSize: 20) {
        didSet {
            pickerView.reloadAllComponents()
        }
    }
    @IBInspectable open var textColor: UIColor = UIColor.black {
        didSet {
            pickerView.reloadAllComponents()
        }
    }
    @IBInspectable var fontName: String = "" {
        didSet {
            font = UIFont(name: fontName, size: font.pointSize)!
        }
    }
    private(set) open var date: Date?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEverything()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupEverything()
    }
    
    fileprivate func setupEverything() {
        self.addSubview(pickerView)
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.frame = self.bounds
        pickerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        daysSetup()
        monthsSetup()
        yearsSetup()
        let currentDate = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let day = calendar.component(.day, from: currentDate)
        pickerView.reloadAllComponents()
        pickerView.selectRow(month-1, inComponent: 1, animated: false)
        pickerView.selectRow(year, inComponent: 2, animated: false)
        pickerView.selectRow(day-1, inComponent: 0, animated: false)
        date = currentDate
    
    }
    open func setDate(_ date: Date, animated: Bool) {
        let currentDate = date
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        let day = calendar.component(.day, from: currentDate)
        pickerView.reloadAllComponents()
        pickerView.selectRow(month-1, inComponent: 1, animated: animated)
        rowSelection(1, month-1, pickerView)
        pickerView.selectRow(year, inComponent: 2, animated: animated)
        rowSelection(2, year, pickerView)
        pickerView.selectRow(day-1, inComponent: 0, animated: animated)
        rowSelection(0, day-1, pickerView)
        self.date = currentDate
    }
    override open func layoutSubviews() {
        super.layoutSubviews()
        pickerView.frame = self.bounds
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return days.count
        } else if component == 1 {
            return months.count
        } else if component == 2 {
            return years.count
        } else {
            return 0
        }
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return days[row]
        } else if component == 1 {
            return months[row]
        } else if component == 2 {
            return years[row]
        } else {
            return "Jan 14"
        }
    }
    func getNameForRow(component: Int, row: Int) -> String {
        if component == 0 {
            return days[row]
        } else if component == 1 {
            return months[row]
        } else if component == 2 {
            return years[row]
        } else {
            return "Jan 14"
        }
        
    }
    func daysSetup() {
        days = []
        let calendar = Calendar.current
        var dateComponentsSelected = DateComponents()
        dateComponentsSelected.year = currentYear
        dateComponentsSelected.month = currentMonth
        let date = calendar.date(from: dateComponentsSelected)
        let interval = calendar.dateInterval(of: .month, for: date!)!
       
        let daysNumber = calendar.dateComponents([.day], from: interval.start, to: interval.end).day!
        for i in 1...daysNumber {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE"
            
            var dateComponents = DateComponents()
            dateComponents.year = currentYear
            dateComponents.month = currentMonth
            dateComponents.day = i
        
            let userCalendar = Calendar.current
            let theDate = userCalendar.date(from: dateComponents)
            let result = dateFormatter.string(from: theDate!)
            days.append(result + " " + String(i))
           
        }
    }
    func monthsSetup() {
        months = []
        for i in 1...12 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM"
            
            var dateComponents = DateComponents()
            dateComponents.year = currentYear
            dateComponents.month = i
           
            let userCalendar = Calendar.current
            let theDate = userCalendar.date(from: dateComponents)
            let result = dateFormatter.string(from: theDate!)
            months.append("      " + result)
            
        }
    }
    func yearsSetup() {
        years = []
        for i in 0...10000 {
            years.append(String(i))
        }
    }
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return "30 Wednes".widthOfString(usingFont: font)
        } else if component == 1 {
            return "       September".widthOfString(usingFont: font)
        } else {
            return "  2009  ".widthOfString(usingFont: font)
        }
    }
    public func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = getNameForRow(component: component, row: row)
        pickerLabel.text = titleData
        pickerLabel.font = font
        pickerLabel.textColor = textColor
        if component == 0 {
            pickerLabel.textAlignment = .right
        }
        if component == 2 {
            pickerLabel.textAlignment = .left
        }
        return pickerLabel
    }
    
    fileprivate func rowSelection(_ component: Int, _ row: Int, _ pickerView: UIPickerView) {
        if component == 1 {
            currentMonth = row + 1
            daysSetup()
            pickerView.reloadComponent(0)
        } else if component == 2 {
            currentYear = row
            daysSetup()
            pickerView.reloadComponent(0)
        }
        let day = pickerView.selectedRow(inComponent: 0) + 1
        let month = pickerView.selectedRow(inComponent: 1) + 1
        let year = pickerView.selectedRow(inComponent: 2)
        print(year)
        var dateComponents = DateComponents()
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        let cal = Calendar.current
        date = cal.date(from: dateComponents)
        self.sendActions(for: .valueChanged)
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        rowSelection(component, row, pickerView)
    }
    
    
}
extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedStringKey.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}
