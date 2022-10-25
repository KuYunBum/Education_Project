package com.pinosoft.Education.Controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pinosoft.Education.Dto.InsaDto;
import com.pinosoft.Education.Dto.InsaInfoDto;
import com.pinosoft.Education.Service.InsaService;
import com.pinosoft.Education.Vo.PageMaker;


@Controller
public class InsaController{
	
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private InsaService insaService;
	
	@RequestMapping("/")
	public String main() throws Exception {
		return "main";
	}

//	@RequestMapping("/listAll")
//	public void listAll(Model model) throws Exception {
//		
//		model.addAttribute("list", insaService.listAll());
//	}
	
	@GetMapping("/select")
	public void select(PageMaker pm, Model model) throws Exception {
		model.addAttribute("comList", insaService.selectCom());
		model.addAttribute("list",insaService.listSearchCriteria(pm));
		pm.setTotalCount(insaService.listSearchCount(pm));
		
	}
	
	@GetMapping("/insert")
	public void insert(Model model) throws Exception {
		model.addAttribute("comList", insaService.selectCom());
	}
	
	@PostMapping("/insert")
	public String insert(InsaDto dto, RedirectAttributes rttr, 
			@RequestParam(value = "cmp_reg_image1", required = false) MultipartFile cmp_reg_image,
			@RequestParam(value = "profile_image1", required = false) MultipartFile profile_image,
			@RequestParam(value = "carrier1", required = false) MultipartFile carrier,
			HttpServletRequest req) throws Exception {
		
		if (!profile_image.isEmpty()) {
			// 저장될 실제 경로 구하기
			String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + profile_image.getOriginalFilename();
			File file = new File(filePath, saveName);
			profile_image.transferTo(file);
			dto.setProfile(saveName);
			dto.setProfile_image(saveName);
		}
		if (!cmp_reg_image.isEmpty()) {
			String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + cmp_reg_image.getOriginalFilename();
			File file = new File(filePath, saveName);
			cmp_reg_image.transferTo(file);
			dto.setCmp_reg_image(saveName);
			System.out.println(filePath);
		}
		if (!carrier.isEmpty()) {
			// 저장될 실제 경로 구하기
			String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);

			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + carrier.getOriginalFilename();
			File file = new File(filePath, saveName);
			carrier.transferTo(file);
			dto.setCarrier(saveName);
			dto.setCarrier_image(saveName);
		}
		insaService.insert(dto);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:insert";
	}
	
	@GetMapping("/update")
	public void update(int sabun, Model model) throws Exception {
		model.addAttribute(insaService.detail(sabun));
		model.addAttribute("comList", insaService.selectCom());
	}
	
	@PostMapping("/update")
	public String update(InsaDto dto, PageMaker pm, RedirectAttributes rttr,
			@RequestParam(value = "cmp_reg_image1", required = false) MultipartFile cmp_reg_image,
			@RequestParam(value = "cmp_reg_image2", required = false) String cmp_reg_image2,
			@RequestParam(value = "profile_image1", required = false) MultipartFile profile_image,
			@RequestParam(value = "profile_image2", required = false) String profile_image2,
			@RequestParam(value = "carrier1", required = false) MultipartFile carrier,
			@RequestParam(value = "carrier2", required = false) String carrier2,
			
			HttpServletRequest req) throws Exception {
		if (!profile_image.isEmpty()) {
			// 저장될 실제 경로 구하기
			String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + profile_image.getOriginalFilename();
			File file = new File(filePath, saveName);
			profile_image.transferTo(file);
			dto.setProfile(saveName);
			dto.setProfile_image(saveName);
			File delFile = new File(filePath, profile_image2);
			delFile.delete();
		}else {
			dto.setProfile(profile_image2);
			dto.setProfile_image(profile_image2);
		}
		if (!cmp_reg_image.isEmpty()) {
			String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + cmp_reg_image.getOriginalFilename();
			File file = new File(filePath, saveName);
			cmp_reg_image.transferTo(file);
			dto.setCmp_reg_image(saveName);
			File delFile = new File(filePath, cmp_reg_image2);
			delFile.delete();
		}else {
			dto.setCmp_reg_image(cmp_reg_image2);
		}
		if (!carrier.isEmpty()) {
			// 저장될 실제 경로 구하기
			String filePath = req.getServletContext().getRealPath(DEFAULT_PATH);

			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + carrier.getOriginalFilename();
			File file = new File(filePath, saveName);
			carrier.transferTo(file);
			dto.setCarrier(saveName);
			dto.setCarrier_image(saveName);
			File delFile = new File(filePath, carrier2);
			delFile.delete();
		}else {
			dto.setCarrier(carrier2);
			dto.setCarrier_image(carrier2);
		}
		insaService.update(dto);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:select?page=1&perPageNum=10&sabun=&name=&join_gbn_code=&put_yn=&pos_gbn_code=&join_day=&retire_day=&job_type=";
	}
	
	@GetMapping("/delete")
	public String delete(int sabun, RedirectAttributes rttr) throws Exception {
		insaService.delete(sabun);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:select?page=1&perPageNum=10&sabun=&name=&join_gbn_code=&put_yn=&pos_gbn_code=&join_day=&retire_day=&job_type=";
	}
	
	@PostMapping("/delete")
	public String delete(HttpServletRequest req) throws Exception {
		
		String[] ajaxMsg = req.getParameterValues("valueArr");
		int[] num = new int[ajaxMsg.length];
		for(int i=0; i<ajaxMsg.length; i++) {
			num[i] = Integer.parseInt(ajaxMsg[i]);
		}
        for(int i=0; i<num.length; i++) {
        	
        	insaService.delete(num[i]);
        }
		return "redirect:select?page=1&perPageNum=10&sabun=&name=&join_gbn_code=&put_yn=&pos_gbn_code=&join_day=&retire_day=&job_type=";
	}
	
	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(String id) throws Exception {
		
		int result = insaService.idCheck(id);
		return result;
	}
	
	@GetMapping("/download")
	public void download(int sabun, HttpServletResponse response, HttpServletRequest req) throws Exception {
		InsaDto dto = insaService.detail(sabun);
		String fileName = dto.getCarrier();
        try {
        	String filePath = req.getServletContext().getRealPath(DEFAULT_PATH)+fileName;
        	
        	File file = new File(filePath);
        	response.setHeader("Content-Disposition", "attachment;filename=" + file.getName()); // 다운로드 되거나 로컬에 저장되는 용도로 쓰이는지를 알려주는 헤더
        	
        	FileInputStream fileInputStream = new FileInputStream(filePath); // 파일 읽어오기 
        	OutputStream out = response.getOutputStream();
        	
        	int read = 0;
                byte[] buffer = new byte[1024];
                while ((read = fileInputStream.read(buffer)) != -1) { // 1024바이트씩 계속 읽으면서 outputStream에 저장, -1이 나오면 더이상 읽을 파일이 없음
                    out.write(buffer, 0, read);
                }
                fileInputStream.close();
        } catch (Exception e) {
            throw new Exception("download error");
        }
    }
	
	@PostMapping("/grid")
	@ResponseBody
	public List<InsaInfoDto> gridPOST(int sabun, Model model) throws Exception {
		
		List<InsaInfoDto> listData = insaService.selectGrid(sabun);
		model.addAttribute("list",listData);
		return listData;
	}
	
	
}
