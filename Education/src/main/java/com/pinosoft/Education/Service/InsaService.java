package com.pinosoft.Education.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pinosoft.Education.Dao.InsaDao;
import com.pinosoft.Education.Dto.InsaComDto;
import com.pinosoft.Education.Dto.InsaDto;
import com.pinosoft.Education.Dto.InsaInfoDto;
import com.pinosoft.Education.Vo.PageMaker;

@Service
public class InsaService {
	
	@Autowired
	private InsaDao insaDao;
	
	public List<InsaDto> listSearchCriteria(PageMaker pm) throws Exception {
		return insaDao.listSearchCriteria(pm);
	}

	public int listSearchCount(PageMaker pm) throws Exception {
		return insaDao.listSearchCount(pm);
	}
	
	public void insert(InsaDto dto) throws Exception{
		insaDao.insert(dto);
	}
	
	public void update(InsaDto dto) throws Exception{
		insaDao.update(dto);
	}
	
	public InsaDto detail(int sabun) throws Exception{
		return insaDao.detail(sabun);
	}
	
	public void delete(int sabun) throws Exception{
		insaDao.delete(sabun);
	}
	
	public int idCheck(String id) throws Exception{
		return insaDao.idCheck(id);
	}
	
	public List<InsaComDto> selectCom() throws Exception{
		return insaDao.selectCom();
	}
	
	public List<InsaInfoDto> selectGrid(int sabun) throws Exception{
		return insaDao.selectGrid(sabun);
	}
}
