package com.chinasofti.ordersys.controller.login;

import com.chinasofti.ordersys.service.login.CheckCodeService;
import com.chinasofti.ordersys.vo.Sms;
import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.Date;

@Controller
public class SmsController {
    @Autowired
    CheckCodeService checkCodeService;
    @RequestMapping(value = "/send")
    public void Send(String phoneNumber,String pCode){
        int appId = 1400714908;
        String key = "5ba0f10f7cad3fab6564733f88e80af9";
        int templeId = 1494628;
        String smsSign = "胡英俊的个人公众号";
        Sms sms = new Sms();
        String code = sms.getCode();

        try {
            String[] params = {code,"2"};
            SmsSingleSender smsSingleSender = new SmsSingleSender(appId,key);
            SmsSingleSenderResult result = smsSingleSender.sendWithParam("86",phoneNumber,templeId,params,smsSign,"","");
            System.out.println(result);
        } catch (HTTPException e){
            System.out.println("1");
            e.printStackTrace();
        } catch (JSONException e){
            System.out.println("2");
            e.printStackTrace();
        } catch (IOException e){
            System.out.println("3");
            e.printStackTrace();
        }
        checkCodeService.updatecode(code,new Date(),phoneNumber);
    }

    
    @RequestMapping("/verify")
    public void verify(String phoneNumber,String rCode){
        System.out.println(phoneNumber);
        System.out.println(rCode);
    }

}
