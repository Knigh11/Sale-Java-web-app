<%@page import="bean.dnadminbean"%>
<%@page import="bean.khachhangbean"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="bean.giobean"%>
<%@page import="bean.giobean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.cfbo"%>
<%@page import="java.util.ArrayList"%>

<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.cfbean"%>
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
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
<!-- owl stylesheets -->
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<!--  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen">
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

.btn-action-1+.btn-action-1 {
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

.search2 {
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

.QL {
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
	<%
	dnadminbean ad = (dnadminbean) session.getAttribute("admin");
	ArrayList<cfbean> dssp = (ArrayList<cfbean>) session.getAttribute("dssanpham");
	ArrayList<loaibean> loai = (ArrayList<loaibean>) session.getAttribute("dshang");
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	%>



	<!--header section start -->
	<div class="header_section">
		<div class="container-fluid">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="logo">
					<a href="index.html"><img src="images/logo.png"></a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="admin">Home</a>
						</li>
						<li>
							<%
							if (session.getAttribute("admin") == null) {
							%> <a class="nav-link" href="dnadmin"><span
								class="glyphicon glyphicon-user"></span>Log In</a> <%
							 } else {
							 %> <a class="nav-link" href="#"><span
															class="glyphicon glyphicon-user"> <%
							 dnadminbean kh = (dnadminbean) session.getAttribute("admin");
							 out.print("hello " + kh.getTenDangNhap());
							 %>
														</span> </a> <%
							 }
							 %>
						</li>
						<li class="nav-item"><a class="nav-link" href="xoaadmin.jsp"><i
								class="fa fa-sign-out" style="font-size: 24px"></i></a></li>

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
		<div style="width: 1326px; margin: 0px 20px;">
			<!-- menu -->
			<div class="about_section layout_padding">
				<div class="container">
					<div class="QL">
						<a class="nav-link" href="loai">Quản lý loại</a> <a
							class="nav-link" href="sanpham">Quản lý cafe</a> <a
							class="nav-link" href="xacnhanadmin">Xác Nhận Chuyển Tiền</a> <a
							class="nav-link" href="dschuyentien">danh sách chuyển tiền</a>
					</div>
				</div>
				<!-- end menu -->
				<!-- hienthi ds -->
				<div
					style="padding: 20px 0px;">
					<div class="row d-flex">
						<div class="col-8">
							<table class="table-responsive overflow-auto"
								style="width: auto; max-height: 525px; text-align: center;">
								<tr style="width: 800px; border: 1px solid">
									<td style="width: 800px" colspan="5">Danh Sách Sản Phẩm</td>
								</tr>
								<tr>
									<td style="width: 100px; border: 1px solid">Mã Sản Phẩm</td>
									<td style="width: 600px; border: 1px solid">Ảnh</td>
									<td style="width: 400px; border: 1px solid">Tên Sản Phẩm</td>
									<td style="width: 150px; border: 1px solid">Mã loại</td>
									<td style="width: 100px; border: 1px solid">Số lương</td>
									<td style="width: 100px; border: 1px solid">Giá</td>
									<td style="width: 100px; border: 1px solid"></td>
									<td style="width: 100px; border: 1px solid"></td>
								</tr>
								<%
								for (cfbean sp : dssp) {
								%>
								<tr>
									<form method="post"
										action="sanpham?update2=<%=sp.getMacafe()%>">
										<td style="width: 100px; border: 1px solid"><%=sp.getMacafe()%></td>
										<td style="width: 600px; border: 1px solid"><img
											src="<%=sp.getAnh()%>" alt="" class="img-fluid img-thumbnail"></td>
										<td style="width: 400px; border: 1px solid"><input
											style="width: 150px;" type="text" name="ten"
											value="<%=sp.getTencafe()%>" class="input-quantity" /></td>
										<td class="nice-select"
											style="width: 200px; border: 1px solid"><select
											name="ml" style="border: 1px solid;">
												<option>--Loại--</option>
												<%
												for (loaibean cate : loai) {
												%>
												<option value="<%=cate.getMaLoai()%>"
													<%=(cate.getMaLoai().equals(sp.getMaLoai())) ? "selected" : ""%>>
													<%=cate.getTenLoai()%>
												</option>
												<%
												}
												%>
										</select></td>
										<td style="width: 100px; border: 1px solid"><input
											style="width: 50px;" type="text" name="sl"
											value="<%=sp.getSoLuong()%>" class="input-quantity" /></td>
										<td style="width: 50px; border: 1px solid"><input
											style="width: 100px;" type="text" name="gia"
											value="<%=sp.getGia()%>" class="input-quantity" /></td>
										<td><input style="" type="submit" name="submit"
											value="Cập nhật" /></td>
									</form>
									<td style="border: 1px solid"><a
										href="sanpham?xoa=<%=sp.getMacafe()%>&url=<%=sp.getAnh()%>">XOÁ</a></td>
								</tr>
								<%
								}
								%>
							</table>
						</div>
						<!-- them san pham -->
						<%
						cfbean sanpham = (session.getAttribute("sanpham") != null) ? (cfbean) session.getAttribute("sanpham") : new cfbean();
						%>
						<div class="col-4"
							style="width: 500px; ">
							<div style="width: 500px; min-height: 400px; position: relative;">
								<div
									style="width: 500px; min-height: 400px; position: absolute; top: 0;">
									<form action="upcf" enctype="multipart/form-data" method="post"
										onsubmit="return validateForm()">
										Mã Sản Phẩm: <input
											style="margin-bottom: 20px; margin-left: 14px; width: 370px; text-align: right;"
											type="text" name="txtmsp"
											value="<%=(session.getAttribute("sanpham") != null) ? sanpham.getMacafe() : ""%>">
										<br> Tên Sản Phẩm: <input
											style="margin-bottom: 20px; margin-left: 10px; width: 370px; text-align: right;"
											type="text" name="txttensp"
											value="<%=(session.getAttribute("sanpham") != null) ? sanpham.getTencafe() : ""%>">
										<br>
										<div class="d-flex">
											<label style="margin-right: 60px;"> Mã Loại: </label> <select
												name="txtmh"
												style="margin-bottom: 20px; margin-left: 46px; width: 370px; text-align: right;">
												<option value="">--Loại--</option>
												<%
												for (loaibean cate : loai) {
												%>
												<option value="<%=cate.getMaLoai()%>">
													<%=cate.getTenLoai()%>
												</option>
												<%
												}
												%>
											</select>
										</div>

										<br> Số lượng: <input
											style="margin-bottom: 20px; margin-left: 50px; width: 370px; text-align: right;"
											type="number" min="0" required name="txtsl"
											value="<%=(session.getAttribute("sanpham") != null) ? sanpham.getSoLuong() : ""%>">
										<br> Giá: <input
											style="margin-bottom: 20px; margin-left: 80px; width: 370px; text-align: right;"
											type="number" min="0" required name="txtgia"
											value="<%=(session.getAttribute("sanpham") != null) ? sanpham.getGia() : ""%>">
										<br> file: <input type="file" name="txtfile"
											onchange="previewImage(event)" accept="image/*"> <br>
										<div class="mb-3 text-center">
											<img id="imagePreview" src="#" alt="" class="img-thumbnail"
												style="display: none; max-width: 300px; height: auto;">
										</div>
										<input type="submit" name="them" value="Lưu"
											style="margin-top: 10px; margin-right: 32px; margin-left: 116px; padding: 4px 16px;">
									</form>
								</div>
							</div>
						</div>

					</div>
					

				</div>
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
	<div class="footer_section layout_padding" style="margin-top: 200px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<h3 class="useful_text">About</h3>
					<p class="footer_text">consectetur adipiscing elit, sed do
						eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
						enim ad minim veniam, quis nostrud exercitation u</p>
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
					<p class="dummy_text">Adipiscing Elit, sed do Eiusmod Tempor
						incididunt</p>
				</div>
				<div class="col-lg-3 col-sm-6">
					<h1 class="useful_text">Contact Us</h1>
					<div class="location_text">
						<ul>
							<li><a href="#"> <i class="fa fa-map-marker"
									aria-hidden="true"></i><span class="padding_left_10">Address
										: Loram Ipusm</span>
							</a></li>
							<li><a href="#"> <i class="fa fa-phone"
									aria-hidden="true"></i><span class="padding_left_10">Call
										: +01 1234567890</span>
							</a></li>
							<li><a href="#"> <i class="fa fa-envelope"
									aria-hidden="true"></i><span class="padding_left_10">Email
										: demo@gmail.com</span>
							</a></li>
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
	<script type="text/javascript">
		function previewImage(event) {
			const reader = new FileReader();
			reader.onload = function() {
				const preview = document.getElementById('imagePreview');
				preview.src = reader.result;
				preview.style.display = 'block';
			};
			reader.readAsDataURL(event.target.files[0]);
		}
		function validateForm() {
			var ma = document.getElementsByName("txtmsp")[0].value;
			var ten = document.getElementsByName("txttensp")[0].value;
			var maloai = document.getElementsByName("txtmh")[0].value;
			var file = document.getElementsByName("txtfile")[0].value;

			if (ma == "" || ten == "" || maloai == "" || file == "") {
				alert("Vui lòng điền đầy đủ thông tin");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>