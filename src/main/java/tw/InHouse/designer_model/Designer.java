package tw.InHouse.designer_model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity 
@Table(name = "designer",
     uniqueConstraints = {
//        @UniqueConstraint(name = "designer_UK", columnNames = "designer_name"),
		@UniqueConstraint(name = "designer_UK1", columnNames = "designer_email")})
public class Designer {
	   @Id
	   @GeneratedValue(strategy = GenerationType.IDENTITY)
	   @Column(name = "designer_id", nullable = false)
       private int designer_id;
	   @Column(name = "designer_name", nullable = false)
       private String designer_name;
	   @Column(name = "designer_phone", nullable = false)
       private String designer_phone;
	   @Column(name = "designer_email", nullable = false)
       private String designer_email;
	   @Column(name = "designer_style", nullable = false)
       private String designer_style;
	   @Column(name = "designer_location", nullable = false)
       private String designer_location;
	   @Column(name = "designer_photo", nullable = false)
	   private String designer_photo;
	   
	   public Designer() {
	   }
		
		public Designer(int designer_id, String designer_name, String designer_phone, String designer_email,
			String designer_style, String designer_location, String designer_photo) {
		super();
		this.designer_id = designer_id;
		this.designer_name = designer_name;
		this.designer_phone = designer_phone;
		this.designer_email = designer_email;
		this.designer_style = designer_style;
		this.designer_location = designer_location;
		this.designer_photo = designer_photo;
	    }
		
		public int getDesigner_id() {
			return designer_id;
		}
		public void setDesigner_id(int designer_id) {
			this.designer_id = designer_id;
		}
		public String getDesigner_name() {
			return designer_name;
		}
		public void setDesigner_name(String designer_name) {
			this.designer_name = designer_name;
		}
		public String getDesigner_phone() {
			return designer_phone;
		}
		public void setDesigner_phone(String designer_phone) {
			this.designer_phone = designer_phone;
		}
		public String getDesigner_email() {
			return designer_email;
		}
		public void setDesigner_email(String designer_email) {
			this.designer_email = designer_email;
		}
		public String getDesigner_style() {
			return designer_style;
		}
		public void setDesigner_style(String designer_style) {
			this.designer_style = designer_style;
		}
		public String getDesigner_location() {
			return designer_location;
		}
		public void setDesigner_location(String designer_location) {
			this.designer_location = designer_location;
		}
		public String getDesigner_photo() {
			return designer_photo;
		}
		public void setDesigner_photo(String designer_photo) {
			this.designer_photo = designer_photo;
		}
	   
	   
}
