package model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PatientAPI")
public class PatientAPI extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	Patient patientObj = new Patient();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
			
		String output = patientObj.insertPatient(request.getParameter("patientName"),
				request.getParameter("address"),
				request.getParameter("email"),
				request.getParameter("age"),
				request.getParameter("channelledDocName"),
				request.getParameter("phoneNo"));
		
		response.getWriter().write(output);
	}
	
	
	private static Map<String, String> getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		try 
		{
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			
			String[] params = queryString.split("&");
			for(String param : params)
			{
				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
			
		} catch (Exception e) {
			
		}
		
		return map;
		
	}
	
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		Map<String, String> paras = getParasMap(request);
		
		String output = patientObj.updatePatient(paras.get("hidpatientIdSave").toString(), 
			paras.get("patientName").toString(),
			paras.get("address").toString(),
			paras.get("email").toString(),
			paras.get("age").toString(), 
			paras.get("channelledDocName").toString(),
			paras.get("phoneNo").toString());
		response.getWriter().write(output);
	}
	

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		Map<String, String> paras = getParasMap(request);
		
		String output = patientObj.deletePatient(paras.get("patientId").toString());
		
		response.getWriter().write(output);
	}
}
