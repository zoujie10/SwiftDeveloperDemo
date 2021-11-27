//
//  SwiftSafeAndEncryptionVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/19.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit
import CommonCrypto

class SwiftSafeAndEncryptionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "加密与安全"
        view.addSubview(self.DecrypTextLabel)
        self.DecrypTextLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        /**加密与安全**/
        /**
         1.设备存储内容进行加密
         2.网络数据进行加密
         3.账号密码进行加盐操作
         **/
        
        //1.对称加密和非对称加密
        SymmetricCryptographyAndAsymmetricCryptography()
        
        //2.3DES
        encrypt(encryptData:"your daddy")
        //3.SHA1
        //4.MD5
        //5.越狱情况的判断
    }

    func SymmetricCryptographyAndAsymmetricCryptography(){
        /**
         对称加密是最快速、最简单的一种加密方式，加密（encryption）与解密（decryption）用的是同样的密钥（secret key）。对称加密有很多种算法，由于它效率很高，所以被广泛使用在很多加密协议的核心当中。

         对称加密通常使用的是相对较小的密钥，一般小于256 bit。因为密钥越大，加密越强，但加密与解密的过程越慢。如果你只用1 bit来做这个密钥，那黑客们可以先试着用0来解密，不行的话就再用1解；但如果你的密钥有1 MB大，黑客们可能永远也无法破解，但加密和解密的过程要花费很长的时间。密钥的大小既要照顾到安全性，也要照顾到效率，是一个trade-off。

         2000年10月2日，美国国家标准与技术研究所（NIST--American National Institute of Standards and Technology）选择了Rijndael算法作为新的高级加密标准（AES--Advanced Encryption Standard）。
         */
        
        /**
         非对称加密为数据的加密与解密提供了一个非常安全的方法，它使用了一对密钥，公钥（public key）和私钥（private key）。私钥只能由一方安全保管，不能外泄，而公钥则可以发给任何请求它的人。非对称加密使用这对密钥中的一个进行加密，而解密则需要另一个密钥。比如，你向银行请求公钥，银行将公钥发给你，你使用公钥对消息加密，那么只有私钥的持有人--银行才能对你的消息解密。与对称加密不同的是，银行不需要将私钥通过网络发送出去，因此安全性大大提高。

         目前最常用的非对称加密算法是RSA算法.
         */
    }
    private let randomStringArray : [Character] = "asdfghjklqwertyuiopzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890".map({$0})
    
    var key : String = ""
    func Method_3_DES(){
        /**
        采用单钥密码的加密方法，同一个密钥可以同时用来加密和解密，这种加密方法称为对称加密，也称为单密钥加密。常用的单向加密算法：
        1、DES（Data Encryption Standard）：数据加密标准，速度较快，适用于加密大量数据的场合；
        2、3DES（Triple DES）：是基于DES，对一块数据用三个不同的密钥进行三次加密，强度更高；
        3、AES（Advanced Encryption Standard）：高级加密标准，是下一代的加密算法标准，速度快，安全级别高，支持128、192、256、512位密钥的加密；
        4、Blowfish
        算法特征
        1、加密方和解密方使用同一个密钥；
        2、加密解密的速度比较快，适合数据比较长时的使用；
        3、密钥传输的过程不安全，且容易被破解，密钥管理也比较麻烦；
        */
        
    }
    //获得指定长度的随机字符串 uniform用来产生0~（n-1）范围内的随机数
    func randomSrtingOfLenth(_ length : Int) -> String{
        var string = ""
        for _ in 1...length{
            string.append(randomStringArray[Int(arc4random_uniform(UInt32(randomStringArray.count)-1))])
        }
        return string
    }
    
    func encrypt(encryptData:String){
        key =  randomSrtingOfLenth(kCCKeySize3DES)//kCCKeySize3DES Triple DES加解密key的大小 其值为24
        let inputData : Data = encryptData.data(using: String.Encoding.utf8)!
        
        let keyData : Data = key.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let keyBytes = UnsafeMutableRawPointer(mutating: (keyData as NSData).bytes)//UnsafeMutableRawPointer 指针
        let keyLength = size_t(kCCKeySize3DES)
        
        let dataLength = Int(inputData.count)
        let dataBytes = UnsafeRawPointer((inputData as NSData).bytes)
        let bufferData = NSMutableData(length: Int(dataLength) + kCCKeySize3DES)!
        let bufferPointer = UnsafeMutableRawPointer(bufferData.mutableBytes)
        let bufferLength = size_t(bufferData.length)
        var bytesDecrypted = Int(0)
        
        let cryptStatus = CCCrypt(UInt32(kCCEncrypt),//加密还是解密
                                  UInt32(kCCAlgorithm3DES),//加密的算法
                                  UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding),//使用秘钥和算法对文本进行加密时的方法，这里是两者中任意一个
                                  keyBytes,
                                  keyLength,
                                  nil,
                                  dataBytes,
                                  dataLength,
                                  bufferPointer,
                                  bufferLength,
                                  &bytesDecrypted)
        /**
        @constant   kCCSuccess          Operation completed normally.
        @constant   kCCParamError       Illegal parameter value.
        @constant   kCCBufferTooSmall   Insufficent buffer provided for specified
                                        operation.
        @constant   kCCMemoryFailure    Memory allocation failure.
        @constant   kCCAlignmentError   Input size was not aligned properly.
        @constant   kCCDecodeError      Input data did not decode or decrypt
                                        properly.
        @constant   kCCUnimplemented    Function not implemented for the current
                                        algorithm.
        @constant   kCCInvalidKey       Key is not valid.
         */
        if Int32(cryptStatus) == Int32(kCCSuccess){
            bufferData.length = bytesDecrypted
            decrypt(inputData:bufferData as Data)
        }else{
            print("加密出错\(cryptStatus)")
        }
        
    }
    
    func decrypt(inputData : Data){
      
        let keyData : Data = key.data(using: String.Encoding.utf8, allowLossyConversion: false)!
        let keyBytes = UnsafeMutableRawPointer(mutating: (keyData as NSData).bytes)//UnsafeMutableRawPointer 指针
        let keyLength = size_t(kCCKeySize3DES)
        
        let dataLength = Int(inputData.count)
        let dataBytes = UnsafeRawPointer((inputData as NSData).bytes)
        let bufferData = NSMutableData(length: Int(dataLength) + kCCKeySize3DES)!
        let bufferPointer = UnsafeMutableRawPointer(bufferData.mutableBytes)
        let bufferLength = size_t(bufferData.length)
        var bytesDecrypted = Int(0)
        
        
        let cryptStatus = CCCrypt(UInt32(kCCDecrypt),//加密还是解密
                                  UInt32(kCCAlgorithm3DES),//加密的算法
                                  UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding),//使用秘钥和算法对文本进行加密时的方法，这里是两者中任意一个
                                  keyBytes,
                                  keyLength,
                                  nil,
                                  dataBytes,
                                  dataLength,
                                  bufferPointer,
                                  bufferLength,
                                  &bytesDecrypted)
        
        if Int32(cryptStatus) == Int32(kCCSuccess){
            bufferData.length = bytesDecrypted
            let string = NSString(data: bufferData as Data, encoding: String.Encoding.utf8.rawValue)
            print(string!)
            self.DecrypTextLabel.text = string as String?
        }else{
            print("解密出错\(cryptStatus)")
        }
    }
    lazy var DecrypTextLabel : UILabel = {
        let DecrypTextLabel = UILabel()
        DecrypTextLabel.textAlignment = .center
        DecrypTextLabel.backgroundColor = .orange
        DecrypTextLabel.textColor = .white
        return DecrypTextLabel;
    }()
    
}
