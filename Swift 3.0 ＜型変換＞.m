//☆Swift 3.0 ＜型変換＞☆

import UIKit

/*
 * 型の確認には is を使う
 */

// Int → String, Double --------------------------------------------------------------
var int:Int = 100
String(int)
Double(int)
/*
print(int is Double)  -->  false  // Int自体の型が変わっているわけではない
print(Double(int) is Double)  -->  true
*/

// Double → Int ----------------------------------------------------------------------
var double:Double = 100.0
Int(double)

// String → Int ----------------------------------------------------------------------
var string:String = "100"
Int(string)

// String → 浮動小数点 -----------------------------------------------------------------
var stringF:String = "3.14"
(stringF as NSString).floatValue

// Date → String ---------------------------------------------------------------------
let now:Date = Date()

var dateFormat:DateFormatter = DateFormatter()
let jaLocale = Locale(identifier: "ja_JP")
dateFormat.locale = jaLocale
/*
 * ↑ .locale で日本を指定した場合
 * dateStyleの値
 * .long → yyyy年mm月dd日
 * .medium → YYYY/MM/DD
 * .short → YYYY/MM/DD
 */
dateFormat.dateStyle = .long
/*
 * timeStyleの値
 * .long → HH:MM:SS 標準時
 * .medium → HH:MM:SS
 * .short → HH:MM
 */
dateFormat.timeStyle = .short

print(dateFormat.string(from: now))

// String → Date ---------------------------------------------------------------------
let dateStr:String = "2017/02/25 00:00"

var dateFormat2:DateFormatter = DateFormatter()
let jaLocale2 = Locale(identifier: "ja_JP")
dateFormat2.locale = jaLocale2
/*
 * dateStrが
 * dateStyle → .short
 * timeStyle → .short
 * で宣言されているから
 */
dateFormat2.dateStyle = .short
dateFormat2.timeStyle = .short

let theDate:Date = dateFormat2.date(from: dateStr)!

dateFormat2.dateStyle = .long
dateFormat2.timeStyle = .medium
print(dateFormat2.string(from: theDate))

// ☆日付時刻の表示形式をカスタマイズ <Date → String> --------------------------------------
/*
 * 年 → y ※yyyyで4桁表示
 * 月 → m
 * 日 → d
 * 曜日 → e
 * 時間 → h
 */
var formatter = DateFormatter()
let jaLocale3 = Locale(identifier: "ja_JP")
formatter.locale = jaLocale
formatter.dateFormat = "yyyy年MM月dd日(EEE） HH時mm分"

var now3 = Date()
print(formatter.string(from:now3))

// ☆日付時刻の表示形式をカスタマイズ <String → Date> --------------------------------------
var formatter2 = DateFormatter()
let jaLocale4 = Locale(identifier: "ja_JP")
formatter2.locale = jaLocale
formatter2.dateFormat = "yyyy年MM月dd日 HH時mm分"

let dateStr2:String = "2017年02月26日 00時00分"
if let theDate2:Date = formatter2.date(from: dateStr2) {
    print(theDate2.description(with: jaLocale4))
}else {
    print("変換できません")
}
