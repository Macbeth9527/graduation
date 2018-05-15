package com.macbeth.service;

import com.macbeth.pojo.Order;
import com.macbeth.pojo.OrderItem;
import com.macbeth.utils.AbstractService;

import java.util.List;

public interface OrderService extends AbstractService<Order> {
    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";


    float add(Order o,List<OrderItem> ois);
    List list();
    List list(int uid, String excludedStatus);
}
