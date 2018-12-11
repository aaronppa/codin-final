package kr.co.codin.map.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.codin.map.service.MainMapService;
//import kr.co.codin.member.service.MemberService;
import kr.co.codin.repository.domain.HosBasic;
import kr.co.codin.repository.domain.Places;

@Controller
@RequestMapping("map")
public class MainMapController {

	@Autowired
	private MainMapService service;

	
	@RequestMapping("map.do")
	public void dd() {
		
	}


	@RequestMapping("mainajax.do")
	@ResponseBody
	public List<HosBasic> mainajax(double x, double y) throws Exception {
		/*
		 * 위치정보를 제공했을 경우의 해당 위치의 경도 위도값을 바탕으로
		 * 주변 동물병원의 검색 결과를 조회함
		 * 여기서의 x,y값은 중심점으로 검은색 마크로 표시된다.
		 */
		try {
			String clientId = "omim5fmof6";//애플리케이션 클라이언트 아이디값";
			String clientSecret = "rpAtXXzMUbRFlYlId4IeDcNVCNs16YrvgByesmNw"; 
			String text = URLEncoder.encode("동물병원", "UTF-8");
			String apiURL ="https://naveropenapi.apigw.ntruss.com/map-place/v1/search?query="+text+"&coordinate="+x+","+y;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			JSONObject obj = new JSONObject(response.toString());
			Gson gson = new Gson();
			List<HosBasic> Rlist = new ArrayList<HosBasic>();
	
			for(int i = 0 ; i < obj.length(); i++) {
				Object list = (Object) obj.getJSONArray("places").get(i);
				String list1 = list.toString();
				Places p = gson.fromJson(list1, Places.class);
				Rlist.add(addressSearch(p.jibun_address,p.phone_number, p.name));
			}
			return Rlist;
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}
	
	
	@RequestMapping("ajax.do")
	@ResponseBody
	public List<HosBasic> d11d(String data) throws Exception{
		/*
		 * 검색 문자열을 체크하여 문자열의 길이가 4글자 이상이고 뒤에 동물병원이 없는 경우 뒤에 동물병원을 넣어주고
		 * 문자열의 길이가 4글자보다 작으면 뒤에 동물병원을 넣어줌
		 * 이 코드 덕분에 일단 검색 문자열로도 검색 결과가 동물병원만 리턴됨
		 */
		if(data.length() >=4 && data.substring(data.length()-4, data.length()).equals("동물병원")==false) {
			data +=" 동물병원";
		}else if(data.length() < 4) {
			data +=" 동물병원";
		}
		
		try {
		//	try {
				String clientId = "S_tAkybRyVr0rREE6Wvr";//애플리케이션 클라이언트 아이디값";
				String clientSecret = "op3D_FbX_y";//애플리케이션 클라이언트 시크릿값";
				String text = URLEncoder.encode(data, "UTF-8");
				String apiURL = "https://openapi.naver.com/v1/search/local.json?query="+ text; // json 결과
				//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("X-Naver-Client-Id", clientId);
				con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer response = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					response.append(inputLine);
				}
				br.close();
				JSONObject obj = new JSONObject(response.toString());
				Gson gson = new Gson();
				List<HosBasic> list11 = new ArrayList<>();
			
				for(int i = 0 ; i < obj.length(); i++) {
					if(obj.getJSONArray("items").isNull(i)==true)continue;
				//	if(obj.getJSONArray("items").getJSONObject(5).getString("category").toString().equalsIgnoreCase("건강,의료>동물병원")==false)continue;
					Object list = (Object) obj.getJSONArray("items").get(i);
					
					String list1 = list.toString();
					
					
					HosBasic cate = gson.fromJson(list1, HosBasic.class);		
					if(cate.category.equalsIgnoreCase("건강,의료>동물병원")==false)continue;
										
					HosBasic basic = addressSearch(cate.address,cate.telephone,cate.title);
					if (basic == null) continue;
							
							
					list11.add(basic);
						
						
				}
				return list11;
					
		
		} catch (Exception e) {
			e.printStackTrace();
		
		} 
		return null;
	}
	
	public HosBasic addressSearch(String address,String telephone, String title)throws Exception {
		try {
			String clientId = "omim5fmof6";//애플리케이션 클라이언트 아이디값";
			String clientSecret = "rpAtXXzMUbRFlYlId4IeDcNVCNs16YrvgByesmNw"; 
			String text = URLEncoder.encode(address, "UTF-8");
			String apiURL ="https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query="+text;
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
			
				response.append(inputLine);
			
			}	
			br.close();
			JSONObject job = new JSONObject(response.toString());
			
			JSONArray arr = job.getJSONArray("addresses");
	
			try {
				
			
			JSONObject job3 = new JSONObject(arr.get(0).toString());
			HosBasic hos = new HosBasic();
			
			String setTitle = title.replace("<b>", " ");
			
			String resultTitle = setTitle.replace("</b>"," ");
			
			String RTitle = resultTitle.replace("  ", " " );
			
			if(RTitle.substring(0,1).equalsIgnoreCase(" ")==true) {
			
				RTitle =RTitle.substring(1, RTitle.length());
			}
			
			if(RTitle.substring(RTitle.length()-1,RTitle.length()).equalsIgnoreCase(" ")==true ) {
			
				RTitle =RTitle.substring(0, RTitle.length()-1);
			}
			
			hos.setAddress(job3.get("jibunAddress").toString());
			hos.setRoadAddress(job3.get("roadAddress").toString());
			hos.setMapx(Double.parseDouble(job3.get("x").toString()));
			hos.setMapy(Double.parseDouble(job3.get("y").toString()));
			hos.setTitle(RTitle);
			hos.setTelephone(telephone);
		
			service.insertMap(hos);
			
			
			hos.setHosCode(service.selectHosCode(hos));
			hos.setHosRegister(service.HosCheck(hos));
			
			return hos;
			
			} catch (JSONException e) {
				//System.err.println(e.toString());
				System.out.println("에러 캐치");//서강대로 검색시 3번째 인덱스 값이 널이 나와서 에러 발생...때문에 jsp의 루프에도 null에 대한 처리를 진행하였음
			}//추가
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}
	

}
