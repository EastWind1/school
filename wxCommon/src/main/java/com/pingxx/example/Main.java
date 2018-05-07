package main.java.com.pingxx.example;

import com.pingplusplus.Pingpp;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.SecureRandom;

/**
 * Created by Afon on 16/4/26.
 */
public class Main {

    /**
     * Pingpp 管理平台对应的 API Key
     */
    private final static String apiKey = "sk_test_WnTOGGCCy5m9a544mDanbLCK";

    /**
     * Pingpp 管理平台对应的应用 ID
     */
    private final static String appId = "app_yXHmHK4Gmj9Kz9aH";

    /**
     * 你生成的私钥路径
     */
    private final static String privateKeyFilePath = "res/your_rsa_private_key.pem";

    public static void main(String[] args) throws Exception {

        // 设置 API Key
        Pingpp.apiKey = apiKey;

        // 设置私钥路径，用于请求签名
        Pingpp.privateKeyPath = privateKeyFilePath;

        /**
         * 或者直接设置私钥内容
         Pingpp.privateKey = "-----BEGIN RSA PRIVATE KEY-----\n" +
         "... 私钥内容字符串 ...\n" +
         "-----END RSA PRIVATE KEY-----\n";
         */

        // Charge 示例 发起支付
        ChargeExample.runDemos(appId);

        // Refund 示例 退款
        //RefundExample.runDemos();

        // RedEnvelope 示例 红包
        //RedEnvelopeExample.runDemos(appId);

        // Transfer 示例 //转账
        //TransferExample.runDemos(appId);

        // Event 示例
        //EventExample.runDemos();

        // Webhooks 验证示例
        //WebhooksVerifyExample.runDemos();

        // 微信公众号 openid 相关示例
        //WxPubOAuthExample.runDemos(appId);
    }

    private static SecureRandom random = new SecureRandom();

    public static String randomString(int length) {
        String str = new BigInteger(130, random).toString(32);
        return str.substring(0, length);
    }
}
