package main.java.com.pingxx.example;

import java.io.UnsupportedEncodingException;
import java.util.*;

import com.pingplusplus.exception.APIConnectionException;
import com.pingplusplus.exception.APIException;
import com.pingplusplus.exception.AuthenticationException;
import com.pingplusplus.exception.ChannelException;
import com.pingplusplus.exception.InvalidRequestException;
import com.pingplusplus.exception.PingppException;
import com.pingplusplus.model.Charge;
import com.pingplusplus.model.ChargeCollection;

/**
 * Charge 对象相关示例
 *
 * 该实例程序演示了如何从 Ping++ 服务器获得 charge ，查询 charge。
 *
 * 开发者需要填写 apiKey 和 appId , apiKey 可以在 Ping++ 管理平台【应用信息里面查看】
 *
 * apiKey 有 TestKey 和 LiveKey 两种。
 *
 * TestKey 模式下不会产生真实的交易。
 */
public class ChargeExample {

	private String appId;

    public ChargeExample(String appId) {
        this.appId = appId;
    }

    public static void runDemos(String appId) {

        ChargeExample chargeExample = new ChargeExample(appId);
        System.out.println("------- 创建 charge -------");
//        Charge charge = chargeExample.createCharge();
       // Charge charge = chargeExample.createChargeWithOpenid("o7FDrs9ZvM1-15Bo_ajys5i-SszY");
        System.out.println("------- 查询 charge -------");
//        chargeExample.retrieve(charge.getId());
//        System.out.println("------- 查询 charge 列表 -------");
//        chargeExample.all();
    }

    /**
     * 创建 Charge
     *
     * 创建 Charge 用户需要组装一个 map 对象作为参数传递给 Charge.create();
     * map 里面参数的具体说明请参考：https://pingxx.com/document/api#api-c-new
     * @return Charge
     */
    public Charge createCharge() {
        Charge charge = null;
        Map<String, Object> chargeMap = new HashMap<String, Object>();
        chargeMap.put("amount", 100);
        chargeMap.put("currency", "cny");
        chargeMap.put("subject", "Your Subject");
        chargeMap.put("body", "Your Body");
        String orderNo = new Date().getTime() + Main.randomString(7);
        chargeMap.put("order_no", orderNo);
        chargeMap.put("channel", "alipay");
        chargeMap.put("client_ip", "127.0.0.1"); // 客户端 ip 地址(ipv4)
        Map<String, String> app = new HashMap<String, String>();
        app.put("id", appId);
        chargeMap.put("app", app);

        Map<String, Object> extra = new HashMap<String, Object>();
//        extra.put("open_id", "USER_OPENID");
        chargeMap.put("extra", extra);
        try {
            //发起交易请求
            charge = Charge.create(chargeMap);
            // 传到客户端请先转成字符串 .toString(), 调该方法，会自动转成正确的 JSON 字符串
            String chargeString = charge.toString();
            System.out.println(chargeString);
        } catch (PingppException e) {
            e.printStackTrace();
        }
        return charge;
    }

    /**
     * 创建 Charge (微信公众号)
     *
     * 创建 Charge 用户需要组装一个 map 对象作为参数传递给 Charge.create();
     * map 里面参数的具体说明请参考：https://pingxx.com/document/api#api-c-new
     * @return Charge
     */
    public Charge createChargeWithOpenid(String openid,Integer amount,String content) {
        Charge charge = null;
//        try {
//			content=new String(content.getBytes("gbk"),"utf-8");
//		} catch (UnsupportedEncodingException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
        Map<String, Object> chargeMap = new HashMap<String, Object>();
        //订单总金额, 单位为对应币种的最小货币单位，例如：人民币为分（如订单总金额为 1 元，此处请填 100）。
        chargeMap.put("amount", amount);
        //三位 ISO 货币代码，目前仅支持人民币 cny。
        chargeMap.put("currency", "cny");
        //商品的标题，该参数最长为 32 个 Unicode 字符，银联全渠道（upacp/upacp_wap）限制在 32 个字节。
        chargeMap.put("subject", "云ICU会议支付"+amount/100.0+"元");
        //商品的描述信息，该参数最长为 128 个 Unicode 字符，yeepay_wap 对于该参数长度限制为 100 个 Unicode 字符。
        chargeMap.put("body", "Your Body");
        String orderNo = new Date().getTime() + Main.randomString(7);
        //商户订单号，适配每个渠道对此参数的要求，必须在商户系统内唯一。
        //(alipay: 1-64 位，
        //wx: 2-32 位，
        //bfb: 1-20 位，upacp: 8-40 位，yeepay_wap:1-50 位，jdpay_wap:1-30 位，cnp_u:8-20 位，cnp_f:8-20 位，
        //推荐使用 8-20 位，要求数字或字母，不允许特殊字符)。
        chargeMap.put("order_no", orderNo);
        //支付使用的第三方支付渠道
        chargeMap.put("channel", "wx_pub");
        //发起支付请求客户端的 IP 地址，格式为 IPV4，如: 127.0.0.1。
        chargeMap.put("client_ip", "127.0.0.1"); // 客户端 ip 地址(ipv4)
        Map<String, String> app = new HashMap<String, String>();
        app.put("id", appId);
        chargeMap.put("app", app);

        Map<String, Object> extra = new HashMap<String, Object>();
        extra.put("open_id", openid);
        //特定渠道发起交易时需要的额外参数以及部分渠道支付成功返回的额外参数。
        chargeMap.put("extra", extra);
        try {
            //发起交易请求
            charge = Charge.create(chargeMap);
            // 传到客户端请先转成字符串 .toString(), 调该方法，会自动转成正确的 JSON 字符串
            String chargeString = charge.toString();
            System.out.println(chargeString);
        } catch (PingppException e) {
            e.printStackTrace();
        }
        return charge;
    }

    /**
     * 查询 Charge
     *
     * 该接口根据 charge Id 查询对应的 charge 。
     * 参考文档：https://pingxx.com/document/api#api-c-inquiry
     *
     * 该接口可以传递一个 expand ， 返回的 charge 中的 app 会变成 app 对象。
     * 参考文档： https://pingxx.com/document/api#api-expanding
     * @param id
     */
    public Charge retrieve(String id) {
        Charge charge = null;
        try {
            Map<String, Object> params = new HashMap<String, Object>();
//            List<String> expand = new ArrayList<String>();
//            expand.add("app");
//            params.put("expand", expand);
            charge = Charge.retrieve(id, params);
            System.out.println(charge);
        } catch (PingppException e) {
            e.printStackTrace();
        }

        return charge;
    }

    /**
     * 分页查询 Charge
     *
     * 该接口为批量查询接口，默认一次查询10条。
     * 用户可以通过添加 limit 参数自行设置查询数目，最多一次不能超过 100 条。
     *
     * 该接口同样可以使用 expand 参数。
     * @return chargeCollection
     */
    public ChargeCollection all() {
        ChargeCollection chargeCollection = null;
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("limit", 3);
        Map<String, String> app = new HashMap<String, String>();
        app.put("id", appId);
        params.put("app", app);

        try {
            chargeCollection = Charge.all(params);
            System.out.println(chargeCollection);
        } catch (AuthenticationException e) {
            e.printStackTrace();
        } catch (InvalidRequestException e) {
            e.printStackTrace();
        } catch (APIConnectionException e) {
            e.printStackTrace();
        } catch (APIException e) {
            e.printStackTrace();
        } catch (ChannelException e) {
			e.printStackTrace();
		}

        return chargeCollection;
    }
}
