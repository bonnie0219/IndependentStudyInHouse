package tw.InHouse.echarts;

public class Revenue {
       private int revenue;
       private String date;
	
       public Revenue() {
	   }

	   public Revenue(int revenue, String date) {
		this.revenue = revenue;
		this.date = date;
	   }

	   public int getRevenue() {
		  return revenue;
	   }

	   public void setRevenue(int revenue) {
		  this.revenue = revenue;
	   }

	   public String getDate() {
		  return date;
	   }
	
	   public void setDate(String date) {
	      this.date = date;
	   }
       
       
}
