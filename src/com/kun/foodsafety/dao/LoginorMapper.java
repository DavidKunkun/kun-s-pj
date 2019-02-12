package com.kun.foodsafety.dao;

import com.kun.foodsafety.model.Loginor;

public interface LoginorMapper {
        public void addLoginor(Loginor loginor);
        public String selLastLoginTimeById(Loginor loginor);
}
