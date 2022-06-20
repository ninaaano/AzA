package com.aza.service.user.impl;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aza.common.Search;
import com.aza.service.domain.User;
import com.aza.service.user.UserDao;
import com.aza.service.user.UserService;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addUser(User user) throws Exception {

		String p = "parent";
		
		if(user.getRole().equals(p)) {
			userDao.addUserbyParent(user);
		} else {
			userDao.addUser(user);

		}
		
		System.out.println(user);
		
		
	//	userDao.addRelation(user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		userDao.deleteUser(user);

	}

	@Override
	public int checkDuplication(String userId) throws Exception {
		int cnt = userDao.checkDuplication(userId);
		return cnt;
	}
	
	@Override
	public int checkStudent(String firstStudentId) throws Exception {
		int cnt = userDao.checkStudent(firstStudentId);
		return cnt;
	}

	@Override
	public void updateAlertState(User user) throws Exception {
		userDao.updateAlertState(user);
	}

	@Override
	public void updateStopAlertStartTime(User user) throws Exception {
		userDao.updateStopAlertStartTime(user);
	}

	@Override
	public void updateStopAlertEndTime(User user) throws Exception {
		userDao.updateStopAlertEndTime(user);
	}

	@Override
	public void addRelation(User user) throws Exception {
		userDao.addRelation(user);
	}

//	@Override
//	public void deleteRelation(String userId) throws Exception {
//		userDao.deleteRelation(userId);
//	}

	public void deleteRelation(int relationCode) throws Exception {
		userDao.deleteRelation(relationCode);
	}

