package tw.InHouse.order_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.InHouse.member_model.Member;
import tw.InHouse.order_model.ShopCart;
import tw.InHouse.order_model.ShopCartOrderItem;
import tw.InHouse.order_model.ShopCartOrderItemService;
import tw.InHouse.order_model.ShopCartService;

@Controller
@RequestMapping(path = "/backend/shopcart")
public class ShopCartController {
	
	@Autowired
	private ShopCartService sCartService;
	
	@Autowired
	private ShopCartOrderItemService sCartOrderItemService;
	
	//導向後端ORDER的CONTROLLER並取得所有購物車資訊
	@GetMapping(path = "/shopcarlist.controller")
	public String processShopCarMainAction(Model m) {
		List<ShopCart> allOrder = sCartService.findAll();
		m.addAttribute("allOrder",allOrder);
		return "order/AllOrder";
	}
//	@GetMapping(path = "/shopcarorderproduct.controller")
//	public String processShopCarAction(@RequestParam(name = "pid")int pid, Model m) {
//		m.addAttribute("pid",pid);
//		return "shopcart/shopCarOrderProduct";  
//		
//	}
	
	//insert shopcart table
//	@PostMapping(path = "/shopcarinsert.controller")
//	@ResponseBody										
//	public ShopCart processShopCarInsert(ShopCart sCart, String cartItem, int pdtotalprice) throws JSONException {
//		System.out.println(cartItem);
//		ArrayList<ShopCartOrderItem> itemsSet = new ArrayList<ShopCartOrderItem>();
//		
//		//傳形成json array
//		JSONArray jsonArray = new JSONArray(cartItem); 
//		
//		for(int i = 0; i<jsonArray.length(); i++) {
//			
//			//取得json array的每筆資料
//			JSONObject jsonObject = jsonArray.getJSONObject(i);
//			
//			//透過optString("對應的欄位名稱")取得值
//			String id = jsonObject.optString("id");
//			String orderdetail_productname = jsonObject.optString("name");
//			int orderdetail_productprice = Integer.parseInt(jsonObject.optString("price"));
//			int orderdetail_productcount = Integer.parseInt(jsonObject.optString("qty"));
//			//檢查jsonObject裡面的值
//			System.out.println("id: "+ id + "productname: " + orderdetail_productname + "productprice: " + orderdetail_productprice + "productcount: " + orderdetail_productcount);
//			//new ShopCartOrderItem(javaBean物件)，因為@oneToMany只能使用LIST或是SET型別的資料型態
//			//若使用HASHSET 當傳入重複的KEY值時，會將錢一筆資料覆蓋，所以這邊使用LIST型態去接取多筆相同KEY值傳入的資料
//			ShopCartOrderItem sitem = new ShopCartOrderItem(orderdetail_productname,orderdetail_productprice,orderdetail_productcount);
//			itemsSet.add(sitem);
//		}
//		//檢查LIST是否有成功新增1筆以上的ShopCartOrderItem->ArrayList<ShopCartOrderItem>物件
//		System.out.println(itemsSet.size());
//		//將ArrayList<ShopCartOrderItem>塞入SHOPCART 物件做關聯關係(因為是單向關係所以只需要在SHOPCART端設定)
//		sCart.setShopCartOrderItem(itemsSet);
//		sCart.setOrder_productToTalPrice(pdtotalprice);
//		sCart.setOrder_shopOrderDate(new Date());
//		
//		return sCartService.insert(sCart);
//		
//	}
	
	
	
	// backSystemUseSelect 查詢單筆
	@PostMapping(path = "/shopcarquery.controller/{shopcarid}")
	@ResponseBody
	public ShopCart processShopCarFindById(@PathVariable(name = "shopcarid")int shopcarid) {
		return sCartService.findById(shopcarid);
	}
	
	// backSystemUseSelect 查詢全部
	@PostMapping(path = "/shopcarqueryall.controller")
	@ResponseBody
	public List<ShopCart> processShopCarFindAll(){
		return sCartService.findAll();
	}
	
	//後端新增
	@PostMapping(path = "/add")
	@ResponseBody
	public ShopCart processAddAction(@RequestBody ShopCart s) {
		return sCartService.insert(s);
	}
	//更新
	@PostMapping("/update/{id}")
	@ResponseBody
	public ShopCart update(@RequestBody ShopCart s, @PathVariable Integer id) {
		return sCartService.upadate(s);
	}
	//刪除
	@PostMapping("/delete/{id}")
	@ResponseBody
	public void processdeleteAction(@PathVariable Integer id) {
		sCartService.deleteShopCart(id);
	}
	//取得SHOPCARTID對應到的SHOPCAERTORDERITEM
	@PostMapping("/shopcartDetail")
	@ResponseBody
	public List<ShopCartOrderItem> processGetOrderDetail(String shopcartid) {
		System.out.println("進來查詢");
		
		List<ShopCartOrderItem> thisDetail = sCartOrderItemService.findByShopCartOrderItemDetail(Integer.parseInt(shopcartid));		
		return thisDetail;
	}
	//取得後端訂單細項SHOPCARTID對應到的MEMBERID
	@PostMapping("/getmemberid")
	@ResponseBody
	public int processGetMemberid(int shopcartid){
		System.out.println("進來拿memberid");
		ShopCart allOrder = sCartService.findById(shopcartid);
		Member member = allOrder.getMember();
		int memberid = member.getMember_id();
//		System.out.println(memberid);
		return memberid;
	}
}