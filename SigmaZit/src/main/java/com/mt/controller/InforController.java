package com.mt.controller;

import com.mt.commons.Constant;
import com.mt.dao.*;
import com.mt.entity.DonHang;
import com.mt.entity.KhachHang;
import com.mt.entity.OrderList;
import com.mt.entity.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("information")
public class InforController {
    @Autowired
    AccountDAO accountDAO;

    @Autowired
    OrderDetailDAO orderDetailDAO;

    @Autowired
    OrderDAO orderDAO;

    @Autowired
    ShoppingCartDAO shoppingCartDAO;
    @Autowired
    SessionDAO session;

    @GetMapping("")
    public String index(Model model,@RequestParam Optional<String> message,
                        @RequestParam Optional<String> checkPass,
                        @RequestParam Optional<String> tag,
                        @RequestParam Optional<String> currentPassword,
                        @RequestParam Optional<String> newPassword,
                        @RequestParam Optional<String> confirmPassword,
                        @RequestParam Optional<String> orderId){
        KhachHang user = (KhachHang) session.get("user");
        if(user==null) {
            String error="Vui long dang nhap!";
            return "redirect:/login?error="+error+"&urlReturn=information";
        }
        model.addAttribute("sessionUsername",user.getTaiKhoan());
        String tagString="hoSo";
        if(tag.isPresent()){
            tagString=tag.get();
        }
        if(tagString.equalsIgnoreCase("doiMatKhau")){
            if(checkPass.isPresent() && checkPass.get().equals("errorPass")){
                model.addAttribute("errorPass",true);
            }
            if(checkPass.isPresent() && checkPass.get().equals("errorConfirmPassword")){
                model.addAttribute("errorConfirmPassword",true);
            }
            if(newPassword.isPresent()){
                model.addAttribute("newPassValue",newPassword.get());
            }
            if(currentPassword.isPresent()){
                model.addAttribute("currentPassValue",currentPassword.get());
            }
            if(confirmPassword.isPresent()){
                model.addAttribute("confirmPassValue",confirmPassword.get());
            }
        }
        // list đơn hàng
        List<OrderStatus> listOrderStatus = Arrays.asList(
                new OrderStatus("listTatCa", ""),
                new OrderStatus("listChoXacNhan", Constant.CHO_XAC_NHAN),
                new OrderStatus("listChoLayHang", Constant.CHO_LAY_HANG),
                new OrderStatus("listDangGiao", Constant.DANG_GIAO),
                new OrderStatus("listDaGiao", Constant.DA_GIAO),
                new OrderStatus("listDaHuy", Constant.DA_HUY)
        );

        if (orderId.isPresent() && !orderId.get().isEmpty()) {
            for (OrderStatus i : listOrderStatus) {
                List<DonHang> list = orderDAO.findAllByOrderIdAndOrderStatus(user.getTaiKhoan(),Integer.parseInt(orderId.get()), i.getValue());
                model.addAttribute(i.getKey(), getListOrderResult(list));
            }
        } else {
            for (OrderStatus i : listOrderStatus) {
                List<DonHang> list = orderDAO.findAllByOrderStatus(user.getTaiKhoan(),i.getValue());
                model.addAttribute(i.getKey(), getListOrderResult(list));
            }
        }
        model.addAttribute("tag",tagString);
        KhachHang khachHang=accountDAO.findById(user.getTaiKhoan()).get();
        model.addAttribute("user",khachHang);
        model.addAttribute("tongSoLuongGioHang",shoppingCartDAO.getCount());
        if(message.isPresent()){
            if(message.get().equals("informationTrue")){
                model.addAttribute("status","informationTrue");
            }
            if(message.get().equals("changePasswordTrue")){
                model.addAttribute("status","changePasswordTrue");
            }
        }

        return "customer/infor";
    }
    @PostMapping("save")
    public String save(@RequestParam Optional<String> tenKhachHang,
                       @RequestParam Optional<String> soDienThoai,
                       @RequestParam Optional<String> diaChi){
        KhachHang user = (KhachHang) session.get("user");
        if(user==null) {
            String error="Vui long dang nhap!";
            return "redirect:/login?error="+error+"&urlReturn=information";
        }
        KhachHang khachHang=accountDAO.findById(user.getTaiKhoan()).get();
        if(tenKhachHang.isPresent() && !tenKhachHang.get().isEmpty()){
            khachHang.setTenKhachHang(tenKhachHang.get());
        }
        if(soDienThoai.isPresent() && !soDienThoai.get().isEmpty()){
            khachHang.setSoDienThoai(soDienThoai.get());
        }
        if(diaChi.isPresent() && !diaChi.get().isEmpty()){
            khachHang.setDiaChi(diaChi.get());
        }
        accountDAO.save(khachHang);
        String message="informationTrue";
        return "redirect:/information?message="+message;
    }

    @PostMapping("change-password")
    public String changePassword(@RequestParam Optional<String> currentPassword,
                       @RequestParam Optional<String> newPassword,
                       @RequestParam Optional<String> confirmPassword){
        KhachHang user = (KhachHang) session.get("user");
        if(user==null) {
            String error="Vui long dang nhap!";
            return "redirect:/login?error="+error+"&urlReturn=information";
        }
        KhachHang khachHang=accountDAO.findById(user.getTaiKhoan()).get();
        if(!currentPassword.get().equals(khachHang.getMatKhau())){
            String errorPass="errorPass";
            return "redirect:/information?tag=doiMatKhau&message=false&checkPass="+errorPass
                    +"&currentPassword="+currentPassword.get()
                    +"&newPassword="+newPassword.get()
                    +"&confirmPassword="+confirmPassword.get();
        }
        if(!confirmPassword.get().equals(newPassword.get())){
            String errorConfirmPassword="errorConfirmPassword";
            return "redirect:/information?tag=doiMatKhau&message=false&checkPass="+errorConfirmPassword
                    +"&currentPassword="+currentPassword.get()
                    +"&newPassword="+newPassword.get()
                    +"&confirmPassword="+confirmPassword.get();
        }
        khachHang.setMatKhau(newPassword.get());
        accountDAO.save(khachHang);
        return "redirect:/information?tag=doiMatKhau&message=changePasswordTrue";
    }

    @PostMapping("change-password/clear-session")
    public ResponseEntity<String> clearSession(){
        session.clear();
        return ResponseEntity.ok("success");
    }

    private List<OrderList> getListOrderResult(List<DonHang> list) {
        List<OrderList> listOrderResult = new ArrayList<>();
        for (DonHang item : list) {
            OrderList orderResult = new OrderList();
            orderResult.setDonHang(item);
            orderResult.setListChiTietDonHang(orderDetailDAO.findAllByOrderId(item.getMaDonHang()));
            listOrderResult.add(orderResult);
        }
        return listOrderResult;
    }
}
