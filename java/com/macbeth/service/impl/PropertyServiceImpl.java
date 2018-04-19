package com.macbeth.service.impl;

import com.macbeth.mapper.PropertyMapper;
import com.macbeth.pojo.Property;
import com.macbeth.pojo.PropertyExample;
import com.macbeth.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    PropertyMapper propertyMapper;
    @Override
    public void addProperty(Property property) {
        propertyMapper.insertSelective(property);
    }

    @Override
    public void delProperty(int id) {
        propertyMapper.deleteByPrimaryKey(id);

    }

    @Override
    public void updateProperty(Property property) {
        propertyMapper.updateByPrimaryKeySelective(property);

    }

    @Override
    public Property getProperty(int id) {
        return propertyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Property> listProperty(int categoryID) {
        PropertyExample propertyExample = new PropertyExample();

        propertyExample.createCriteria().andCidEqualTo(categoryID);

        propertyExample.setOrderByClause("id desc");

        return propertyMapper.selectByExample(propertyExample);
    }

}
