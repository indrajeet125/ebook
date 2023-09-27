package com.DAO;

import com.DB.DBConnect;
import com.entity.Book_Order;
import jakarta.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookOrderDAOImpl implements BookOrderDAO {

    private Connection conn;

    public BookOrderDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }
    @Override
    public boolean saveOrder(List<Book_Order> blist) {
        boolean f = false;
        try {

            String sql = "insert into order_save(order_id,user_name,email,address,phno,book_name,author,price,payment) values (?,?,?,?,?,?,?,?,?)";
            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);
            for (Book_Order b : blist) {
                ps.setString(1, b.getOrderId());
                ps.setString(2, b.getUsername());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFullAdd());
                ps.setString(5, b.getPhno());
                ps.setString(6, b.getBookName());
                ps.setString(7, b.getAuthor());
                ps.setDouble(8, b.getPrice());
                ps.setString(9, b.getPaymentType());

                ps.addBatch();

            }
            int[] count = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<Book_Order> getBook(String email) {
        List<Book_Order> list = new ArrayList<>();
        Book_Order o = null;
        try {
            String sql = "select * from order_save where email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUsername(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAdd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getDouble(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<Book_Order> getAllOrder() {
        List<Book_Order> list = new ArrayList<>();
        Book_Order o = null;
        try {
            String sql = "select * from order_save";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUsername(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAdd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getDouble(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    @Override
    public List<Book_Order> getAllDelivered() {
        List<Book_Order> list = new ArrayList<>();
        Book_Order o = null;
        try {
            String sql = "select * from delivered_item";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                o = new Book_Order();
                o.setId(rs.getInt(1));
                o.setOrderId(rs.getString(2));
                o.setUsername(rs.getString(3));
                o.setEmail(rs.getString(4));
                o.setFullAdd(rs.getString(5));
                o.setPhno(rs.getString(6));
                o.setBookName(rs.getString(7));
                o.setAuthor(rs.getString(8));
                o.setPrice(rs.getDouble(9));
                o.setPaymentType(rs.getString(10));
                list.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


}