//	@Override
//	public User getRelation(String firstStudentId, String parentId) throws Exception {
//		return userDao.getRelation(firstStudentId, parentId);
//	}
	
	@Override
	public User getRelation(int relationCode) throws Exception {
		return userDao.getRelation(relationCode);
	}

	@Override
	public void updateRelation(User user) throws Exception {
		userDao.updateRelation(user);
	}

	@Override
	public Map<String, Object> listRelationByStudent(Search search, String studentId) throws Exception {
		List<User> list = userDao.listRelationByStudent(search, studentId);

		int totalCount = userDao.getListRelationByStudentTotalCount(search, studentId);

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	
	@Override
	public Map<String, Object> listRelationByParent(Search search, String parentId) throws Exception {
		List<User> list = userDao.listRelationByParent(search, parentId);
		int totalCount = userDao.getListRelationByParentTotalCount(search, parentId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	


	@Override
	public void updateCheck(User user) throws Exception {
		userDao.updateCheck(user);
	}
	
	private static String makeSignature(String url, String timestamp, String method, String accessKey, String secretKey) throws NoSuchAlgorithmException, InvalidKeyException {
	    String space = " ";                    // one space
	    String newLine = "\n";                 // new line
	    

	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey;
	    String encodeBase64String;
		try {
			
			signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);
			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		    encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			encodeBase64String = e.toString();
		}
	    

	  return encodeBase64String;
	}
	
	public void sendSMS(String phone,String message) {
		String hostNameUrl = "https://sens.apigw.ntruss.com";     		// 호스트 URL
		String requestUrl= "/sms/v2/services/";                   		// 요청 URL
		String requestUrlType = "/messages";                      		// 요청 URL
		String accessKey = "pCopjZ18V8WkJ8SWIYkw";                     	// ?꽕?씠踰? ?겢?씪?슦?뱶 ?뵆?옯?뤌 ?쉶?썝?뿉寃? 諛쒓툒?릺?뒗 媛쒖씤 ?씤利앺궎			// Access Key : https://www.ncloud.com/mypage/manage/info > ?씤利앺궎 愿?由? > Access Key ID
		String secretKey = "mB2GFPQwS5lPvVJlvQMYq6U4NK974amLmg4E3VEt";  // 2李? ?씤利앹쓣 ?쐞?빐 ?꽌鍮꾩뒪留덈떎 ?븷?떦?릺?뒗 service secret key	// Service Key : https://www.ncloud.com/mypage/manage/info > ?씤利앺궎 愿?由? > Access Key ID	
		String serviceId = "ncp:sms:kr:286287947040:aza";      // 프로젝트에 할당된 SMS 서비스 ID							// service ID : https://console.ncloud.com/sens/project > Simple & ... > Project > 서비스 ID
		String method = "POST";											// 요청 method
		String timestamp = Long.toString(System.currentTimeMillis()); 	// current timestamp (epoch)
		requestUrl += serviceId + requestUrlType;
		//String apiUrl = hostNameUrl + requestUrl;
		String apiUrl = "https://sens.apigw.ntruss.com/sms/v2/services/ncp:sms:kr:286287947040:aza/messages";
		// JSON 을 활용한 body data 생성
		JSONObject bodyJson = new JSONObject();
		JSONObject toJson = new JSONObject();
	    JSONArray  toArr = new JSONArray();

	    //toJson.put("subject","");							// Optional, messages.subject	개별 메시지 제목, LMS, MMS에서만 사용 가능
	    //toJson.put("content","sms test in spring 111");	// Optional, messages.content	개별 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    //toJson.put("to",phone);	
	    toJson.put("to",phone);						// Mandatory(필수), messages.to	수신번호, -를 제외한 숫자만 입력 가능
	    toArr.add(toJson);
	    
	    bodyJson.put("type","SMS");							// Madantory, 메시지 Type (SMS | LMS | MMS), (소문자 가능)
	    //bodyJson.put("contentType","");					// Optional, 메시지 내용 Type (AD | COMM) * AD: 광고용, COMM: 일반용 (default: COMM) * 광고용 메시지 발송 시 불법 스팸 방지를 위한 정보통신망법 (제 50조)가 적용됩니다.
	    //bodyJson.put("countryCode","82");					// Optional, 국가 전화번호, (default: 82)
	    bodyJson.put("from","01032030796");					// Mandatory, 발신번호, 사전 등록된 발신번호만 사용 가능		
	    //bodyJson.put("subject","");						// Optional, 기본 메시지 제목, LMS, MMS에서만 사용 가능
	    bodyJson.put("content",message);	// Mandatory(필수), 기본 메시지 내용, SMS: 최대 80byte, LMS, MMS: 최대 2000byte
	    bodyJson.put("messages", toArr);					// Mandatory(필수), 아래 항목들 참조 (messages.XXX), 최대 1,000개
	    
	    //String body = bodyJson.toJSONString();
	    String body = bodyJson.toString();
	    
	    System.out.println(body);
	    
        try {
            URL url = new URL(apiUrl);

            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setUseCaches(false);
            con.setDoOutput(true);
            con.setDoInput(true);
            con.setRequestProperty("content-type", "application/json");
            con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
            con.setRequestProperty("x-ncp-iam-access-key", accessKey);
            con.setRequestProperty("x-ncp-apigw-signature-v2", makeSignature(requestUrl, timestamp, method, accessKey, secretKey));
            con.setRequestMethod(method);
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            
            wr.write(body.getBytes());
            wr.flush();
            wr.close();

            int responseCode = con.getResponseCode();
            BufferedReader br;
            System.out.println("responseCode" +" " + responseCode);
            if(responseCode == 202) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            System.out.println(response.toString());

        } catch (Exception e) {
            System.out.println(e);
        }
	}

	
	
	@Override
	public int phoneAuth() throws Exception {
		Random random  = new Random();
		random.setSeed(System.currentTimeMillis());  	
    	int num = (random.nextInt(1000000) % 1000000);
    	return num;
		
	}

	@Override
	public User findId(User user) throws Exception {
		return userDao.findId(user);
	}

	@Override
	public User findPassword(User user) throws Exception {
		return userDao.findPassword(user);
	}

	@Override
	public void updatePassword(User user) throws Exception {
		userDao.updatePassword(user);
	}

	@Override
	public int confirmCode(String code) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User checkPhone(User user) throws Exception {
		return userDao.checkPhone(user);
		}
	
}