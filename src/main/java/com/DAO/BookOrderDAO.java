package com.DAO;

import com.entity.Book_Order;

import java.util.List;

public interface BookOrderDAO {
    public boolean saveOrder(List<Book_Order> b);
    public List<Book_Order> getBook(String email);
    public List<Book_Order> getAllOrder();
    public List<Book_Order> getAllDelivered();
}
