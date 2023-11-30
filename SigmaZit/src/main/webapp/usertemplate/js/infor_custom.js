$(document).ready(() => {
    $(".feat-btn").click(function () {
        $("div ul .feat-show").toggleClass("show");
        $("div ul .first").toggleClass("rotate");
        $(".feat-show .feat-show-btn.first").addClass("active").siblings().removeClass("active");
        $(".tab-pane.first").addClass("active").siblings().removeClass("active");
        $(".tab-pane.first").addClass("show").siblings().removeClass("show");
    });

    $("#donMua").click(function (){
        $("#titleInformation").html('<i class="fa fa-shopping-cart"></i><span>Đơn mua</span>');
    });
    $("#containerForm").click(function (){
        $("#titleInformation").html('<i class="fa fa-user"></i><span>Tài khoản của tôi</span>');
    });

    $(".feat-btn-test").click(function (e) {
        $("div ul .feat-show").removeClass("show");
    });
    $("div ul li").click(function () {
        $(this).addClass("active").siblings().removeClass("active");
    });
    $(".sidebar-left a").click(function (e) {
        e.preventDefault();
    });
    $(".feat-show .feat-show-btn").click(function (e) {
        $(this).addClass("active").siblings().removeClass("active");
    });

    var check=$("#clickElement").val();
    console.log("check:",check);
    if(check=="doiMatKhau"){
        console.log("vào đổi mật khẩu");
        $("div ul .feat-show").toggleClass("show");
        $("div ul .first").toggleClass("rotate");
        $(".feat-show .feat-show-btn.first").addClass("active").siblings().removeClass("active");
        $(".tab-pane.first").addClass("active").siblings().removeClass("active");
        $(".tab-pane.first").addClass("show").siblings().removeClass("show");

        $("#doiMatKhau").addClass("active").siblings().removeClass("active");
        $("#user-info").removeClass("show first active");
        $("#user-pass").addClass("show first active");
    }else if(check=="donMua"){
        $("#donMua").addClass("active").siblings().removeClass("active");
         $("#user-cart").addClass("active").siblings().removeClass("active");
         $("#user-info").removeClass("show first active");
         $("#user-pass").removeClass("show first active");
     }else{
        $("div ul .feat-show").toggleClass("show");
        $("div ul .first").toggleClass("rotate");
        $(".feat-show .feat-show-btn.first").addClass("active").siblings().removeClass("active");
        $(".tab-pane.first").addClass("active").siblings().removeClass("active");
        $(".tab-pane.first").addClass("show").siblings().removeClass("show");

        $("#hoSo").addClass("active").siblings().removeClass("active");
        $("#user-info").addClass("show first active");
        $("#user-pass").removeClass("show first active");
    }
    var changePassSuccess=$("#changePassSuccess").val()
    if(changePassSuccess=="true"){
        localStorage.clear();
    }
//    $("#modalNotify").modal('show');
//    $("#modalNotify2").modal('show');
    const status=$("#status").val();
    if(status=="informationTrue"){
       $("#modalNotify").modal('show');
    }
    if(status=="changePasswordTrue"){
       $("#modalNotifyChangePassword").modal('show');
    }

    $('#btnChangePassword').click(()=>{
        $.ajax({
            url: "/information/change-password/clear-session",
            method: "POST",
            // type: "application/json",
            data: {},
            success: function(response) {
                console.log(response);
                if(response=="success"){
                    const urlOrigin=location.origin;
                    location.replace(urlOrigin+"/information");
                }
            }
        });
    });
});
