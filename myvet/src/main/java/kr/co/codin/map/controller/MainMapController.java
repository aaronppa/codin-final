package kr.co.codin.map.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.codin.map.service.MainMapService;
import kr.co.codin.member.service.MemberService;
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
	public List<HosBasic> mainajax(double x, double y) {
		//System.out.println(x);
		//System.out.println(y);
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
		//	System.out.println(response.toString());

			JSONObject obj = new JSONObject(response.toString());
			// System.out.println(obj.toString());
			// System.out.println(obj.length());
			Gson gson = new Gson();
			List<places> resultList =new ArrayList<places>();
			List<HosBasic> Rlist = new ArrayList<HosBasic>();
			for(int i = 0 ; i < obj.length(); i++) {
				Object list = (Object) obj.getJSONArray("places").get(i);
				String list1 = list.toString();
			//	System.out.println("list1dslfjd::::::::"+list1);
				places p = gson.fromJson(list1, places.class);
				HosBasic cate = gson.fromJson(list1, HosBasic.class);
				//System.out.println("---------------------------------");
		//		System.out.println("네임:"+p.name);
				
		//		System.out.println(p.phone_number);
				//System.out.println(p.jibun_address);
		//		System.out.println("우아아아아아");
		//		System.out.println(p.x);
		//		System.out.println(p.y);
		//		System.out.println(p.road_address);//DB 연동이 안되었기때문에 _붙여서 테스트
				
				
				Rlist.add(addressSearch(p.jibun_address,p.phone_number, p.name));

				
			}
		
			return Rlist;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("ajax.do")
	@ResponseBody
	public List<HosBasic> d11d(String data) {
	//	System.out.println("d11d 들어옴");
	//	System.out.println(data);
		//System.out.println(data.length());
		if(data.length() >=4 && data.substring(data.length()-4, data.length()).equals("동물병원")==false) {
		//	System.out.println(data.substring(data.length()-4, data.length()));
			data +=" 동물병원";
		//	System.out.println("저기");
		}else if(data.length() <4) {
		//	System.out.println("여기");
			data +=" 동물병원";
		}
	//System.out.println(data);
		//System.out.println("첫번째 "+data);
		try {
			//System.out.println(data);
			//		if(data.length() >= 4) {
			//		data.substring(beginIndex, endIndex);
			//		}
			//System.out.println("여기옴");
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
			// System.out.println(response.toString());

			JSONObject obj = new JSONObject(response.toString());
		//	System.out.println(obj.toString());
			Gson gson = new Gson();
			List<HosBasic> list11 = new ArrayList<>();
		//	List<cate> SearchResult = new ArrayList<>();
			for(int i = 0 ; i < obj.length(); i++) {
				Object list = (Object) obj.getJSONArray("items").get(i);
				String list1 = list.toString();

				HosBasic cate = gson.fromJson(list1, HosBasic.class);
				//	System.out.println("---------------------------------");
			//		System.out.println("지번주소:"+cate.address);
				//	String jibunAddr = cate.address;
				//	System.out.println("지번주소:"+jibunAddr);
			//		System.out.println("도로명주소:"+cate.roadAddress);
				//	System.out.println(cate.category);
				 //	System.out.println("ddd:"+cate.title);
			//	 	System.out.println(cate.telephone);
				//System.out.println(cate.mapx);
				//System.out.println(cate.mapy);
			//		System.out.println(cate.telephone);
				//	System.out.println("---------------------");
				//	System.out.println("여기옴123123");
				//	System.out.println();
				//여기로 옴
				 	//addressSearch(cate.address,cate.telephone,cate.title);
				 	list11.add(i, addressSearch(cate.address,cate.telephone,cate.title));
			//	 	System.out.println("---------------------------");
				 	
				 	
			}
		//	System.out.println("뷁:"+list11.get(0).address);
		//	System.out.println("뷁:"+list11.get(0).mapx);
			return list11;
			
			// System.out.println(c.getItems());
		} catch (Exception e) {
			System.err.println(e);
		}

		//System.out.println("여기옴 ㅈㄷㄶㅇㄹ후");
		return null;

	}
	
	public HosBasic addressSearch(String address,String telephone, String title) {
		
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
	           // Gson gson = new Gson();
	            ///System.out.println(response.toString());
	         
	           // Addresses2 address = gson.fromJson(response.toString(), Addresses2.class);
	            JSONObject job = new JSONObject(response.toString());
//	            Addresses2 address = gson.from
	            //System.out.println(response.toString());
	           // System.out.println(job.get("addresses"));
	           // System.out.println(job.getJSONArray("addresses"));
	            
	            JSONArray arr = job.getJSONArray("addresses");
	          // System.out.println(arr.get(0));
	           
	           JSONObject job3 = new JSONObject(arr.get(0).toString());
	        //  System.out.println("뀨?"+job3.get("x").toString());
	        //   System.out.println(job3.get("y").toString());
	         //  System.out.println(job3.get("jibunAddress").toString());
	         //  System.out.println(job3.get("roadAddress").toString());
	           
	           HosBasic hos = new HosBasic();
	           hos.setAddress(job3.get("jibunAddress").toString());
	           hos.setRoadAddress(job3.get("roadAddress").toString());
	           hos.setMapx(Double.parseDouble(job3.get("x").toString()));
	           hos.setMapy(Double.parseDouble(job3.get("y").toString()));
	           hos.setTitle(title);
	           hos.setTelephone(telephone);
	           //hos.setAddress(job3.get("roadAddress"));
	     
	       		service.insertMap(hos);
	     
	           return hos;
	         
	           
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 return null;
	}
	
	@RequestMapping("mapUnregi.do")
	@ResponseBody
	public String unregiCheck(HosBasic data,String name){
		System.out.println(data.address);
		System.out.println(data.getAddress());
		System.out.println("---------------");
		System.out.println(service.unregiCheck(data));
		//System.out.println(service.unregiCheck(data));
		return service.unregiCheck(data);
	}


}
