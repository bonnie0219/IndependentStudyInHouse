package tw.InHouse.login.controller;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

public class ReCaptchaV3Handler {
       private String recaptchaSecret = "6Ld8yo0cAAAAAKV2dAVBg4GoZo1FZBS_MQ28lxNm";
       private String recaptchaServerURL = "https://www.google.com/recaptcha/api/siteverify";
                                 
       public float verify(String recaptchaFormResponse) {
    	   System.out.println("RecaptchaV3 Handler called.");
    	   System.out.println("g-recaptcha-response:"+recaptchaFormResponse);
    	   
    	   HttpHeaders headers = new HttpHeaders();
    	   headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
    	   MultiValueMap<String,String> map = new LinkedMultiValueMap<>();
    	   map.add("secret", recaptchaSecret);
    	   map.add("response", recaptchaFormResponse);
    	   
    	   HttpEntity<MultiValueMap<String,String>> request = new HttpEntity<>(map ,headers);
    	   RestTemplate restTemplate = new RestTemplate();
    	   ReCaptchaV3Response response = restTemplate.postForObject(recaptchaServerURL, request, ReCaptchaV3Response.class);
           System.out.println("ReCaptcha Response: \n");
           
           System.out.println("Success: "+response.isSuccess());
           System.out.println("Action: "+response.getAction());
           System.out.println("Hostname: "+response.getHostname());
           System.out.println("Score: "+response.getScore());
           System.out.println("Challenge Timestamp: "+response.getChallenge_ts());
           
           if(response.getErrorCodes()!=null) {
        	       System.out.println("Error Codes: ");
        	   for(String errorCode : response.getErrorCodes()) {
        		   System.out.println("\t"+errorCode);
        	   }
           }
           
           return response.getScore();
       }
}
