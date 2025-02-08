<%@page import="bean.dnadminbean"%>
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
  		.QL{
  		
  		 	display: flex;
  		 	justify-content: center;
  	
  		}
  		.nav-link {
  
    font-size: 20px;
}

		.about_section {
		    margin-top: -59px;
		}
		.input-quantity {
    width: 196px;
}

  	</style>
   </head>
   <body>
   <%ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai"); 
   request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");%>
   

      <!--header section start -->
      <div class="header_section">
         <div class="container-fluid">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <div class="logo"><a href="index.html"><img src="images/logo.png"></a></div>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item">
                        <a class="nav-link" href="admin">Home</a>
                     </li>
					 <li>
					
					      <% if (session.getAttribute("admin") == null){ %>
					    	 <a  class="nav-link" href="dnadmin"><span class="glyphicon glyphicon-user"></span>Log In</a>
					      <%}else{ %>
					    	 <a  a class="nav-link" href="#"><span class="glyphicon glyphicon-user">
					    	 	<% dnadminbean kh =(dnadminbean)session.getAttribute("admin");
						        out.print("hello "+ kh.getTenDangNhap()); %>
					    	 </a>
					      <%} %>
			      
			      </a></li>
                      <li class="nav-item">
                        <a class="nav-link" href="xoaadmin.jsp"><i class="fa fa-sign-out" style="font-size:24px"></i></a>
                     </li>
				
                  </ul>
                  
					  
                    
               </div>
            </nav>
         </div>
      </div>
      <!--header section end -->
      <!-- banner section start -->
     
      <!-- banner section end -->
      <!-- about section start -->
      <div class="about_section layout_padding">
         <div class="container">
          		<div class="QL">
          			 <a class="nav-link" href="loai">Quản lý loại</a>
          			 <a class="nav-link" href="sanpham">Quản lý cafe</a>
          			 <a class="nav-link" href="xacnhanadmin">Xác Nhận Chuyển Tiền</a>
          			 <a class="nav-link" href="dschuyentien">danh sách chuyển tiền</a>
          		</div>
         </div>
      <div class="view">
         <div style="margin-left: 50px">
         	<h3 style="font-size: 40px">Thêm loại	</h3>
		<table  width="1000" align="center"  style="padding: 0 15px"  border="1" >
				
			<form  method="post" action="loai">
					<label for="uname"><b>Nhâp mã</b></label>
					<br>
				    <input type="text" placeholder="Mã " name="txtma" value="">
					<br>
					<br>
				    <label for="psw"><b>Nhập tên </b></label>
				    <br>
				    <input type="text" placeholder="Nhập tên" name="txtten" required>	
				    <input type="submit" name="add" value="Thêm"/>
				    	
			</form>
		
		</table>	
		</div>
		<div>
	<h3 style="text-align: center; font-size: 40px">Danh sách loại</h3>
 <table  width="1000" align="center"  style="padding: 0 15px"  border="1" >
		    	<tr>
		    		
		    		<td style="color: darkorange;">Mã Loại</td>
		    		<td style="color: darkorange;">Tên Loại</td> 	
		    		<td style="color: darkorange;">Cập nhập </td>
		    		<td style="color: darkorange;">Xóa</td>
		    	</tr>
		    	<%
		    	for(loaibean o: loai){%>
		    	
				<tr>
		   			<form method="post" action="loai?ml=<%=o.getMaLoai()%>">
			   	
			   		<td width="300" >
			   			<%=o.getMaLoai() %>
			   		</td>
			   		<td width="300">
			   		<input type="text" name="ten2"  value="<%=o.getTenLoai()%>" class="input-quantity"/>
			   		</td>
			   		<td>
			   		<input type="submit" name="update" value="Cập nhật"/>
			   		</td>		
			   	</form>	
			   	
			   		<td><a href="loai?xoa=<%=o.getMaLoai()%>">XOÁ</a></td>
		   	</tr>
		   		<%} %>
	  </table>
	 </div>	
         </div>
         
      </div>
      <!-- about section end -->
      <!-- gallery section start -->
     
      <!-- services section start -->
      
      <!-- services section end -->
      <!-- testimonial section start -->
      
      <!-- testimonial section end -->
      <!-- contact section start -->
      
      <!-- contact section end -->
      <!-- footer section start -->
      <div class="footer_section layout_padding" style="    margin-top: 400px;">
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
                        <li><a href="index.html">Home</a></li>
                        <li><a href="about.html">About Us</a></li>
                        <li><a href="gallery.html">Gallery</a></li>
                        <li><a href="services.html">Services</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
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