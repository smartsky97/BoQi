package com.yc.boqi.userTest;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yc.boqi.entity.UserInfo;
import com.yc.boqi.service.UserInfoService;
import com.yc.boqi.service.impl.UserInfoServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class UserInfoServiceImplTest extends UserInfoServiceImpl {

	
	@Autowired
	private UserInfoService userInfoService;
	
	

}
