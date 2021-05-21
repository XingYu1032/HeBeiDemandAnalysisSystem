package com.Demand.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Demand.Bean.Eiq;
import com.Demand.Dao.Dao;

/**
 * Servlet implementation class eiq
 */
@WebServlet("/eiq")
public class eiq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public eiq() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String jgmc=request.getParameter("jgmc");
		String txdz=request.getParameter("txdz");
		String dwwz=request.getParameter("dwwz");
		String frdb=request.getParameter("frdb");
		String yzbm=request.getParameter("yzbm");
		String lxr=request.getParameter("lxr");
		String gddh=request.getParameter("gddh");
		String yddh=request.getParameter("yddh");
		String dzyx=request.getParameter("dzyx");
		String cz=request.getParameter("cz");
		String jgsx=request.getParameter("jgsx");
		String jgjj=request.getParameter("jgjj");
		String jsxqmc=request.getParameter("jsxqmc");
		String qsxqnf=request.getParameter("qsxqnf");
		String jzxqnf=request.getParameter("jzxqnf");
		String zdkjxqgs=request.getParameter("zdkjxqgs");
		String gjz=request.getParameter("gjz");
		String yjlx=request.getParameter("yjlx");
		String xkfl=request.getParameter("xkfl");
		String xqjsyyhy=request.getParameter("xqjsyyhy");
		String jhtz=request.getParameter("jhtz");
		String qyzc=request.getParameter("qyzc");
		String yhdk=request.getParameter("yhdk");
		String qtrz=request.getParameter("qtrz");
		Eiq eiq = new Eiq();
		
		eiq.setJgmc(jgmc);
		eiq.setTxdz(txdz);
		eiq.setDwwz(dwwz);
		eiq.setDzyx(dzyx);
		eiq.setFrdb(frdb);
		eiq.setYzbm(yzbm);
		eiq.setLxr(lxr);
		eiq.setGddh(gddh);
		eiq.setYddh(yddh);
		eiq.setCz(cz);
		eiq.setJgsx(jgsx);
		eiq.setJgjj(jgjj);
		eiq.setJsxqmc(jsxqmc);
		eiq.setQsxqnf(Integer.valueOf(qsxqnf));
		eiq.setJzxqnf(Integer.valueOf(jzxqnf));
		eiq.setZdkjxqgs(zdkjxqgs);
		eiq.setGjz(gjz);
		eiq.setYjlx(yjlx);
		eiq.setXkfl(xkfl);
		//eiq.setXqjsssly(xqjsssly);
		//eiq.setQtjsms(qtjsms);
		//eiq.setJsxqhzms(jsxqhzms);
		eiq.setJhcz(Integer.valueOf(jhtz));
		//eiq.setQyzc(Integer.valueOf(qyzc));
		//eiq.setYhdk(Integer.valueOf(yhdk));
		//eiq.setQtrz(Integer.valueOf(qtrz));
		//eiq.setXqjsyyhy(xqjsyyhy);
		int a =Dao.insert_eiq(eiq);
		if(a ==1) {
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
		
		
	}

}
