package com.macbeth.service.impl;

import com.macbeth.mapper.UserMapper;
import com.macbeth.pojo.User;
import com.macbeth.pojo.UserExample;
import com.macbeth.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    UserMapper userMapper;
    @Override
    public void add(User c) {
        userMapper.insert(c);

    }

    @Override
    public void delete(int id) {
        userMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void update(User c) {
        userMapper.updateByPrimaryKeySelective(c);
    }

    @Override
    public User get(int id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<User> list() {
        UserExample example = new UserExample();
        example.setOrderByClause("id desc");
        return userMapper.selectByExample(example);
    }

    @Override
    public boolean isExist(String name) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name);
        List<User> users = userMapper.selectByExample(example);
        if (!users.isEmpty()){
            return true;
        }
        return false;
    }

    @Override
    public User get(String name, String password) {
        UserExample example = new UserExample();
        example.createCriteria().andNameEqualTo(name).andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(example);
        if (users.isEmpty()){
            return null;
        }
        else {
            return users.get(0);
        }
    }
}
