package com.kun.foodsafety.services;

import com.kun.foodsafety.model.Loginor;

public interface LoginorServ {
      public void addLoginor(Loginor loginor);
      public String selLastLoginTimeById(Loginor loginor);
}
