<%@page import="bo.giohangbo"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bean.cfbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%@page import="bo.loaibo"%>
<%@page import="bo.cfbo"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@page import="bean.cfbean"%>
<%@page import="dao.cfdao"%>
<%

giohangbo gh = (giohangbo) session.getAttribute("gio");
khachhangbean kh = (khachhangbean) session.getAttribute("kh");
@SuppressWarnings("unchecked")
ArrayList<cfbean> ds = (ArrayList<cfbean>) request.getAttribute("ds");
int trang;
int totalPage = (ds.size() + 9) / 10; // Tổng số trang
%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- basic -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coffee Shop</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>
<style>
.card-img-wrapper {
	height: 200px; /* Đặt chiều cao cố định cho hình ảnh */
	overflow: hidden; /* Ẩn phần vượt ra ngoài */
	display: flex;
	justify-content: center;
	align-items: center;
}

.card-img-top {
	height: 100%;
	width: 100%;
	object-fit: cover; /* Đảm bảo ảnh bao phủ toàn bộ diện tích */
}
/* Màu mặc định cho text */
.navbar .nav-link.text-custom {
	color: white; /* Màu trắng */
	transition: color 0.3s ease; /* Hiệu ứng mượt khi thay đổi màu */
}

/* Hiệu ứng hover */
.navbar .nav-link.text-custom:hover {
	color: #f76d37; /* Màu cam khi hover */
}

/* Đảm bảo nút "Log In" hoặc icon logout cũng thay đổi */
.navbar .nav-link.text-custom i {
	color: white; /* Mặc định là trắng */
}

.navbar .nav-link.text-custom:hover i {
	color: #f76d37; /* Đổi sang cam khi hover */
}
</style>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-black">
		<div class="container-fluid">
			<a class="navbar-brand" href="home"> <img src="images/logo.png"
				alt="Logo" height="50">
			</a>
			<button class="navbar-toggler bg-light" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link text-custom"
						href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link text-custom"
						href="giohang"> Cart <%=(gh != null && gh.count() > 0) ? "(" + gh.count() + ")" : ""%>
					</a></li>
					<li class="nav-item"><a class="nav-link text-custom"
						href="lichsu">History</a></li>
				</ul>
				<form class="d-flex" action="home" method="get">
					<input class="form-control me-2" type="search" name="search"
						placeholder="Search"
						value="<%=request.getParameter("search") == null ? "" : request.getParameter("search")%>">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item">
						<%
						if (kh == null) {
						%> <a class="nav-link text-custom" href="ktdn">Log
							In</a> <%
					 } else {
					 %> <a class="nav-link text-custom" href="#"><i
												class="fas fa-user"></i> <%=kh.getHoten()%></a> <%
					 }
					 %>
					</li>
					<li class="nav-item"><a class="nav-link text-custom"
						href="remove.jsp"><i class="fas fa-sign-out-alt"></i></a></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Main Content -->
	<div class="container py-4">
		<h1 class="text-center" style="color: #f76d37; font-size: 3rem;">Sản phẩm</h1>
		<div class="row">
			<%
			trang = (int) request.getAttribute("trang");
			int start = (trang - 1) * 10;
			int end = trang * 10;
			if (trang == ds.size() / 10 + 1) {
			  if (ds.size() % 10 != 0)
			    end = (trang - 1) * 10 + ds.size() % 10;
			}
			if (ds.isEmpty()) {
			%>
			<h3 class="text-center">Không có sản phẩm cần tìm</h3>
			<a href="home" class="btn btn-primary mx-auto">Quay lại trang chủ</a>
			<%
			} else {
			for (int i = start; i < end; i++) {
			  cfbean s = ds.get(i);
			%>
			<div class="col-md-4 col-lg-3 mb-4">
				<div class="card shadow-sm">
					<div class="card-img-wrapper">
						<img src="<%=s.getAnh()%>" class="card-img-top img-fluid"
							alt="<%=s.getTencafe()%>">
					</div>
					<div class="card-body text-center">
						<h5 class="card-title"><%=s.getTencafe()%></h5>
						<%
						    DecimalFormat df = new DecimalFormat("#,###");
						    String formattedPrice = df.format(s.getGia());
						%>
						<p class="card-text text-muted"><%=formattedPrice%> Đ</p>
						<a
							href="giohang?add=true&mcf=<%=s.getMacafe()%>&ten=<%=s.getTencafe()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>"
							class="btn btn-primary">Add to cart</a>
					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>


	<!-- Pagination -->
	<nav>
		<ul class="pagination justify-content-center">
			<%
			for (int i = 1; i <= totalPage; i++) {
			%>
			<li class="page-item <%=(trang == i) ? "active" : ""%>"><a
				class="page-link" href="home?trang=<%=i%>"><%=i%></a></li>
			<%
			}
			%>
		</ul>
	</nav>
	
	<!-- Footer -->
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>