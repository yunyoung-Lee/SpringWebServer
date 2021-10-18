package com.javis.web.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.javis.web.model.Finger;

@Mapper
public interface FingerMapper {
	@Select("SELECT * FROM finger")
	List<Finger> findAll();

	@Select("SELECT * FROM finger WHERE userId = #{userId}")
	List<Finger> findByUserId(@Param("userId") String userId);

	int fingerJoin(Finger finger) ;
	

}
