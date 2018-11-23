package kr.co.codin.hos.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.co.codin.hos.service.HosService;
import kr.co.codin.hos.service.HosServiceImpl;
import kr.co.codin.repository.domain.Hospital;
import kr.co.codin.repository.domain.SearchPlace;
import kr.co.codin.repository.domain.TestHospital;

@Controller
@RequestMapping("hos")
public class HosController {

	@Autowired
	HosService service = new HosServiceImpl();
	
	@RequestMapping("register.do")
	public void registerHos(Model model) {
		model.addAttribute("facilityList", service.selectFacility());
	}
	
	@RequestMapping("facilitylist.do")
	public void facilitylist(Model model) {
		
	}
	
	@RequestMapping("insert.do")
	public void insertHos() throws Exception {
		
		Gson gson = new Gson();
		
		SearchPlace place = gson.fromJson(searchPlaceApi(), SearchPlace.class);
		
		List<TestHospital> list = place.getPlaces();
		
		for (TestHospital test : list) {
			Hospital hospital = new Hospital();
			
			hospital.setTitle(test.getName());
			hospital.setAddress(test.getJibun_address());
			hospital.setRoadAddress(test.getRoad_address());
			hospital.setTelephone(test.getPhone_number());
			hospital.setMapx(test.getX());
			hospital.setMapy(test.getY());
			
			System.out.println(hospital.toString());
			service.insertHospital(hospital);
		}
	}
	
	public String searchPlaceApi() throws Exception {
		String blogUrl = "https://naveropenapi.apigw.ntruss.com/map-place/v1/search";
		String json = "";

		String parameter = "?";
		String query = "query=" + URLEncoder.encode("동물병원", "utf-8");
		String coordinate = "coordinate=" + "127.115514,37.398564";
		parameter = parameter + query + "&" + coordinate;

		System.out.println(parameter);
		URL url = new URL(blogUrl + parameter);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		// GET 방식 설정
		conn.setRequestMethod("GET");

		// 헤더값 설정
		//			Content-Type: application/x-www-form-urlencoded; charset=UTF-8
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", "kxd0pvbof9");
		conn.setRequestProperty("X-NCP-APIGW-API-KEY", "16Bj01IPAzD7ais0Wy4N9e9htXinledDgasWKWCt");

		// 응답 코드 처리
		int code = conn.getResponseCode();
		System.out.println("Connection ResponseCode : " + code);

		// 응답 데이터 추출하기

		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			while (true) {
				String line = br.readLine();
				if (line == null) break;
				json = json + line;
				// 서버에서 보내준 응답데이터			
				System.out.println(line);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"));

			while (true) {
				String line = br.readLine();
				if (line == null) break;

				// 서버에서 보내준 응답데이터			
				System.out.println(line);
			}

		}

		return json;
	}
}
