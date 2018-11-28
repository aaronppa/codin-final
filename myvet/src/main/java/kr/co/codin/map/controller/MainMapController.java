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
import kr.co.codin.repository.domain.places;

@Controller
@RequestMapping("map")
public class MainMapController {

	@Autowired
	private MainMapService service;

	
	@RequestMapping("map.do")
	public void dd() {
		//	System.out.println("옴");
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
				places p = gson.fromJson(list1, places.class);
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
			String clientId = "ZOkOJ2shguhudlHkiOL9";//애플리케이션 클라이언트 아이디값";
			String clientSecret = "tibcZC2qX9";//애플리케이션 클라이언트 시크릿값";
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
			//	if(obj.getJSONArray("items").get(i)== null)continue;//dddd
				Object list = (Object) obj.getJSONArray("items").get(i);
				String list1 = list.toString();
				System.out.println("list1 : " + list1);
				
				HosBasic cate = gson.fromJson(list1, HosBasic.class);
				//if(cate==null)continue;
				System.out.println("137번째 줄:"+i +"   "+cate.address+" , "+cate.telephone+"  , "+cate.title+","+cate.getMapx()+","+cate.getMapy());
				HosBasic basic = addressSearch(cate.address,cate.telephone,cate.title);
				if (basic == null) continue;
				
				list11.add(basic);
				
			}
			return list11;
		} catch (Exception e) {
			System.err.println(e);
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
			
			System.out.println("-------" + response.toString());
			
			br.close();
			JSONObject job = new JSONObject(response.toString());
			
			JSONArray arr = job.getJSONArray("addresses");
			System.out.println("178:"+arr.toString());
			try {
				
			
			JSONObject job3 = new JSONObject(arr.get(0).toString());
			HosBasic hos = new HosBasic();
			
			hos.setAddress(job3.get("jibunAddress").toString());
			hos.setRoadAddress(job3.get("roadAddress").toString());
			hos.setMapx(Double.parseDouble(job3.get("x").toString()));
			hos.setMapy(Double.parseDouble(job3.get("y").toString()));
			hos.setTitle(title);
			hos.setTelephone(telephone);
			//hos.setAddress(job3.get("roadAddress"));
			//
			service.insertMap(hos);//의도적으로 {}로 감싸놓았음 이거 없으면 에러
			hos.setHosRegister(service.HosCheck(hos));
			
			return hos;
			
			} catch (JSONException e) {
				//System.err.println(e.toString());
				System.out.println("에러 터진 캐치");//서강대로 검색시 3번째 인덱스 값이 널이 나와서 에러 발생...때문에 jsp의 루프에도 null에 대한 처리를 진행하였음
			}//추가
		} catch (Exception e) {

			e.printStackTrace();
		}
		return null;
	}
}
