package tw.InHouse.order_controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.InHouse.login.dao.MemberDao;
import tw.InHouse.member_model.Member;
import tw.InHouse.member_model.MemberService;
import tw.InHouse.order_model.ShopCart;
import tw.InHouse.order_model.ShopCartOrderItem;
import tw.InHouse.order_model.ShopCartOrderItemService;
import tw.InHouse.order_model.ShopCartService;
import tw.InHouse.product_model.Product;
import tw.InHouse.product_model.ProductService;

@Controller
//@RequestMapping(path = "/backend/product")
public class ShopControllerTest {
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private ShopCartService sCartService;
	
	@Autowired
	private ShopCartOrderItemService sOrderItemService;
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private MemberDao memberDao;
	
	
	//所有商品的CONTROLLER
	@RequestMapping(path = "/ShopAllProductTest")
	public String getAllProduct(Model model) {
		
		List<Product> products = pService.findAllProduct();
		model.addAttribute("AllProduct", products);
		return "product/shoptest2";
	}
	
	//insert shopcart table
	//購物車的CONTROLLER
		@PostMapping(path = "/shopcarinsert.controller")
		@ResponseBody										
		public ShopCart processShopCarInsert(ShopCart sCart, String cartItem, int pdtotalprice, String memberid) throws JSONException {
			System.out.println(cartItem);
			System.out.println("memberid: " + memberid);			
			Member member1 = mService.findByMember_id(Integer.parseInt(memberid));
			
			ArrayList<ShopCartOrderItem> itemsSet = new ArrayList<ShopCartOrderItem>();
			
			//傳形成json array
			JSONArray jsonArray = new JSONArray(cartItem); 
			
			for(int i = 0; i<jsonArray.length(); i++) {
				
				//取得json array的每筆資料
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				
				//透過optString("對應的欄位名稱")取得值
				String id = jsonObject.optString("id");
				String orderdetail_productname = jsonObject.optString("name");
				int orderdetail_productprice = Integer.parseInt(jsonObject.optString("price"));
				int orderdetail_productcount = Integer.parseInt(jsonObject.optString("qty"));
				//檢查jsonObject裡面的值
				System.out.println("id: "+ id + "productname: " + orderdetail_productname + "productprice: " + orderdetail_productprice + "productcount: " + orderdetail_productcount);
				//new ShopCartOrderItem(javaBean物件)，因為@oneToMany只能使用LIST或是SET型別的資料型態
				//若使用HASHSET 當傳入重複的KEY值時，會將錢一筆資料覆蓋，所以這邊使用LIST型態去接取多筆相同KEY值傳入的資料
				ShopCartOrderItem sitem = new ShopCartOrderItem(orderdetail_productname,orderdetail_productprice,orderdetail_productcount);
				itemsSet.add(sitem);
			}
			//檢查LIST是否有成功新增1筆以上的ShopCartOrderItem->ArrayList<ShopCartOrderItem>物件
			System.out.println(itemsSet.size());
			//將ArrayList<ShopCartOrderItem>塞入SHOPCART 物件做關聯關係(因為是單向關係所以只需要在SHOPCART端設定)
			sCart.setShopCartOrderItem(itemsSet);
			sCart.setOrder_productToTalPrice(pdtotalprice);
			sCart.setOrder_shopOrderDate(new Date());
			System.out.println("member1: " + member1);
			sCart.setMember(member1);
			
			return sCartService.insert(sCart);
			
		}
	
	
}
