package kr.or.book4zo.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.or.book4zo.action.Action;
import kr.or.book4zo.action.ActionForward;
import kr.or.book4zo.dao.BookDao;
import kr.or.book4zo.dto.BookDto;

public class Book_SaveDataToDB_s implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		
		System.out.println("Book_SaveDataToDB_s");
		
		ActionForward forward = null;
		String json = "";
		String address = "http://book.interpark.com/api/bestSeller.api?key=ECF73A29EE9688587F70A785201AB95DE352C2284B870EEE927ECAC11048DEDE&categoryId=102&output=json";
		BufferedReader br;
		URL url;
		HttpURLConnection conn;
		String protocol = "GET";

		try {
			url = new URL(address);
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod(protocol);
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			System.out.println("BookJson");
			
			json = br.readLine();
			
		} catch (Exception e) {
			System.out.println("BufferedReader 에러");
			e.printStackTrace();
		}

        //테스트출력
		System.out.println(json);
		
		
		JSONParser parser;
		JSONObject obj;
		
		
		try {
			
			parser = new JSONParser();
			
			obj = (JSONObject)parser.parse(json);
			JSONArray item  = (JSONArray)obj.get("item");
//			System.out.println(obj.get("item"));
//			System.out.println(item);
			
			BookDao dao = new BookDao();
			List<BookDto> bookList = new ArrayList<BookDto>();
			for(int i =0 ; i < item.size(); i ++) {
				
				BookDto book = new BookDto();
				
				JSONObject tmp = (JSONObject)item.get(i);
				
				String isbn = ((String)tmp.get("isbn")).trim();
				String title = ((String)tmp.get("title")).trim();
				String author = ((String)tmp.get("author")).trim();
				String translator = (tmp.get("translator") == null) ? "" : ((String)tmp.get("translator")).trim();
				String coverurl = ((String)tmp.get("coverLargeUrl")).trim();
				String publisher = ((String)tmp.get("publisher")).trim();
				String categoryid = ((String)tmp.get("categoryId")).trim(); // 이거 타입 확인하기
//				String categorytag = (String)tmp.get("categoryTag");
				Long price = (Long)tmp.get("priceStandard"); // dto 타입 변경해주기
				String pubDate = ((String)tmp.get("pubDate")).trim();
				String description = ((String)tmp.get("description")).trim();
				Long rank = (Long)tmp.get("rank");

				
				book.setIsbn(isbn);
				book.setTitle(title);
				book.setAuthor(author);
				book.setTranslator(translator);
				book.setCoverUrl(coverurl);
				book.setPublisher(publisher);
				book.setCategoryId(Integer.parseInt(categoryid));
//				book.setCategoryTag(categorytag);
				book.setPriceStandard(price);
				book.setPubDate(pubDate);
				book.setDescription(description);
				book.setRank(rank); // dto 타입 변경해주기
				
//				System.out.println("여기");
//				System.out.println(book);

	
				try {
					
					 int result = dao.insertBookListToDB(book);
					 System.out.println(result);
					 
					if(result == 0) {
						System.out.println("DB 저장 실패");
					}else {
						System.out.println("DB 저장 성공");
					}
					
				} catch (Exception e) {
					System.out.println("insertBookListToDB 에러");
					System.out.println(e.getMessage());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
