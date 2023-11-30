<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Information</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/bootstrap4/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/usertemplate/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/categories_styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/categories_responsive.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/usertemplate/styles/custom.css">
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/usertemplate/styles/infor.css">
</head>

<body>

	<div class="super_container">

		<!-- Header -->

		<header class="header trans_300">

			<!-- Top Navigation -->

			<div class="top_nav">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="top_nav_left">Miễn phí vận chuyển mọi đơn hàng</div>
						</div>
						<div class="col-md-6 text-right">
							<div class="top_nav_right">
								<ul class="top_nav_menu">

									<!-- Currency / Language / My Account -->

									<li class="currency1">Hotline 0868774090
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Main Navigation -->

			<div class="main_nav_container">
				<div class="container">
					<div class="row">
						<div class="col-lg-12 text-right">
							<div class="logo_container">
								<a href="/index">golden<span>feet</span></a>
							</div>
							<nav class="navbar">
								<ul class="navbar_menu">
									<li><a href="/index">Trang chủ</a></li>
									<li><a href="/index">Mua sắm</a></li>
									<li><a href="/index">liên hệ</a></li>
								</ul>
								<c:choose>
									<c:when test="${empty sessionUsername}">
										<div class="">
											<a class="login1" href="/login?urlReturn=detail?idProduct=${sanPham.maGiay }">Đăng nhập</a> <span>
												| </span> <a class="login1" href="/register">Đăng ký</a>
										</div>
										<ul class="navbar_user">
											<li class="checkout"><a
												href="/shopping-cart"> <i
													class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:when>
									<c:otherwise>
										<ul class="navbar_user">
											<div class="dropdown">
												<i onclick="myFunction()" class="fa fa-user dropbtn "
													aria-hidden="true">Hi, ${sessionUsername}</i>
												<div id="myDropdown" class="dropdown-content">
												    <a style="text-align: center;"
                                                        href="/information?tag=hoSo">Hồ sơ</a>
                                                    <a style="text-align: center;"
                                                        href="/information?tag=doiMatKhau">Đổi mật khẩu</a>
                                                    <a style="text-align: center;"
                                                        href="/information?tag=donMua">Đơn hàng</a>
													<a style="text-align: center;"
														href="/logout">Đăng xuất</a>
												</div>
											</div>
											<li class="checkout"><a
												href="/shopping-cart?maGioHang=maGioHang"> <i
													class="fa fa-shopping-cart" aria-hidden="true"></i> <span
													id="checkout_items" class="checkout_items">${tongSoLuongGioHang}</span>
											</a></li>
										</ul>
									</c:otherwise>
								</c:choose>
								<div class="hamburger_container">
									<i class="fa fa-bars" aria-hidden="true"></i>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
	</div>
	</header>
	<div class="fs_menu_overlay"></div>
	<div class="container1">
        <input type="hidden" id="changePassSuccess">
        <input type="hidden" id="status" value="${status}">
        <input type="hidden" id="clickElement" value="${tag}">
		<div class="sidebar-left row">
            <div class="col-3">
                <div class="sidebar show">
                    <div class="sidebar-header">
                        <p class="sidebar-header-name">${user.taiKhoan}</p>
                        <span id="titleInformation" class="sidebar-header-update">
                            <i class="fa-solid fa-pen"></i><span>Sửa hồ sơ</span>
                        </span>
                    </div>
                    <ul class="nav first">
                        <li class="active" id="containerForm">
                            <a class="feat-btn" data-toggle="pill" data-target="#user-info" aria-selected="true">
                                <i class="fa fa-user"></i> Tài khoản của tôi<span class="fa fa-chevron-circle-up first"></span>
                            </a>
                            <ul class="feat-show nav">
                                <li class="feat-show-btn active first" id="hoSo">
                                    <a data-toggle="pill" data-target="#user-info" aria-selected="true">Hồ sơ</a>
                                </li>
                                <li class="feat-show-btn" id="doiMatKhau">
                                    <a data-toggle="pill" data-target="#user-pass" aria-selected="false">Đổi mật
                                        khẩu</a>
                                </li>
                            </ul>
                        </li>
                        <li id="donMua">
                            <a class="feat-btn feat-btn-test" data-toggle="pill" data-target="#user-cart"
                               aria-selected="false">
                                <i class="fa fa-shopping-cart"></i> Đơn mua
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-9">
                <div class="tab-content" id="v-pills-tabContent">
                    <!-- Hồ sơ -->
                    <div class="tab-pane fade fade show first active" id="user-info">
                        <div class="user-info-head">
                            <p class="head-title">Hồ sơ của tôi</p>
                            <span class="head-text">Quản lý thông tin hồ sơ để bảo mật tài khoản</span>
                            <hr>
                        </div>
                        <div class="user-info-body">
                            <form>
                                <div class="form-group row">
                                    <div class="col-3">
                                        <label for="exampleInputUserName">Tên đăng nhập:</label>
                                    </div>
                                    <div class="col-6">
                                        <span id="exampleInputUserName">${user.taiKhoan}</span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-3">
                                        <label for="exampleInputName">Họ Và Tên:</label>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" class="form-control" name="tenKhachHang" id="exampleInputName"
                                            placeholder="Nhập họ và tên" value="${user.tenKhachHang}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-3">
                                        <label for="exampleInputUserPhone">Số điện thoại:</label>
                                    </div>
                                    <div class="col-6">
                                        <input type="text" name="soDienThoai" class="form-control" id="exampleInputUserPhone"
                                            placeholder="Nhập số điện thoại" value="${user.soDienThoai}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-3">
                                        <label for="address">Địa chỉ:</label>
                                    </div>
                                    <div class="col-6">
                                        <textarea class="form-control" id="address" name="diaChi" rows="3" cols="50">${user.diaChi}</textarea>
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <div class="col-3">
                                    </div>
                                    <div class="col-6">
                                        <button formaction="/information/save" formmethod="post"
                                                class="btn btn-primary btnCustom">Lưu
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Change password -->
                    <div class="tab-pane fade" id="user-pass">
                        <div class="user-pass-head">
                            <p class="head-title">Đổi mật khẩu</p>
                            <span class="head-text">Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người
                                khác</span>
                            <hr>
                        </div>
                        <div class="user-pass-body">
                            <form>
                                <div class="form-group row">
                                    <div class="col-3 text-right">
                                        <label for="currentPass">Mật khẩu hiện tại:</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="password" name="currentPassword" class="form-control"
                                               value="${currentPassValue}" id="currentPass" required="required"
                                               placeholder="Nhập mật khẩu hiện tại">
                                        <c:if test = "${errorPass}">
                                            <small class="text-danger"><i>Sai mật khẩu</i></small>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-3 text-right">
                                        <label for="newPassword">Mật khẩu mới:</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="password" name="newPassword" value="${newPassValue}"
                                               placeholder="Nhập mật khẩu mới" id="newPassword"
                                               class="form-control"
                                               title="Mật khẩu bao gồm 8 ký tự, chữ in hoa, chữ cái thường và số"
                                               pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" required="required"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-3 text-right">
                                        <label for="confirmPassword">Xác nhận mật khẩu:</label>
                                    </div>
                                    <div class="col-4">
                                        <input type="password" name="confirmPassword" id="rePassword"
                                               required="required" value="${confirmPassValue}"
                                               placeholder="Xác nhận mật khẩu mới"
                                               class="form-control"/>
                                        <c:if test = "${errorConfirmPassword}">
                                            <small class="text-danger"><i>Nhập lại mật khẩu sai</i></small>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="form-group row ">
                                    <div class="col-3">
                                    </div>
                                    <div class="col-6">
                                        <button formaction="/information/change-password" formmethod="post"
                                                class="btn btn-primary btnCustom">Lưu
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Đơn hàng -->
                    <div class="tab-pane" id="user-cart">
                        <ol class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                    aria-controls="home" aria-selected="true">Tất cả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                                    aria-controls="profile" aria-selected="false">Chờ xác nhận</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                                    aria-controls="contact" aria-selected="false">Chờ lấy hàng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab2" data-toggle="tab" href="#contact2" role="tab"
                                    aria-controls="contact" aria-selected="false">Đang giao</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab3" data-toggle="tab" href="#contact3" role="tab"
                                    aria-controls="contact" aria-selected="false">Đã giao</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab4" data-toggle="tab" href="#contact4" role="tab"
                                    aria-controls="contact" aria-selected="false">Đã hủy</a>
                            </li>
                        </ol>
                        <form action="/information" method="get">
                            <div class="orderSearch">
                                <input type="hidden" name="tag" value="donMua">
                                <button class="btn"><i class="fa fa-search"></i></button>
                                <input autocomplete="off"
                                 name="orderId" placeholder="Tìm kiếm theo ID đơn hàng" value="">
                            </div>
                        </form>
                        <div class="tab-content tab-content-design" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <c:forEach var="item" items="${listTatCa}">
                                    <div class="idHomeCustom">
                                        <table class="table table-hover">
                                            <c:if test = "${item.donHang.trangThai}=='Đang giao'">
                                                <div class="row">
                                                    <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                    <div class="col-5 customDangGiao">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                             fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                                                            <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                                        </svg>
                                                        Đang giao
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test = "${item.donHang.trangThai}=='Đã huỷ'">
                                                <div class="row">
                                                    <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                    <div class="col-5 customDaHuy">
                                                        <img width="18" height="18" src="/images/logo/close.png"> Đã
                                                        hủy
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test = "${item.donHang.trangThai =='Chờ xác nhận'}">
                                                <div class="row">
                                                    <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                    <div class="col-5 customChoXacNhan">
                                                        <img width="18" height="18" src="/images/logo/wait.png"> Chờ
                                                        xác nhận
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test = "${item.donHang.trangThai =='Đã giao' }">
                                                <div class="row">
                                                    <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                    <div class="col-5 customDaGiao">
                                                        <img width="18" height="18" src="/images/logo/success.png"> Đã
                                                        giao
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test = "${item.donHang.trangThai =='Chờ lấy hàng'}">
                                                <div class="row">
                                                    <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                    <div class="col-5 customChoLayHang">
                                                        <img width="18" height="18" src="/images/logo/waitMe.png"> Chờ
                                                        lấy hàng
                                                    </div>
                                                </div>
                                            </c:if>
                                            <tbody>
                                            <c:forEach var="orderDetail" items="${item.listChiTietDonHang}">
                                                <tr>
                                                    <td class="col-8">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"
                                                               style="margin-right: 10px;">
                                                                <img class="media-object"
                                                                     src="/images/sp/${orderDetail.giay.hinhAnh}"
                                                                     width="72" height="72"> </a>
                                                            <div class="media-body">
                                                                <div>
                                                                    ${orderDetail.giay.tenGiay}
                                                                </div>
                                                                <div>x${orderDetail.soLuong}</div>
                                                                <fmt:formatNumber var="giaSanPham"
                                                                    value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)}"
                                                                    maxFractionDigits="0" />
                                                                <span>Đơn giá: </span>
                                                                <span>
                                                                    <strong> ${giaSanPham} đ</strong>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="col-4 text-right" style="height:97px;line-height:97px;">
                                                        <fmt:formatNumber var="giaTamTinh"
                                                            value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)*orderDetail.soLuong}"
                                                            maxFractionDigits="0" />
                                                        <strong class="text-primary">
                                                            ${giaTamTinh} đ
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr style="text-align:right;">
                                                <td></td>
                                                <fmt:formatNumber var="tongTienCanTra"
                                                    value="${item.donHang.tongTien}"
                                                    maxFractionDigits="0" />
                                                <td class="tongTienCustom"><strong>Tổng tiền: ${tongTienCanTra} đ</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <c:forEach var="item" items="${listChoXacNhan}">
                                    <div class="idHomeCustom">
                                        <table class="table table-hover">
                                            <div class="row">
                                                <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                <div class="col-5 customChoXacNhan">
                                                    <img width="18" height="18" src="/images/logo/wait.png"> Chờ
                                                    xác nhận
                                                </div>
                                            </div>
                                            <tbody>
                                            <c:forEach var="orderDetail" items="${item.listChiTietDonHang}">
                                                <tr>
                                                    <td class="col-8">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"
                                                               style="margin-right: 10px;">
                                                                <img class="media-object"
                                                                     src="/images/sp/${orderDetail.giay.hinhAnh}"
                                                                     width="72" height="72"> </a>
                                                            <div class="media-body">
                                                                <div>
                                                                    ${orderDetail.giay.tenGiay}
                                                                </div>
                                                                <div>x${orderDetail.soLuong}</div>
                                                                <fmt:formatNumber var="giaSanPham"
                                                                    value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)}"
                                                                    maxFractionDigits="0" />
                                                                <span>Đơn giá: </span>
                                                                <span>
                                                                    <strong> ${giaSanPham} đ</strong>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="col-4 text-right" style="height:97px;line-height:97px;">
                                                        <fmt:formatNumber var="giaTamTinh"
                                                            value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)*orderDetail.soLuong}"
                                                            maxFractionDigits="0" />
                                                        <strong class="text-primary">
                                                            ${giaTamTinh} đ
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr style="text-align:right;">
                                                <td></td>
                                                <fmt:formatNumber var="tongTienCanTra"
                                                    value="${item.donHang.tongTien}"
                                                    maxFractionDigits="0" />
                                                <td class="tongTienCustom"><strong>Tổng tiền: ${tongTienCanTra} đ</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                                <c:forEach var="item" items="${listChoLayHang}">
                                    <div class="idHomeCustom">
                                        <table class="table table-hover">
                                            <div class="row">
                                                <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                <div class="col-5 customChoXacNhan">
                                                    <img width="18" height="18" src="/images/logo/waitMe.png"> Chờ
                                                    xác nhận
                                                </div>
                                            </div>
                                            <tbody>
                                            <c:forEach var="orderDetail" items="${item.listChiTietDonHang}">
                                                <tr>
                                                    <td class="col-8">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"
                                                               style="margin-right: 10px;">
                                                                <img class="media-object"
                                                                     src="/images/sp/${orderDetail.giay.hinhAnh}"
                                                                     width="72" height="72"> </a>
                                                            <div class="media-body">
                                                                <div>
                                                                    ${orderDetail.giay.tenGiay}
                                                                </div>
                                                                <div>x${orderDetail.soLuong}</div>
                                                                <fmt:formatNumber var="giaSanPham"
                                                                    value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)}"
                                                                    maxFractionDigits="0" />
                                                                <span>Đơn giá: </span>
                                                                <span>
                                                                    <strong> ${giaSanPham} đ</strong>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="col-4 text-right" style="height:97px;line-height:97px;">
                                                        <fmt:formatNumber var="giaTamTinh"
                                                            value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)*orderDetail.soLuong}"
                                                            maxFractionDigits="0" />
                                                        <strong class="text-primary">
                                                            ${giaTamTinh} đ
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr style="text-align:right;">
                                                <td></td>
                                                <fmt:formatNumber var="tongTienCanTra"
                                                    value="${item.donHang.tongTien}"
                                                    maxFractionDigits="0" />
                                                <td class="tongTienCustom"><strong>Tổng tiền: ${tongTienCanTra} đ</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="tab-pane fade" id="contact2" role="tabpanel" aria-labelledby="contact-tab">
                                <c:forEach var="item" items="${listDangGiao}">
                                    <div class="idHomeCustom">
                                        <table class="table table-hover">
                                            <div class="row">
                                                <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                <div class="col-5 customDangGiao">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                                                        <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                                    </svg>
                                                    Đang giao
                                                </div>
                                            </div>
                                            <tbody>
                                            <c:forEach var="orderDetail" items="${item.listChiTietDonHang}">
                                                <tr>
                                                    <td class="col-8">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"
                                                               style="margin-right: 10px;">
                                                                <img class="media-object"
                                                                     src="/images/sp/${orderDetail.giay.hinhAnh}"
                                                                     width="72" height="72"> </a>
                                                            <div class="media-body">
                                                                <div>
                                                                    ${orderDetail.giay.tenGiay}
                                                                </div>
                                                                <div>x${orderDetail.soLuong}</div>
                                                                <fmt:formatNumber var="giaSanPham"
                                                                    value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)}"
                                                                    maxFractionDigits="0" />
                                                                <span>Đơn giá: </span>
                                                                <span>
                                                                    <strong> ${giaSanPham} đ</strong>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="col-4 text-right" style="height:97px;line-height:97px;">
                                                        <fmt:formatNumber var="giaTamTinh"
                                                            value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)*orderDetail.soLuong}"
                                                            maxFractionDigits="0" />
                                                        <strong class="text-primary">
                                                            ${giaTamTinh} đ
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr style="text-align:right;">
                                                <td></td>
                                                <fmt:formatNumber var="tongTienCanTra"
                                                    value="${item.donHang.tongTien}"
                                                    maxFractionDigits="0" />
                                                <td class="tongTienCustom"><strong>Tổng tiền: ${tongTienCanTra} đ</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="tab-pane fade" id="contact3" role="tabpanel" aria-labelledby="contact-tab">
                                <c:forEach var="item" items="${listDaGiao}">
                                    <div class="idHomeCustom">
                                        <table class="table table-hover">
                                            <div class="row">
                                                <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                <div class="col-5 customChoXacNhan">
                                                    <img width="18" height="18" src="/images/logo/success.png"> Chờ
                                                    xác nhận
                                                </div>
                                            </div>
                                            <tbody>
                                            <c:forEach var="orderDetail" items="${item.listChiTietDonHang}">
                                                <tr>
                                                    <td class="col-8">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"
                                                               style="margin-right: 10px;">
                                                                <img class="media-object"
                                                                     src="/images/sp/${orderDetail.giay.hinhAnh}"
                                                                     width="72" height="72"> </a>
                                                            <div class="media-body">
                                                                <div>
                                                                    ${orderDetail.giay.tenGiay}
                                                                </div>
                                                                <div>x${orderDetail.soLuong}</div>
                                                                <fmt:formatNumber var="giaSanPham"
                                                                    value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)}"
                                                                    maxFractionDigits="0" />
                                                                <span>Đơn giá: </span>
                                                                <span>
                                                                    <strong> ${giaSanPham} đ</strong>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="col-4 text-right" style="height:97px;line-height:97px;">
                                                        <fmt:formatNumber var="giaTamTinh"
                                                            value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)*orderDetail.soLuong}"
                                                            maxFractionDigits="0" />
                                                        <strong class="text-primary">
                                                            ${giaTamTinh} đ
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr style="text-align:right;">
                                                <td></td>
                                                <fmt:formatNumber var="tongTienCanTra"
                                                    value="${item.donHang.tongTien}"
                                                    maxFractionDigits="0" />
                                                <td class="tongTienCustom"><strong>Tổng tiền: ${tongTienCanTra} đ</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="tab-pane fade" id="contact4" role="tabpanel" aria-labelledby="contact-tab">
                                <c:forEach var="item" items="${listDaHuy}">
                                    <div class="idHomeCustom">
                                        <table class="table table-hover">
                                            <div class="row">
                                                <div class="col-7" style="color:red;">#${item.donHang.maDonHang}</div>
                                                <div class="col-5 customChoXacNhan">
                                                    <img width="18" height="18" src="/images/logo/close.png"> Chờ
                                                    xác nhận
                                                </div>
                                            </div>
                                            <tbody>
                                            <c:forEach var="orderDetail" items="${item.listChiTietDonHang}">
                                                <tr>
                                                    <td class="col-8">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"
                                                               style="margin-right: 10px;">
                                                                <img class="media-object"
                                                                     src="/images/sp/${orderDetail.giay.hinhAnh}"
                                                                     width="72" height="72"> </a>
                                                            <div class="media-body">
                                                                <div>
                                                                    ${orderDetail.giay.tenGiay}
                                                                </div>
                                                                <div>x${orderDetail.soLuong}</div>
                                                                <fmt:formatNumber var="giaSanPham"
                                                                    value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)}"
                                                                    maxFractionDigits="0" />
                                                                <span>Đơn giá: </span>
                                                                <span>
                                                                    <strong> ${giaSanPham} đ</strong>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="col-4 text-right" style="height:97px;line-height:97px;">
                                                        <fmt:formatNumber var="giaTamTinh"
                                                            value="${orderDetail.giay.donGia*(1-orderDetail.giay.giamGia)*orderDetail.soLuong}"
                                                            maxFractionDigits="0" />
                                                        <strong class="text-primary">
                                                            ${giaTamTinh} đ
                                                        </strong>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr style="text-align:right;">
                                                <td></td>
                                                <fmt:formatNumber var="tongTienCanTra"
                                                    value="${item.donHang.tongTien}"
                                                    maxFractionDigits="0" />
                                                <td class="tongTienCustom"><strong>Tổng tiền: ${tongTienCanTra} đ</strong>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!--  -->
                    <div class="tab-pane fade" id="user-profile">.seee..</div>
                </div>
            </div>
        </div>

        <!--start modal-->
        <div class="modal fade" id="modalNotify" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Thông báo</h5>
                        <button style="display: inline-block;border: none;" type="button" class="close"
                                data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <div class="billing-address-form">
                                <p class="pThongBao">Thay đổi thành công</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Đồng ý
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--end modal-->

         <!--start modal Change Password-->
        <div class="modal fade" id="modalNotifyChangePassword" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Thông báo</h5>
                        <button style="display: inline-block;border: none;" type="button" class="close"
                                data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="card-body">
                            <div class="billing-address-form">
                                <p class="txt-success">Thay đổi mật khẩu thành công. Vui lòng đăng nhập lại</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btnChangePassword" type="button" class="btn btn-primary">Đồng ý</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end modal-->

		<!-- Footer -->

		<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-lg-6">
						<div
							class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
							<ul class="footer_nav">
								<li><a href="#">Blog</a></li>
								<li><a href="#">FAQs</a></li>
								<li><a href="#">Contact us</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6">
						<div
							class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-skype"
										aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-pinterest"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="footer_nav_container">
							<div class="cr">
								Form Sigma Zịt with love
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/jquery-3.2.1.min.js"></script>
    <script
        src="${pageContext.request.contextPath}/usertemplate/js/owl.carousel.min.js"></script>
    <script
      src="${pageContext.request.contextPath}/usertemplate/js/jquery.isotope-3.0.6.min.js"></script>
    <script
      src="${pageContext.request.contextPath}/usertemplate/js/jquery.meanmenu.min.js"></script>
    <script
      src="${pageContext.request.contextPath}/usertemplate/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/usertemplate/styles/bootstrap4/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/custom.js"></script>
	<script
		src="${pageContext.request.contextPath}/usertemplate/js/custom2.js"></script>
    <script
            src="${pageContext.request.contextPath}/usertemplate/js/infor_custom.js"></script>
</body>

</html>