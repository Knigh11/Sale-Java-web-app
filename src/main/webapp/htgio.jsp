<%@page import="bean.khachhangbean"%>
<%@page import="bean.cfbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@page import="bean.giobean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.cfbo"%>

<%@page import="java.util.ArrayList"%>

<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@page import="bean.cfbean"%>
<%@page import="dao.cfdao"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
         <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Grand Coffee</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <!-- owl stylesheets --> 
      <link rel="stylesheet" href="css/owl.carousel.min.css">
      <link rel="stylesheet" href="css/owl.theme.default.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
     	<style>
     		.htgio-img-title {
			width: 40px;
			height: 40px;
			object-fit: cover;
			border-radius: 50%;
		}
		
		.row-item {
			border: 1px solid #999;
			height: 50px;
		}
		
		.test {
			font-size: 24px;
			font-weight: 400;
			cursor: pointer;
			color: red;
		}
		.test:link {
			text-decoration: none;
		}
		
		.btn-action {
			display: flex;
			justify-content: center;
		}
		
		.btn-action-1 + .btn-action-1 {
			margin-left: 40px;
		}
		
		.btn-action-1 {
			font-size: 20px;
			color: black;
			border: 1px solid #111;
			border-radius: 6px;
			padding: 8px 12px;
			background: #f0f0f0;
			
		}
		
		.btn-action-1:hover {
			text-decoration: none;
			cursor: pointer;
			
		}
		
		.input-quantity {
			width: 42px;
			
		}
  		.search2	 {
  			    margin: 5px;
  		}
  		.but {
		  	padding-top: 3px;
		    padding-bottom: 3px;
		
		    
		    padding-left: 18px;
		    padding-right: 18px;
		    color: gray;
		    background: #f76d37;
  		}
  	
  	</style>
   </head>
   <body>
  <%giohangbo gh = (giohangbo) session.getAttribute("gio");
  khachhangbean kh = (khachhangbean) session.getAttribute("kh"); %>
      <!--header section start -->
