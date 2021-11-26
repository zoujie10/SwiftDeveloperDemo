//
//  SwiftSafeAndEncryptionVC.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2021/11/19.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import UIKit

class SwiftSafeAndEncryptionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /**加密与安全**/
        /**
         1.设备存储内容进行加密
         2.网络数据进行加密
         3.账号密码进行加盐操作
         **/
        
        //1.对称加密和非对称加密
        SymmetricCryptographyAndAsymmetricCryptography()
        
        //2.3DES
        
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
    
    
}
