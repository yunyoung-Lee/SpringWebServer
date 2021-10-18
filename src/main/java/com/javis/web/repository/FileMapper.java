package com.javis.web.repository;

import org.apache.ibatis.annotations.Mapper;

import com.javis.web.dto.FileDTO;

@Mapper
public interface FileMapper {

	public FileDTO selectFileInfoByBno(int bno) throws Exception;
	public FileDTO selectFileInfoByFno(String fno) throws Exception;
}

