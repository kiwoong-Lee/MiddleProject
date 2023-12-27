<%@page import="vo.CommunityVO"%>
<%@page import="com.google.gson.JsonElement"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonObject"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서블릿에서 저장한 데이터 꺼내기
	List<CommunityVO> list = (List<CommunityVO>)request.getAttribute("listvalue");
	int sp = (Integer)request.getAttribute("sp");
	int ep = (Integer)request.getAttribute("ep");
	int tp = (Integer)request.getAttribute("tp");
	int size = (Integer)request.getAttribute("size");
	
	Gson gson = new Gson();
	
	JsonElement ele = gson.toJsonTree(list);
	
	JsonObject jobj = new JsonObject();
	
	jobj.addProperty("sp", sp);
	jobj.addProperty("ep", ep);
	jobj.addProperty("tp", tp);
	jobj.addProperty("size", size);
	jobj.add("list", ele);
	
	response.setContentType("application/json; charset=utf-8");
	
	out.print(jobj);
	
	out.flush();

%>