<div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <div class="logo"><a href="home"><img src="images/logo.png"></a></div>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item">
                        <a class="nav-link" href="home">Home</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="giohang">Cart ( <%=gh.count() %> )
                        </a>
                       
			      
                     </li>
                    
                     <li class="nav-item">
                        <a class="nav-link" href="lichsu">History</a>
                     </li>
                     <li>
                       <form class="search2" action="home">
					      <input type="text" placeholder="Search." name="search" value="<%=request.getParameter("search") == null ? " " : request.getParameter("search")%>">
					      <button class="but" type="submit"><i class="fa fa-search"></i></button>
					    </form>
					 </li>
					<li>
					
			      <% if (session.getAttribute("kh") == null){ %>
			    	 <a  class="nav-link" href="ktdn">Log In</a>
			      <%}else{ %>
			    	 <a class="nav-link" href="#"><span class="glyphicon glyphicon-user"> </span>
			    	 	<%=kh.getHoten() %>
			    	 </a>
			      <%} %>
			      
			      </li>
			        <li><a class="nav-link" href="remove.jsp"><i class="fa fa-sign-out" style="font-size:24px"></i></a></li>
                  </ul>
                  
					  
                    
               </div>
            </nav>
         </div>
      </div>
      <!--header section end -->
     
      <!-- banner section end -->
     	 <!--hiển thị-->	
       
      <div class="about_section layout_padding">
         <div  style="text-align: center;margin-left: 380px">
       		<h1 style="margin-right: 300px;  font-size: 68px; color: #f76d37">Cart</h1>
	   		 <div>
			  <table width="800" style="padding: 0 25px; text-align: center;" >
		    	<tr>
		    		<td></td>
		    		<td></td>
		    		<td>Tên sản phẩm</td>
		    		<td>Số lượng</td> 	
		    		<td>Giá</td>
		    		<td>Thành tiền</td>
		    	</tr>
		   		<%	
		   			
		   			long tongTien = 0;
		   			if (gh.ds.size() == 0){%>
		   				
						<h3 style="text-align: center; margin-right: 380px">không có sản phẩm</h3>
					<% }%>
		   			
		   			<%for (giobean item: gh.ds){ 
		   				tongTien += item.getThanhtien();	
		   			%>
		   				<tr class="row-item">
		   					<td>
			   					<input type="checkbox" name="delete" form="form-1" value="<%=item.getMacafe()%>"/>
			   				</td>
		   					<td>
		   						<img src="<%=item.getAnh()%>" class="htgio-img-title"/> 
			   				</td>
			   				<td>
			   					<%=item.getTencafe() %>
			   				</td>
			   				<td>
			   					<form method="post" action="giohang?mcf2=<%=item.getMacafe()%>">
			   						<input type="number" name="quantity" min="1" value="<%=item.getSoLuong()%>" class="input-quantity"/>
			   						
			   						<input type="submit" name="submit" value="Cập nhật"/>
			   					</form>
			   				</td>
			   				<td>
			   					<%= java.text.NumberFormat.getInstance().format(item.getGia()) %> Đ
			   				</td>
			   				<td>
			   					<%= java.text.NumberFormat.getInstance().format(item.getThanhtien()) %>Đ
			   				</td>
			   				<td>
			   					<a class="test" href="giohang?mcf=<%=item.getMacafe() %>&remove=1">&times</a>
			   				</td>
			   				
			   				
		   				</tr>
		   			<%}%>
		   			<tr>
		   				<td style="font-size: 24px; font-weight: bold;" colspan="2">Tổng tiền: </td>
		   				<td style="font-size: 24px; font-weight: bold"><%=tongTien %>Đ</td>
		   				<td>
		   					<form id="form-1" method="post" action="giohang?suanhieu=true&">
		   						<input   type="submit" value="Xóa đã chọn"/>
		   					</form>
		   				</td>
		   			</tr>
	   		 </table>
		</div>
		<div style="margin-top: 30px; margin-bottom: 30px; margin-right: 300px" class="btn-action">
		<a class="btn-action-1" href="giohang?removeall=true">Trả lại toàn bộ</a>
		<a class="btn-action-1" href="home">Tiếp tục mua hàng</a>
		<a class="btn-action-1" href="thanhtoan">Thanh toán</a>
	</div>
         </div>
      </div>
     
		
			
		
       	       	
          <!-- end hiển thị -->
      <!-- gallery section end -->
      
      
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-lg-3 col-sm-6">
                  <h3 class="useful_text">About</h3>
                  <p class="footer_text">consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation u</p>
               </div>
               <div class="col-lg-3 col-sm-6">
                  <h3 class="useful_text">Menu</h3>
                  <div class="footer_menu">
                     <ul>
                        <li><a >Home</a></li>
                        <li><a >Giỏ hàng</a></li>
                        <li><a >Services</a></li>
                        <li><a >Contact Us</a></li>
                     </ul>
                  </div>
               </div>
               <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text">Useful Link</h1>
                  <p class="dummy_text">Adipiscing Elit, sed do Eiusmod Tempor incididunt </p>
               </div>
               <div class="col-lg-3 col-sm-6">
                  <h1 class="useful_text">Contact Us</h1>
                  <div class="location_text">
                     <ul>
                        <li>
                           <a href="#">
                           <i class="fa fa-map-marker" aria-hidden="true"></i><span class="padding_left_10">Address : Loram Ipusm</span>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                           <i class="fa fa-phone" aria-hidden="true"></i><span class="padding_left_10">Call : +01 1234567890</span>
                           </a>
                        </li>
                        <li>
                           <a href="#">
                           <i class="fa fa-envelope" aria-hidden="true"></i><span class="padding_left_10">Email : demo@gmail.com</span>
                           </a>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
     
      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>     
   </body>
</html>