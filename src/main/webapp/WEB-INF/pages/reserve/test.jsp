<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <title>Page Title</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script type = "text/javascript">
         $(document).ready(function () {
             var reserve = {};
             $('#btnAddReserve').click(function () {
                reserve.reserve_memberid = $('#reserve_memberid').val();
                reserve.reserve_Date = $('#reserve_Date').val();
                reserve.reserve_branch = $('#reserve_branch').val();
                reserve.reserve_style= $('#reserve_style').val();
                reserve.reserve_q1=$("input:radio[name=reserve_q1]:checked").val();
                reserve.reserve_q2=$("input:radio[name=reserve_q2]:checked").val();
                reserve.reserve_q3=$("input:radio[name=reserve_q3]:checked").val();
                reserve.reserve_q4=$("input:radio[name=reserve_q4]:checked").val();
                reserve.reserve_q5=$("input:radio[name=reserve_q5]:checked").val();
                 var reserveJSON = JSON.stringify(reserve);
                 console.log(reserveJSON);
                 $.ajax({
                     url: 'http://localhost:8081/reserve/add',
                     method: 'POST',
                     data: reserveJSON,
                     contentType: "application/json; charset=utf-8",
                     success: function () {
                         alert('Saved successfully!');
                     },
                     error: function (error) {
                         alert('錯誤',error);
                     }
                 })  
             })
         });
      </script>
      
   </head>
   <body>
  
      <table>
        <tr>
            <td>1. 客戶_ID</td>
            <td><input type="text"  class="form-control form-control-sm" style="width: 200px; height: 30PX;" name="reserve_memberid" id="reserve_memberid" ></td>
        </tr>
        <tr>
            <td>2. 預約日期</td>
            <td><input type="date" class="form-control" style="width: 200px"  name="reserve_Date" id="reserve_Date"></td>
        </tr>
        <tr>
            <td>3. 預約分店</td>
            <td>
                <select class="form-control form-control-sm" style="width: 200px" name="reserve_branch" id="reserve_branch">
                    <option>中壢分店</option>
                    <option>基隆分店</option>
                    <option>台中分店</option>
                    <option>高雄分店</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>4. 偏好風格</td>
            <td>
                <select class="form-control form-control-sm" style="width: 200px" name="reserve_style" id="reserve_style">
                    <option>簡約風</option>
                    <option>工業風</option>
                    <option>北歐風</option>
                    <option>古典風</option>
                    <option>自然風</option>
                    <option>現代風</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Q1 要進行改造的空間是否為10坪以上？(室內面積，不含陽台)</td>
            <td><div class="form-check">
                <input class="form-check-input" type="radio" name="reserve_q1" id="exampleRadios2"
                    value="1">
                <label class="form-check-label" for="exampleRadios2">YES</label>
                <br>
                <input class="form-check-input" type="radio" name="reserve_q1" id="exampleRadios2"
                    value="2">
                <label class="form-check-label" for="exampleRadios2">NO</label>
            </div>
        </td>
        </tr>
        <tr>
            <td>Q2 該空間是否沒有違章搭建(或有意願拆除)？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q2" id="exampleRadios2"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q2" id="exampleRadios2"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
                    <br>
                </div>
            </td>
        </tr>
        
        <tr>
            <td>Q3 工程及家具預算是否超過60萬元？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q3" id="exampleRadios2"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q3" id="exampleRadios2"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
            </td>
        </tr>
        <tr>
            <td>Q4 是否能接受將有室裝審查與場勘丈量約6~10萬元的費用？</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q4" id="exampleRadios2"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q4" id="exampleRadios2"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
                </div>
            </td>
        </tr>
        <tr>
            <td>Q5 裝潢預計日期是否大於3個月?</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reserve_q5" id="exampleRadios2"
                        value="1">
                    <label class="form-check-label" for="exampleRadios2">YES</label>
                    <br>
                    <input class="form-check-input" type="radio" name="reserve_q5" id="exampleRadios2"
                        value="2">
                    <label class="form-check-label" for="exampleRadios2">NO</label>
            </td>
        </tr>
        <tr>
            <td> <div class="form-group">
                <input type="submit" id="btnAddReserve" value="SUBMIT" class="btn btn-secondary py-3 px-4">
              </div>
                </td>
        </tr>
    </table>
   </body>
</html>