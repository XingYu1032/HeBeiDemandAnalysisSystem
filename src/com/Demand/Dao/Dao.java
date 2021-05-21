/**  
* <p>Title: Dao.java</p>  
* <p>Description: </p>  
* <p>Copyright: Copyright (c) 2020</p>   
* @author CuiXingYu  
* @date 2020年10月5日  
* @version 1.0  
*/  
package com.Demand.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.Demand.Bean.Eiq;
import com.Demand.Bean.User;
import com.Demand.DBUtil.DBUtil;

/**  
* <p>Title: Dao.java</p>  
* <p>Description: </p>  
* <p>Copyright: Copyright (c) 2020</p>   
* @author CuiXingYu  
* @date 2020年10月5日  
* @version 1.0  
*/
public class Dao {


	/**  
	 * <p>Title: login</p>  
	 * <p>Description: </p>  
	 * @param user
	 * @return  
	 * @throws SQLException 
	 */  
	public static int register(User user) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstmt=null;
		PreparedStatement pstmts=null;
		Statement state=null;
		ResultSet rs=null;
		
		try {
			con=DBUtil.getConn();
			String sql_query="select * from users where username = '"+user.getUsername()+"'";
			pstmts=con.prepareStatement(sql_query);
			rs=pstmts.executeQuery();
			if(rs.next() == true) {
				System.out.println("用户名已存在!");
				return 0;
			}
			else
			{
				//String sql="insert into users(username,pwd,jigou,jigoucode,address,wangzhi,email) values(?,?,?,?,?,?,?)";
				//String sql_check = "insert into user(username,pwd,jigou,jigoucode,address,wangzhi,email,postcode,lianxiren,phone,types,bumen,desc,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				//String sql="insert into users(username,pwd,postcode,lianxiren,phone,bumen,descs) values(?,?,?,?,?,?,?)";
				String sql = "insert into users(username,pwd,jigou,jigoucode,address,wangzhi,email,stand,postcode,lianxiren,phone,types,bumen,descs,status,guhua,chuanzhen,role) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				System.out.println(sql);
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, user.getUsername());
				pstmt.setString(2, user.getPwd());
				pstmt.setString(3, user.getJigou());
				pstmt.setString(4, user.getJigoucode());
				pstmt.setString(5, user.getAddress());
				pstmt.setString(6, user.getWangzhi());
				pstmt.setString(7, user.getEmail());
				pstmt.setString(8, user.getStand());
				pstmt.setString(9, user.getPostcode());	
				pstmt.setString(10, user.getLianxiren());
				pstmt.setString(11, user.getPhone());
				pstmt.setString(12, user.getTypes());
				pstmt.setString(13, user.getBumen());
				pstmt.setString(14, user.getDesc());
				pstmt.setString(15,"1");
				pstmt.setString(16,user.getGuhua());
				pstmt.setString(17,user.getChuanzhen());
				pstmt.setString(18,"用户");
				pstmt.executeUpdate();
				
				System.out.println("成功注册!");
				return 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("未连接");
		}
		finally {
         DBUtil.close(con, pstmt, rs);
         DBUtil.close(con, pstmts, rs);
		}
		return 0;
	}

	/**  
	 * <p>Title: login_check</p>  
	 * <p>Description: </p>  
	 * @param name
	 * @param pwd
	 * @return   
	 */  
	public static int login_check(String name, String pwd) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			con=DBUtil.getConn();
			String sql_query="select * from users where username = '"+name+"' and pwd = '"+pwd+"' and status != 0";
			System.out.println(sql_query);
			pstmt=con.prepareStatement(sql_query);
			rs=pstmt.executeQuery();
			if(rs.next()==false)
			{
				System.out.println("用户名或密码错误");
				return 0;
			}
			else
			{
				System.out.println("用户名及密码正确");
				return 1;
			}
		}
		catch (SQLException e) {
			System.out.println("未连接");
			e.printStackTrace();
		}
		finally {
		DBUtil.close(con, pstmt, rs);
		}
		
		
		
		return 0;
	}

	/**  
	 * <p>Title: getUserByUsername</p>  
	 * <p>Description: </p>  
	 * @param name
	 * @return  
	 */  
	public static User getUserByUsername(String name) {
		// TODO Auto-generated method stub
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet rs=null;
		String sql="select * from users where username='"+name+"'";
		try {
			connection=DBUtil.getConn();
			preparedStatement=connection.prepareStatement(sql);
			rs=preparedStatement.executeQuery();
			User user1=new User();
			if(rs.next())
			{
				//user1.setId(rs.getInt("id"));
				user1.setUsername(rs.getString("username"));
				user1.setPwd(rs.getString("pwd"));
				user1.setJigou(rs.getString("jigou"));
				user1.setJigoucode(rs.getString("jigoucode"));
				user1.setAddress(rs.getString("address"));
				user1.setWangzhi(rs.getString("wangzhi"));
				user1.setEmail(rs.getString("email"));
				user1.setStand(rs.getString("stand"));
				user1.setPostcode(rs.getString("postcode"));
				user1.setLianxiren(rs.getString("lianxiren"));
				user1.setPhone(rs.getString("phone"));
				user1.setTypes(rs.getString("types"));
				user1.setBumen(rs.getString("bumen"));
				user1.setDesc(rs.getString("descs"));
				//user1.setPermissionId(rs.getInt("permissionId"));
				System.out.println(user1);
			}
			return user1;
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		finally {
			DBUtil.close(connection, preparedStatement,rs);
		}
		
		return null;
	}

	/**  
	 * <p>Title: insert_eiq</p>  
	 * <p>Description: </p>  
	 * @param eiq
	 * @return  
	 */  
	public static int insert_eiq(Eiq eiq) {
		// TODO Auto-generated method stub
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=DBUtil.getConn();
		try {
			String sql = "insert into eiq"
					+ "(sfsh,jgmc,txdz,dwwz,dzyx"
					+ ",frdb,yzbm,lxr,gddh,yddh"
					+ ",cz,jgsx,jgjj,jsxqmc,qsxqnf"
					+ ",jzxqnf,zdkjxqgs,gjz,yjlx,xkfl"
					+ ",xqjsssly,qtjsms,xqjsyyhy,jhtz,qytz"
					+ ",yhdk,qtrz) values"
					+ "(?,?,?,?,?"
					+ ",?,?,?,?,?"
					+ ",?,?,?,?,?"
					+ ",?,?,?,?,?"
					+ ",?,?,?,?,?,"
					+ "?,?)";
			
			
			//String sql="insert into eiq (sfsh,jgmc,txdz,dwwz,dzyx) values (?,?,?,?,?)";
			System.out.println(sql);
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, 0);
			pstmt.setString(2, eiq.getJgmc());
			pstmt.setString(3, eiq.getTxdz());
			pstmt.setString(4, eiq.getDwwz());
			pstmt.setString(5, eiq.getDzyx());
			pstmt.setString(6, eiq.getFrdb());
			pstmt.setString(7, eiq.getYzbm());
			pstmt.setString(8, eiq.getLxr());
			pstmt.setString(9, eiq.getGddh());
			pstmt.setString(10, eiq.getYddh());  // ??
			pstmt.setString(11, eiq.getCz());
			pstmt.setString(12, eiq.getJgsx());
			pstmt.setString(13, eiq.getJgjj());//??  
			pstmt.setString(14, "技术需求合作模式"); //??
			pstmt.setInt(15, eiq.getQsxqnf());
			pstmt.setInt(16, eiq.getJzxqnf());
			pstmt.setString(17, eiq.getZdkjxqgs());
			pstmt.setString(18, eiq.getGjz());
			pstmt.setString(19, eiq.getYjlx());
			pstmt.setString(20, eiq.getXkfl());
			pstmt.setString(21, "需求技术所属领域"); //eiq.getXqjsssly() ??
			pstmt.setString(22, "其他技术");  //?? getQtjsms
			pstmt.setString(23, eiq.getXqjsyyhy()); //??
			pstmt.setInt(24, eiq.getJhcz());
			pstmt.setInt(25, 0);
			pstmt.setInt(26, 0);
			pstmt.setInt(27, 0);
			pstmt.executeUpdate();
			System.out.println("问卷填写完成");
			return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(con, pstmt, rs);;
		}
		
		return 0;
	}

	public static int update_pwd(String username, String opwd, String npwd) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn=DBUtil.getConn();
		
		try {
			
			String sql= "update users set pwd ='"+npwd+"' where username='"+username+"' and pwd = '"+opwd+"'";		
			int a=conn.prepareStatement(sql).executeUpdate();			
			//System.out.println(a+"a的值");
			return a;
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
		return 0;
		

}

	public static int update_info(User user) {
		// TODO Auto-generated method stub
		Connection con=DBUtil.getConn();
		PreparedStatement pstmt=null;
		
		try {
			String str_sle="select * from users where username = '"+user.getUsername() +"'";
			ResultSet rs=con.prepareStatement(str_sle).executeQuery();
			rs.next();
			String status=rs.getString("status");
			String role=rs.getString("role");
			System.out.println(status+" status ");
			rs.close();
			String str_del="delete from users where username = '"+user.getUsername() +"'";
			con.prepareStatement(str_del).executeUpdate();
			String sql = "insert into users(username,pwd,jigou,jigoucode,address,wangzhi,email,stand,postcode,lianxiren,phone,types,bumen,descs,status,guhua,chuanzhen,role) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			System.out.println(str_del);
			System.out.println(sql);
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getJigou());
			pstmt.setString(4, user.getJigoucode());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getWangzhi());
			pstmt.setString(7, user.getEmail());
			pstmt.setString(8, user.getStand());
			pstmt.setString(9, user.getPostcode());	
			pstmt.setString(10, user.getLianxiren());
			pstmt.setString(11, user.getPhone());
			pstmt.setString(12, user.getTypes());
			pstmt.setString(13, user.getBumen());
			pstmt.setString(14, user.getDesc());
			pstmt.setString(15,status);
			pstmt.setString(16,user.getGuhua());
			pstmt.setString(17,user.getChuanzhen());
			pstmt.setString(18,role);
			pstmt.executeUpdate();
			System.out.println("修改成功!");
			con.close();
			return 1;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static void xh_check(String user, String shenhe, String jieguo, String reason) {
		
		Connection conn=DBUtil.getConn();
		PreparedStatement pstmt=null;
		
		
		String sql="insert into checks (usercheck,user,xscheck,reason) values (?,?,?,?)";
		try {
			//conn.prepareStatement(sql).execute();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shenhe);
			pstmt.setString(2, user);
			pstmt.setString(3, jieguo);
			if(jieguo.equals("形式审核未通过")) {
				pstmt.setString(4, reason);
			}else {
				pstmt.setString(4, "无");
			}
			pstmt.executeUpdate();;
			System.out.println("审核成功");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("审核失败");
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
		
	}

	public static int update_qx(String username, String quanxian) {
		// TODO Auto-generated method stub
		
		Connection conn=DBUtil.getConn();
		
		String sql="update users set role='"+quanxian +"' where username ='"+username+"'";
		
		try {
			int a=conn.prepareStatement(sql).executeUpdate();
			return a;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public static int xq_fenlei(String inamenum, String bumen) {
		// TODO Auto-generated method stub
		
		Connection conn=DBUtil.getConn();
		
		String bm=null;
		try {
			String sql_select= "select * from bumen where id='"+bumen+"'";
			ResultSet rs=conn.prepareStatement(sql_select).executeQuery();
			while(rs.next()) {
				bm=rs.getString("name");
			}
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			String sql_update="update checks set belong='"+bm+"' where user ='"+inamenum+"'";
			int a= conn.prepareStatement(sql_update).executeUpdate();
			
			
			String sql_update2="update xuqiu set belong='"+bm+"' where user ='"+inamenum+"'";
			
			//System.out.println(a+"    4548");
			return a;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return 0;
	}
}
