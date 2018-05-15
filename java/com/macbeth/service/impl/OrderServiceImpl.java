package com.macbeth.service.impl;

import com.macbeth.mapper.OrderMapper;
import com.macbeth.pojo.Order;
import com.macbeth.pojo.OrderExample;
import com.macbeth.pojo.OrderItem;
import com.macbeth.pojo.User;
import com.macbeth.service.OrderItemService;
import com.macbeth.service.OrderService;
import com.macbeth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    UserService userService;
    @Autowired
    OrderItemService orderItemService;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
    public float add(Order o, List<OrderItem> ois) {
        float total = 0;
        add(o);
        if (false)
            throw new RuntimeException();
        for (OrderItem oi : ois
                ) {
            oi.setOid(o.getId());
            orderItemService.update(oi);
            total = oi.getNumber() * oi.getProduct().getPrice();
        }
        return total;

    }

    @Autowired
    OrderMapper orderMapper;

    @Override
    public void add(Order c) {
        orderMapper.insert(c);

    }

    @Override
    public void delete(int id) {
        orderMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void update(Order c) {
        orderMapper.updateByPrimaryKeySelective(c);

    }

    @Override
    public Order get(int id) {
        Order order = orderMapper.selectByPrimaryKey(id);
        setUser(order);
        return order;
    }

    @Override
    public List list() {
        OrderExample orderExample = new OrderExample();
        orderExample.setOrderByClause("id desc");
        List<Order> orders = orderMapper.selectByExample(orderExample);
        setUser(orders);
        return orders;
    }

    public void setUser(List<Order> os) {
        for (Order o : os)
            setUser(o);
    }

    public void setUser(Order o) {
        int uid = o.getUid();
        User u = userService.get(uid);
        o.setUser(u);
    }

    @Override
    public List list(int uid, String excludedStatus) {
        OrderExample example =new OrderExample();
        example.createCriteria().andUidEqualTo(uid).andStatusNotEqualTo(excludedStatus);
        example.setOrderByClause("id desc");
        return orderMapper.selectByExample(example);
    }
}
