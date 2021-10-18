package com.javis.web.service;

import com.javis.web.dto.UserDTO;

public interface UserService {

	UserDTO getUserOne(String userId);

	int userJoinDTO(UserDTO UserDTO);

}