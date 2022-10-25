package com.pinosoft.Education.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pinosoft.Education.Dto.InsaComDto;
import com.pinosoft.Education.Dto.InsaDto;
import com.pinosoft.Education.Dto.InsaInfoDto;
import com.pinosoft.Education.Vo.PageMaker;

@Mapper
public interface InsaDao {
	
	public List<InsaDto> listSearchCriteria(PageMaker pm) throws Exception;
	public int listSearchCount(PageMaker pm) throws Exception;
	public void insert(InsaDto dto) throws Exception;
	public void update(InsaDto dto) throws Exception;
	public InsaDto detail(int sabun) throws Exception;
	public void delete(int sabun) throws Exception;
	public int idCheck(String id) throws Exception;
	public List<InsaComDto> selectCom() throws Exception;
	public List<InsaInfoDto> selectGrid(int sabun) throws Exception;
}
