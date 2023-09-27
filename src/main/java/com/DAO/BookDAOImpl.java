package com.DAO;

import com.entity.BookDtls;
import com.entity.Book_Order;
import com.user.servlet.OrderServlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAOImpl implements BookDAO{
    private Connection conn;

    public BookDAOImpl(Connection conn) {
        this.conn = conn;
    }
    public boolean addBooks(BookDtls b){

        boolean f=false;
        try {
            String sql="insert into book(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,b.getBookName());
            ps.setString(2,b.getBookAuthor());
            ps.setDouble(3,b.getPrice());
            ps.setString(4,b.getBookCategory());
            ps.setString(5,b.getStatus());
            ps.setString(6,b.getPhotoName());
            ps.setString(7,b.getEmail());
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch (Exception e){

        }


        return f;
    }

    @Override
    public List<BookDtls> getAllBooks() {
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;

        try {
            String sql="select * from book";
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        }catch (Exception e){
         e.printStackTrace();
        }

        return list;
    }

    @Override
    public BookDtls getBookById(int id) {
        BookDtls b=null;
        try {
            String sql="select * from book where bookid=?";
            PreparedStatement ps= conn.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
            }

        }
        catch (Exception e){
        e.printStackTrace();
        }

        return b;
    }

    @Override
    public boolean updateEditBooks(BookDtls b) {
        boolean f=false;
        try {
            String sql="update book set bookname=?,author=?,price=?,status=? where bookId=?";
            PreparedStatement ps= conn.prepareStatement(sql);
            ps.setString(1,b.getBookName());
            ps.setString(2,b.getBookAuthor());
            ps.setDouble(3,b.getPrice());
            ps.setString(4,b.getStatus());
            ps.setInt(5,b.getBookId());
            int i= ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteBooks(int id) {
        boolean f= false;
        try {
            String sql="delete from book where bookId=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setInt(1,id);
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookDtls> getNewBook() {
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql="select * from book where bookCategory=? and status=? order by bookid DESC";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"New");
            ps.setString(2,"Active");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4){
                i++;
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
            System.out.println("working");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getRecentBook() {

        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql="select * from book where status=? order by bookid DESC";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"Active");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4){
                i++;
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }
            System.out.println("working");
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<BookDtls> getOldBook() {
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql="select * from book where bookCategory=? and status=? order by bookid DESC";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"Old");
            ps.setString(2,"Active");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=4){
                i++;
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql="select * from book where bookCategory=? and status=? order by bookid DESC";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"New");
            ps.setString(2,"Active");
            ResultSet rs=ps.executeQuery();

            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<BookDtls> getAllRecentBook() {

        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql="select * from book where status=? order by bookid DESC";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"Active");
            ResultSet rs=ps.executeQuery();
            int i=1;
            while(rs.next() && i<=16){
                i++;
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<BookDtls> getAllOldBook() {

        List<BookDtls> list=new ArrayList<BookDtls>();
        BookDtls b=null;
        try{
            String sql="select * from book where bookCategory=? and status=? order by bookid DESC";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"Old");
            ps.setString(2,"Active");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<BookDtls> getBookByOld(String email, String cate) {
        List<BookDtls> list=new ArrayList<>();
        BookDtls b=null;
        try {
            String sql="select * from book where bookCategory=? and email=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,cate);
            ps.setString(2,email);
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean oldBookDelete(String email, String cate,int bid) {
        boolean f=false;
        try{
            String sql="delete from book where bookCategory=? and email=? and bookid=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,cate);
            ps.setString(2,email);
            ps.setInt(3,bid);
            int i=ps.executeUpdate();
            if(i==1){
                f=true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<BookDtls> getBookBySearch(String ch) {
        List<BookDtls> list=new ArrayList<>();
        BookDtls b=null;
        try {
            String sql="select * from book where bookname like ? or author like ? or bookCategory like  ? and status=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,"%"+ch+"%");
            ps.setString(2,"%"+ch+"%");
            ps.setString(3,"%"+ch+"%");
            ps.setString(4,"Active");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
                b=new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setBookAuthor(rs.getString(3));
                b.setPrice(rs.getDouble(4));
                b.setBookCategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean deliveredOrder(String did) {
        boolean f=false;
        int i=0;
        try {
            String sql="delete from order_save where order_id=?";
            PreparedStatement psd= conn.prepareStatement(sql);
            psd.setString(1,did);
            String sql1="select * from order_save where order_id=?";
            PreparedStatement ps= conn.prepareStatement(sql1);
            ps.setString(1,did);
            ResultSet rs=ps.executeQuery();
            String sql2="insert into delivered_item(order_id,user_name,email,address,phno,book_name,author,price,payment) values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps2= conn.prepareStatement(sql2);

            while(rs.next()){
                ps2.setString(1,rs.getString(2));
                ps2.setString(2,rs.getString(3));
                ps2.setString(3,rs.getString(4));
                ps2.setString(4,rs.getString(5));
                ps2.setString(5,rs.getString(6));
                ps2.setString(6,rs.getString(7));
                ps2.setString(7,rs.getString(8));
                ps2.setDouble(8,rs.getDouble(9));
                ps2.setString(9,rs.getString(10));
                i = i+ ps2.executeUpdate();
                psd.executeUpdate();
            }

            if(i>0) f=true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public boolean canceledOrder(String cid) {
        boolean f= false;
        try {
            String sql="delete from order_save where order_id=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,cid);
            int i=ps.executeUpdate();
            if(i>0){
                f=true;

            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }
}
