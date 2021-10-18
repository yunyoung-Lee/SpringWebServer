package com.javis.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javis.web.dto.UserDTO;
import com.javis.web.model.User;
import com.javis.web.repository.UserMapper;
import com.javis.web.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public UserDTO getUserOne(String userId) {
		User user = userMapper.findByUserId(userId);
		UserDTO dto = null;
		if (user != null) {
			dto = new UserDTO();
			dto.setUserId(user.getUserId());
			dto.setCreateDate(user.getCreateDate());
			dto.setUpdateDate(user.getUpdateDate());
			dto.setUserBirth(user.getUserBirth());
			dto.setUserEmail(user.getUserEmail());
			dto.setUserName(user.getUserName());
			
			return dto;
		}
		return null;
	}

	@Override
	public int userJoinDTO(UserDTO UserDTO) {
		User user = new User();
		user.setUserId(UserDTO.getUserId());
		user.setUserBirth(UserDTO.getUserBirth());
		user.setUserEmail(UserDTO.getUserEmail());
		user.setUserName(UserDTO.getUserName());
		user.setUserPw(UserDTO.getUserPw());
		return userMapper.userJoin(user);
	}

	
	
}