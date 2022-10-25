package com.pinosoft.Education.Dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class InsaDto {
	
	private int sabun;
	private String name;
	private String eng_name;
	private String id;
	private String pwd;
	private String hp;
	private String phone;
	private String reg_no;
	private String email;
	private String job_type;
	private int years;
	private String sex;
	private int zip;
	private String addr1;
	private String addr2;
	private String pos_gbn_code;
	private String dept_code;
	private int salary;
	private String join_gbn_code;
	private String gart_level;
	private String put_yn;
	private String mil_yn;
	private String mil_type;
	private String mil_level;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mil_startDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mil_endDate;
	private String kosa_reg_yn;
	private String kosa_class_code;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date join_day;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date retire_day;
	private String cmp_reg_no;
	private String crm_name;
	private String cmp_reg_image;
	private String self_intro;
	private String profile;
	private String carrier;
	private String profile_image;
	private String carrier_image;
	public int getSabun() {
		return sabun;
	}
	public void setSabun(int sabun) {
		this.sabun = sabun;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJob_type() {
		return job_type;
	}
	public void setJob_type(String job_type) {
		this.job_type = job_type;
	}
	public int getYears() {
		return years;
	}
	public void setYears(int years) {
		this.years = years;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPos_gbn_code() {
		return pos_gbn_code;
	}
	public void setPos_gbn_code(String pos_gbn_code) {
		this.pos_gbn_code = pos_gbn_code;
	}
	public String getDept_code() {
		return dept_code;
	}
	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getJoin_gbn_code() {
		return join_gbn_code;
	}
	public void setJoin_gbn_code(String join_gbn_code) {
		this.join_gbn_code = join_gbn_code;
	}
	public String getGart_level() {
		return gart_level;
	}
	public void setGart_level(String gart_level) {
		this.gart_level = gart_level;
	}
	public String getPut_yn() {
		return put_yn;
	}
	public void setPut_yn(String put_yn) {
		this.put_yn = put_yn;
	}
	public String getMil_yn() {
		return mil_yn;
	}
	public void setMil_yn(String mil_yn) {
		this.mil_yn = mil_yn;
	}
	public String getMil_type() {
		return mil_type;
	}
	public void setMil_type(String mil_type) {
		this.mil_type = mil_type;
	}
	public String getMil_level() {
		return mil_level;
	}
	public void setMil_level(String mil_level) {
		this.mil_level = mil_level;
	}
	public Date getMil_startDate() {
		return mil_startDate;
	}
	public void setMil_startDate(Date mil_startDate) {
		this.mil_startDate = mil_startDate;
	}
	public Date getMil_endDate() {
		return mil_endDate;
	}
	public void setMil_endDate(Date mil_endDate) {
		this.mil_endDate = mil_endDate;
	}
	public String getKosa_reg_yn() {
		return kosa_reg_yn;
	}
	public void setKosa_reg_yn(String kosa_reg_yn) {
		this.kosa_reg_yn = kosa_reg_yn;
	}
	public String getKosa_class_code() {
		return kosa_class_code;
	}
	public void setKosa_class_code(String kosa_class_code) {
		this.kosa_class_code = kosa_class_code;
	}
	public Date getJoin_day() {
		return join_day;
	}
	public void setJoin_day(Date join_day) {
		this.join_day = join_day;
	}
	public Date getRetire_day() {
		return retire_day;
	}
	public void setRetire_day(Date retire_day) {
		this.retire_day = retire_day;
	}
	public String getCmp_reg_no() {
		return cmp_reg_no;
	}
	public void setCmp_reg_no(String cmp_reg_no) {
		this.cmp_reg_no = cmp_reg_no;
	}
	public String getCrm_name() {
		return crm_name;
	}
	public void setCrm_name(String crm_name) {
		this.crm_name = crm_name;
	}
	public String getCmp_reg_image() {
		return cmp_reg_image;
	}
	public void setCmp_reg_image(String cmp_reg_image) {
		this.cmp_reg_image = cmp_reg_image;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getCarrier() {
		return carrier;
	}
	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}
	public String getProfile_image() {
		return profile_image;
	}
	public void setProfile_image(String profile_image) {
		this.profile_image = profile_image;
	}
	public String getCarrier_image() {
		return carrier_image;
	}
	public void setCarrier_image(String carrier_image) {
		this.carrier_image = carrier_image;
	}
	@Override
	public String toString() {
		return "InsaDto [sabun=" + sabun + ", name=" + name + ", eng_name=" + eng_name + ", id=" + id + ", pwd=" + pwd
				+ ", hp=" + hp + ", phone=" + phone + ", reg_no=" + reg_no + ", email=" + email + ", job_type="
				+ job_type + ", years=" + years + ", sex=" + sex + ", zip=" + zip + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", pos_gbn_code=" + pos_gbn_code + ", dept_code=" + dept_code + ", salary=" + salary
				+ ", join_gbn_code=" + join_gbn_code + ", gart_level=" + gart_level + ", put_yn=" + put_yn + ", mil_yn="
				+ mil_yn + ", mil_type=" + mil_type + ", mil_level=" + mil_level + ", mil_startDate=" + mil_startDate
				+ ", mil_endDate=" + mil_endDate + ", kosa_reg_yn=" + kosa_reg_yn + ", kosa_class_code="
				+ kosa_class_code + ", join_day=" + join_day + ", retire_day=" + retire_day + ", cmp_reg_no="
				+ cmp_reg_no + ", crm_name=" + crm_name + ", cmp_reg_image=" + cmp_reg_image + ", self_intro="
				+ self_intro + ", profile=" + profile + ", carrier=" + carrier + ", profile_image=" + profile_image
				+ ", carrier_image=" + carrier_image + "]";
	}

	
	
}
