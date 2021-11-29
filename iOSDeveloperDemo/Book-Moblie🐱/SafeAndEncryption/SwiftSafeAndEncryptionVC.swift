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
        self.hidesBottomBarWhenPushed = true
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
        Method_SHA1()
        //4.MD5
        Method_MD5()
        //5.越狱情况的判断
        jailbreak()
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
    
    
    
    func Method_SHA1(){
        /**
        SHA-1（英语：Secure Hash Algorithm 1，中文名：安全散列算法1）是一种密码散列函数，美国国家安全局设计，并由美国国家标准技术研究所（NIST）发布为联邦数据处理标准（FIPS）。SHA-1可以生成一个被称为消息摘要的160位（20字节）散列值，散列值通常的呈现形式为40个十六进制数。 [1]
        SHA-1已经不再视为可抵御有充足资金、充足计算资源的攻击者。2005年，密码分析人员发现了对SHA-1的有效攻击方法，这表明该算法可能不够安全，不能继续使用，自2010年以来，许多组织建议用SHA-2或SHA-3来替换SHA-1。Microsoft、Google以及Mozilla都宣布，它们旗下的浏览器将在2017年前停止接受使用SHA-1算法签名的SSL证书。
        */
        let string = "your daddy"
        print("SHA1-加密结果:+\(string.SHA1())")
        print("SHA512-加密结果:+\(string.SHA512())")
    }
    func Method_MD5(){
        /**
        MD5信息摘要算法（英语：MD5 Message-Digest Algorithm），一种被广泛使用的密码散列函数，可以产生出一个128位（16字节）的散列值（hash value），用于确保信息传输完整一致。
        */
        //This function is cryptographically broken and should not be used in security contexts. Clients should migrate to SHA256 (or stronger).
        let string = "your func mother"
        print("MD5-加密结果:+\(string.MD5())")
    }
    
    
    func jailbreak() -> Bool{
        //1.通过越狱后增加的越狱文件判断,判断这些文件是否存在，让文件添加到数组中，遍历数组，如果存在任何一个文件，就认为是越狱了
        let jailbreak_tool_paths = ["/Applications/Cydia.app",
                                    "/Library/MobileSubstrate/MobileSubstrate.dylib",
                                    "/bin/bash",
                                    "/usr/sbin/sshd",
                                    "/etc/apt"]
        
        for path in jailbreak_tool_paths {
            //通过文件管理器，判断在指定的目录下，是否在对应的应用程序。如果存在的话。就表示当前设备为越狱设备。
            if FileManager.default.fileExists(atPath: path){
                return true
            }
        }
        //2.是否能打开cydia这个协议头
        if UIApplication.shared.canOpenURL(URL(string: "cydia://")!){
            return true
        }
        //3.越狱后的手机是可以获取到手机内安装的所有应用程序的，如果可以获取到就说明越狱了
//        if ([[NSFileManager defaultManager] fileExistsAtPath:@"User/Applications/"]) {
//        NSLog(@"The device is jail broken!");
//        NSArray *appList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"User/Applications/" error:nil];
//        NSLog(@"appList = %@", appList);
//        return YES;
//        }
        
        //4.使用C语言的函数来判断，使用star方法判断cydia是否存在
//        int checkInject() {
//        int ret;
//        Dl_info dylib_info;
//        int (*func_stat)(const char*, struct stat*) = stat;
//        char *dylib_name = "/usr/lib/system/libsystem_kernel.dylib";
//        if ((ret = dladdr(func_stat, &dylib_info)) && strncmp(dylib_info.dli_fname, dylib_name, strlen(dylib_name))) {
//        return 0;
//        }
//        return 1;
//        }
//        int checkCydia() {
//        struct stat stat_info;
//        if (!checkInject()) {
//        if (0 == stat("/Applications/Cydia.app", &stat_info)) {
//        return 1;
//        }
//        } else {
//        return 1;
//        }
        //5.根据读取的环境变量是否有值判断
//        char* printEnv(void) {
//        charchar *env = getenv("DYLD_INSERT_LIBRARIES");
//        NSLog(@"%s", env);
//        return env;
//        }
//        - (BOOL)isJailBreak {
//        if (printEnv()) {
//        NSLog(@"The device is jail broken!");
//        return YES;
//        }
        return false
    }
    
}

extension Int{
    func hexedString() -> String{//整型类型转换为十六进制字符串
        return NSString(format: "%02x", self) as String
    }
}
extension NSData{
    func hexedString() -> String{
        var string = String()
        let unsafePointer = bytes.assumingMemoryBound(to: UInt8.self)
        for i in UnsafeBufferPointer<UInt8>(start: unsafePointer, count: length){
            string += Int(i).hexedString()
        }
        return string
    }
    func SHA1() -> NSData{//SHA1加密
        let result = NSMutableData(length: Int(CC_SHA1_DIGEST_LENGTH))!
        let unsafePointer = result.mutableBytes.assumingMemoryBound(to: UInt8.self)
        CC_SHA1(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(unsafePointer))
        return NSData(data: result as Data)
    }
    
    func MD5() -> NSData{
        let result = NSMutableData(length: Int(CC_MD5_DIGEST_LENGTH))!
        let unsafePointer = result.mutableBytes.assumingMemoryBound(to: UInt8.self)
        CC_MD5(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(unsafePointer))//This function is cryptographically broken and should not be used in security contexts. Clients should migrate to SHA256 (or stronger).
        return NSData(data: result as Data)
    }
    
    func SHA512() -> NSData{
        let result = NSMutableData(length: Int(CC_SHA512_DIGEST_LENGTH))!
        let unsafePointer = result.mutableBytes.assumingMemoryBound(to: UInt8.self)
        CC_SHA512(bytes, CC_LONG(length), UnsafeMutablePointer<UInt8>(unsafePointer))
        return NSData(data: result as Data)
    }
}
extension String{
    func SHA1() -> String{
        let data = (self as NSString).data(using: String.Encoding.utf8.rawValue)! as NSData
        return data.SHA1().hexedString()
    }
    func MD5() -> String{
        let data = (self as NSString).data(using: String.Encoding.utf8.rawValue)! as NSData
        return data.MD5().hexedString()
    }
    func SHA512() -> String{
        let data = (self as NSString).data(using: String.Encoding.utf8.rawValue)! as NSData
        return data.SHA512().hexedString()
    }
}
