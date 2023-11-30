package com.mt.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mt.entity.DonHang;
import com.mt.entity.Giay;

@Repository
public interface OrderDAO extends JpaRepository<DonHang, Integer> {
	@Query("SELECT o FROM DonHang o WHERE o.trangThai like %?1%")
    List<DonHang> findByStatus(String trangThai);

    @Query("SELECT o FROM DonHang o WHERE o.khachHang.taiKhoan=?1 " +
            "AND o.maDonHang=?2 " +
            "AND o.trangThai like %?3%")
    List<DonHang> findAllByOrderIdAndOrderStatus(String taiKhoan,Integer maDonHang, String trangThai);
    @Query("SELECT o FROM DonHang o WHERE o.khachHang.taiKhoan=?1 " +
            "AND o.trangThai like %?2%")
    List<DonHang> findAllByOrderStatus(String taiKhoan, String trangThai);
}
