//
//  Utilties.swift
//  ASB
//
//  Created by Trip Creighton on 1/9/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    private static var _timeComponents = Date(),
                       _timeFormatter = DateFormatter()
    
    static func getDate() -> String {
        _timeComponents = Date()
        _timeFormatter.dateFormat = "dd.MM.yyyy"
        return _timeFormatter.string(from: _timeComponents)
    }
    
    static func getTime() -> String {
        _timeComponents = Date()
        _timeFormatter.dateFormat = "HH:mm:ss"
        return _timeFormatter.string(from: _timeComponents)
    }
}

extension String {
    
    var count:Int {
        return self.characters.count
    }
    
    var isAlphabet:Bool {
        return self.rangeOfCharacter(from: CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")) != nil
    }
    
    func array() -> [Character] {
        var arr:[Character]! = []
        for char in self.characters {
            arr.append(char)
        }
        return arr
    }
    
    func at(_ pos: Int) -> Character? {
        if pos > self.characters.count {
            return nil
        }
        return self.array()[pos]
    }
    
    func substring(from: Int, to: Int) -> String? {
        if from < 0 || to > self.count {
            return nil
        }
        var temp:String = ""
        for i in from...to {
            temp.append(self.array()[i])
        }
        return temp
    }
    
    func base64Encode() -> String {
        return (self.data(using: String.Encoding.utf8)?.base64EncodedString())!
    }
    
    func base64Decode() -> String {
        return String(data: Data(base64Encoded: self)!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
    }
}


extension UIWebView {
    func parseAndLoad(_ query: String) {
        if !(query.contains("http://") || query.contains("https://") || query.contains("http://www.") || query.contains("https://www.")) {
            self.loadRequest(URLRequest(url: URL(string: "https://www.google.com/?q=\(query.replacingOccurrences(of: " ", with: "+"))")!))
        } else {
            self.loadRequest(URLRequest(url: URL(string: query)!))
        }
    }
}

extension UIFont {
    enum FontNames : String {
        case copperplateLight = "Copperplate-Light"
        case copperplate = "Copperplate"
        case copperplateBold = "Copperplate-Bold"
        case kohinoorTeluguRegular = "KohinoorTelugu-Regular"
        case kohinoorTeluguMedium = "KohinoorTelugu-Medium"
        case kohinoorTeluguLight = "KohinoorTelugu-Light"
        case thonburi = "Thonburi"
        case thonburiBold = "Thonburi-Bold"
        case thonburiLight = "Thonburi-Light"
        case courierNewPSBoldMT = "CourierNewPS-BoldMT"
        case courierNewPSItalicMT = "CourierNewPS-ItalicMT"
        case courierNewPSMT = "CourierNewPSMT"
        case courierNewPSBoldItalicMT = "CourierNewPS-BoldItalicMT"
        case gillSansItalic = "GillSans-Italic"
        case gillSansBold = "GillSans-Bold"
        case gillSansBoldItalic = "GillSans-BoldItalic"
        case gillSansLightItalic = "GillSans-LightItalic"
        case gillSans = "GillSans"
        case gillSansLight = "GillSans-Light"
        case gillSansSemiBold = "GillSans-SemiBold"
        case gillSansSemiBoldItalic = "GillSans-SemiBoldItalic"
        case gillSansUltraBold = "GillSans-UltraBold"
        case appleSDGothicNeoBold = "AppleSDGothicNeo-Bold"
        case appleSDGothicNeoUltraLight = "AppleSDGothicNeo-UltraLight"
        case appleSDGothicNeoThin = "AppleSDGothicNeo-Thin"
        case appleSDGothicNeoRegular = "AppleSDGothicNeo-Regular"
        case appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
        case appleSDGothicNeoMedium = "AppleSDGothicNeo-Medium"
        case appleSDGothicNeoSemiBold = "AppleSDGothicNeo-SemiBold"
        case markerFeltThin = "MarkerFelt-Thin"
        case markerFeltWide = "MarkerFelt-Wide"
        case avenirNextCondensedBoldItalic = "AvenirNextCondensed-BoldItalic"
        case avenirNextCondensedHeavy = "AvenirNextCondensed-Heavy"
        case avenirNextCondensedMedium = "AvenirNextCondensed-Medium"
        case avenirNextCondensedRegular = "AvenirNextCondensed-Regular"
        case avenirNextCondensedHeavyItalic = "AvenirNextCondensed-HeavyItalic"
        case avenirNextCondensedMediumItalic = "AvenirNextCondensed-MediumItalic"
        case avenirNextCondensedItalic = "AvenirNextCondensed-Italic"
        case avenirNextCondensedUltraLightItalic = "AvenirNextCondensed-UltraLightItalic"
        case avenirNextCondensedUltraLight = "AvenirNextCondensed-UltraLight"
        case avenirNextCondensedDemiBold = "AvenirNextCondensed-DemiBold"
        case avenirNextCondensedBold = "AvenirNextCondensed-Bold"
        case avenirNextCondensedDemiBoldItalic = "AvenirNextCondensed-DemiBoldItalic"
        case tamilSangamMN = "TamilSangamMN"
        case tamilSangamMNBold = "TamilSangamMN-Bold"
        case helveticaNeueItalic = "HelveticaNeue-Italic"
        case helveticaNeueBold = "HelveticaNeue-Bold"
        case helveticaNeueUltraLight = "HelveticaNeue-UltraLight"
        case helveticaNeueCondensedBlack = "HelveticaNeue-CondensedBlack"
        case helveticaNeueBoldItalic = "HelveticaNeue-BoldItalic"
        case helveticaNeueCondensedBold = "HelveticaNeue-CondensedBold"
        case helveticaNeueMedium = "HelveticaNeue-Medium"
        case helveticaNeueLight = "HelveticaNeue-Light"
        case helveticaNeueThin = "HelveticaNeue-Thin"
        case helveticaNeueThinItalic = "HelveticaNeue-ThinItalic"
        case helveticaNeueLightItalic = "HelveticaNeue-LightItalic"
        case helveticaNeueUltraLightItalic = "HelveticaNeue-UltraLightItalic"
        case helveticaNeueMediumItalic = "HelveticaNeue-MediumItalic"
        case helveticaNeue = "HelveticaNeue"
        case gurmukhiMNBold = "GurmukhiMN-Bold"
        case gurmukhiMN = "GurmukhiMN"
        case timesNewRomanPSMT = "TimesNewRomanPSMT"
        case timesNewRomanPSBoldItalicMT = "TimesNewRomanPS-BoldItalicMT"
        case timesNewRomanPSItalicMT = "TimesNewRomanPS-ItalicMT"
        case timesNewRomanPSBoldMT = "TimesNewRomanPS-BoldMT"
        case georgiaBoldItalic = "Georgia-BoldItalic"
        case georgia = "Georgia"
        case georgiaItalic = "Georgia-Italic"
        case georgiaBold = "Georgia-Bold"
        case appleColorEmoji = "AppleColorEmoji"
        case arialRoundedMTBold = "ArialRoundedMTBold"
        case kailasaBold = "Kailasa-Bold"
        case kailasa = "Kailasa"
        case kohinoorDevanagariLight = "KohinoorDevanagari-Light"
        case kohinoorDevanagariRegular = "KohinoorDevanagari-Regular"
        case kohinoorDevanagariSemibold = "KohinoorDevanagari-Semibold"
        case kohinoorBanglaSemibold = "KohinoorBangla-Semibold"
        case kohinoorBanglaRegular = "KohinoorBangla-Regular"
        case kohinoorBanglaLight = "KohinoorBangla-Light"
        case chalkboardSEBold = "ChalkboardSE-Bold"
        case chalkboardSELight = "ChalkboardSE-Light"
        case chalkboardSERegular = "ChalkboardSE-Regular"
        case sinhalaSangamMNBold = "SinhalaSangamMN-Bold"
        case sinhalaSangamMN = "SinhalaSangamMN"
        case pingFangTCMedium = "PingFangTC-Medium"
        case pingFangTCRegular = "PingFangTC-Regular"
        case pingFangTCLight = "PingFangTC-Light"
        case pingFangTCUltralight = "PingFangTC-Ultralight"
        case pingFangTCSemibold = "PingFangTC-Semibold"
        case pingFangTCThin = "PingFangTC-Thin"
        case gujaratiSangamMNBold = "GujaratiSangamMN-Bold"
        case gujaratiSangamMN = "GujaratiSangamMN"
        case damascusLight = "DamascusLight"
        case damascusBold = "DamascusBold"
        case damascusSemiBold = "DamascusSemiBold"
        case damascusMedium = "DamascusMedium"
        case damascus = "Damascus"
        case noteworthyLight = "Noteworthy-Light"
        case noteworthyBold = "Noteworthy-Bold"
        case geezaPro = "GeezaPro"
        case geezaProBold = "GeezaPro-Bold"
        case avenirMedium = "Avenir-Medium"
        case avenirHeavyOblique = "Avenir-HeavyOblique"
        case avenirBook = "Avenir-Book"
        case avenirLight = "Avenir-Light"
        case avenirRoman = "Avenir-Roman"
        case avenirBookOblique = "Avenir-BookOblique"
        case avenirMediumOblique = "Avenir-MediumOblique"
        case avenirBlack = "Avenir-Black"
        case avenirBlackOblique = "Avenir-BlackOblique"
        case avenirHeavy = "Avenir-Heavy"
        case avenirLightOblique = "Avenir-LightOblique"
        case avenirOblique = "Avenir-Oblique"
        case academyEngravedLetPlain = "AcademyEngravedLetPlain"
        case diwanMishafi = "DiwanMishafi"
        case futuraCondensedMedium = "Futura-CondensedMedium"
        case futuraCondensedExtraBold = "Futura-CondensedExtraBold"
        case futuraMedium = "Futura-Medium"
        case futuraMediumItalic = "Futura-MediumItalic"
        case futuraBold = "Futura-Bold"
        case farah = "Farah"
        case kannadaSangamMN = "KannadaSangamMN"
        case kannadaSangamMNBold = "KannadaSangamMN-Bold"
        case arialHebrewBold = "ArialHebrew-Bold"
        case arialHebrewLight = "ArialHebrew-Light"
        case arialHebrew = "ArialHebrew"
        case arialMT = "ArialMT"
        case arialBoldItalicMT = "Arial-BoldItalicMT"
        case arialBoldMT = "Arial-BoldMT"
        case arialItalicMT = "Arial-ItalicMT"
        case partyLetPlain = "PartyLetPlain"
        case chalkduster = "Chalkduster"
        case hoeflerTextItalic = "HoeflerText-Italic"
        case hoeflerTextRegular = "HoeflerText-Regular"
        case hoeflerTextBlack = "HoeflerText-Black"
        case hoeflerTextBlackItalic = "HoeflerText-BlackItalic"
        case optimaRegular = "Optima-Regular"
        case optimaExtraBlack = "Optima-ExtraBlack"
        case optimaBoldItalic = "Optima-BoldItalic"
        case optimaItalic = "Optima-Italic"
        case optimaBold = "Optima-Bold"
        case palatinoBold = "Palatino-Bold"
        case palatinoRoman = "Palatino-Roman"
        case palatinoBoldItalic = "Palatino-BoldItalic"
        case palatinoItalic = "Palatino-Italic"
        case laoSangamMN = "LaoSangamMN"
        case malayalamSangamMNBold = "MalayalamSangamMN-Bold"
        case malayalamSangamMN = "MalayalamSangamMN"
        case alNileBold = "AlNile-Bold"
        case alNile = "AlNile"
        case bradleyHandITCTTBold = "BradleyHandITCTT-Bold"
        case pingFangHKUltralight = "PingFangHK-Ultralight"
        case pingFangHKSemibold = "PingFangHK-Semibold"
        case pingFangHKThin = "PingFangHK-Thin"
        case pingFangHKLight = "PingFangHK-Light"
        case pingFangHKRegular = "PingFangHK-Regular"
        case pingFangHKMedium = "PingFangHK-Medium"
        case trebuchetBoldItalic = "Trebuchet-BoldItalic"
        case trebuchetMS = "TrebuchetMS"
        case trebuchetMSBold = "TrebuchetMS-Bold"
        case trebuchetMSItalic = "TrebuchetMS-Italic"
        case helveticaBold = "Helvetica-Bold"
        case helvetica = "Helvetica"
        case helveticaLightOblique = "Helvetica-LightOblique"
        case helveticaOblique = "Helvetica-Oblique"
        case helveticaBoldOblique = "Helvetica-BoldOblique"
        case helveticaLight = "Helvetica-Light"
        case courierBoldOblique = "Courier-BoldOblique"
        case courier = "Courier"
        case courierBold = "Courier-Bold"
        case courierOblique = "Courier-Oblique"
        case cochinBold = "Cochin-Bold"
        case cochin = "Cochin"
        case cochinItalic = "Cochin-Italic"
        case cochinBoldItalic = "Cochin-BoldItalic"
        case hiraMinProNW6 = "HiraMinProN-W6"
        case hiraMinProNW3 = "HiraMinProN-W3"
        case devanagariSangamMN = "DevanagariSangamMN"
        case devanagariSangamMNBold = "DevanagariSangamMN-Bold"
        case oriyaSangamMN = "OriyaSangamMN"
        case oriyaSangamMNBold = "OriyaSangamMN-Bold"
        case snellRoundhandBold = "SnellRoundhand-Bold"
        case snellRoundhand = "SnellRoundhand"
        case snellRoundhandBlack = "SnellRoundhand-Black"
        case zapfDingbatsITC = "ZapfDingbatsITC"
        case bodoniSvtyTwoITCTTBold = "BodoniSvtyTwoITCTT-Bold"
        case bodoniSvtyTwoITCTTBook = "BodoniSvtyTwoITCTT-Book"
        case bodoniSvtyTwoITCTTBookIta = "BodoniSvtyTwoITCTT-BookIta"
        case verdanaItalic = "Verdana-Italic"
        case verdanaBoldItalic = "Verdana-BoldItalic"
        case verdana = "Verdana"
        case verdanaBold = "Verdana-Bold"
        case americanTypewriterCondensedLight = "AmericanTypewriter-CondensedLight"
        case americanTypewriter = "AmericanTypewriter"
        case americanTypewriterCondensedBold = "AmericanTypewriter-CondensedBold"
        case americanTypewriterLight = "AmericanTypewriter-Light"
        case americanTypewriterSemibold = "AmericanTypewriter-Semibold"
        case americanTypewriterBold = "AmericanTypewriter-Bold"
        case americanTypewriterCondensed = "AmericanTypewriter-Condensed"
        case avenirNextUltraLight = "AvenirNext-UltraLight"
        case avenirNextUltraLightItalic = "AvenirNext-UltraLightItalic"
        case avenirNextBold = "AvenirNext-Bold"
        case avenirNextBoldItalic = "AvenirNext-BoldItalic"
        case avenirNextDemiBold = "AvenirNext-DemiBold"
        case avenirNextDemiBoldItalic = "AvenirNext-DemiBoldItalic"
        case avenirNextMedium = "AvenirNext-Medium"
        case avenirNextHeavyItalic = "AvenirNext-HeavyItalic"
        case avenirNextHeavy = "AvenirNext-Heavy"
        case avenirNextItalic = "AvenirNext-Italic"
        case avenirNextRegular = "AvenirNext-Regular"
        case avenirNextMediumItalic = "AvenirNext-MediumItalic"
        case baskervilleItalic = "Baskerville-Italic"
        case baskervilleSemiBold = "Baskerville-SemiBold"
        case baskervilleBoldItalic = "Baskerville-BoldItalic"
        case baskervilleSemiBoldItalic = "Baskerville-SemiBoldItalic"
        case baskervilleBold = "Baskerville-Bold"
        case baskerville = "Baskerville"
        case khmerSangamMN = "KhmerSangamMN"
        case didotItalic = "Didot-Italic"
        case didotBold = "Didot-Bold"
        case didot = "Didot"
        case savoyeLetPlain = "SavoyeLetPlain"
        case bodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
        case symbol = "Symbol"
        case menloItalic = "Menlo-Italic"
        case menloBold = "Menlo-Bold"
        case menloRegular = "Menlo-Regular"
        case menloBoldItalic = "Menlo-BoldItalic"
        case bodoniSvtyTwoSCITCTTBook = "BodoniSvtyTwoSCITCTT-Book"
        case papyrus = "Papyrus"
        case papyrusCondensed = "Papyrus-Condensed"
        case hiraginoSansW3 = "HiraginoSans-W3"
        case hiraginoSansW6 = "HiraginoSans-W6"
        case pingFangSCUltralight = "PingFangSC-Ultralight"
        case pingFangSCRegular = "PingFangSC-Regular"
        case pingFangSCSemibold = "PingFangSC-Semibold"
        case pingFangSCThin = "PingFangSC-Thin"
        case pingFangSCLight = "PingFangSC-Light"
        case pingFangSCMedium = "PingFangSC-Medium"
        case myanmarSangamMNBold = "MyanmarSangamMN-Bold"
        case myanmarSangamMN = "MyanmarSangamMN"
        case euphemiaUCASItalic = "EuphemiaUCAS-Italic"
        case euphemiaUCAS = "EuphemiaUCAS"
        case euphemiaUCASBold = "EuphemiaUCAS-Bold"
        case zapfino = "Zapfino"
        case bodoniSvtyTwoOSITCTTBook = "BodoniSvtyTwoOSITCTT-Book"
        case bodoniSvtyTwoOSITCTTBold = "BodoniSvtyTwoOSITCTT-Bold"
        case bodoniSvtyTwoOSITCTTBookIt = "BodoniSvtyTwoOSITCTT-BookIt"
    }
    
    convenience init?(name: FontNames, size: CGFloat) {
        self.init(name: name.rawValue, size: size)
    }
}

extension UIColor {
    convenience init?(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: a/255)
    }
    
    var colorComponents: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let comp = CIColor(color: self)
        return (comp.red, comp.green, comp.blue, comp.alpha)
    }
    
    static var lightBlue:UIColor! {
        return UIColor(r: 0, g: 128, b: 255, a: 255)
    }
    
    var r:CGFloat {
        return colorComponents.r
    }
    
    var g:CGFloat {
        return colorComponents.g
    }
    
    var b:CGFloat {
        return colorComponents.b
    }
    
    var a:CGFloat {
        return colorComponents.a
    }
}

extension Character {
    func toAscii() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}

extension UIView {
    func circularize(xy: CGPoint, wh: CGSize, borderSize: Int) {
        self.frame = CGRect(x: xy.x, y: xy.y, width: wh.width, height: wh.height)
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 8
        self.layer.cornerRadius = self.frame.width / 2
    }
}

extension UITabBar {
    
    func setUnselectedItem(tintColor: UIColor) {
        self.setValue(tintColor, forKey: "unselectedItemTintColor")
    }
    
    func setSelectedItem(tintColor: UIColor) {
        self.setValue(tintColor, forKey: "tintColor")
    }
}

