package com.ian.media.dao;

import java.util.List;
import java.util.Map;

import com.ian.media.model.Member;

public interface MemberMapper extends BaseDao<Member, String>{
	
	public List<Member> tjjobTitleUsers(Map map);
	
	public List<Member> tjhospitalNameUsers(Map map);
	
	public List<Member> hospitalCount(Map<Object,Object> map);
	
	public List<Member> othersel(Map<Object,Object> map);
	
	public List<Member> otherseltel(Map<Object,Object> map);
	
	public Member selectByPrimaryKey(String params);
	
	public List<Member> telsel(String params);
	
	public List<Member> othertel(Map<Object,Object> map);
	
	public List<Member> getCheck(Map<Object,Object> map);
	
	public int getCheckNum(Map<Object,Object> map);
	
}