package com.macbeth.service;

import com.macbeth.pojo.Order;
import com.macbeth.pojo.OrderItem;
import com.macbeth.utils.AbstractService;

import java.util.List;

public interface OrderItemService extends AbstractService<OrderItem>{

    List<OrderItem> list();

    void fill(List<Order> os);

    void fill(Order o);

    int getSaleCount(int  pid);

    List<OrderItem> listByUser(int uid);
}
