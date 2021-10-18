package com.javis.web.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.javis.web.model.User;


@Mapper
public interface UserMapper {
	@Select("SELECT * FROM user")
	List<User> findAll();

	@Select("SELECT * FROM user WHERE userId = #{userId}")
	User findByUserId(@Param("userId") String userId);
	
	int userJoin(User user); 
}
