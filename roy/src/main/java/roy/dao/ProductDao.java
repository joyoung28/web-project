package roy.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import roy.model.Product;
import roy.model.Rmember;

public class ProductDao {
	// singleton
	private static ProductDao instance = new ProductDao();
	private ProductDao() { }
	public static ProductDao getInstance() {
		return instance;
	}
	
	//Session 생성 DB 연결
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			reader.close();
		} catch (Exception e) {
			System.out.println("Product Session 생성 : " + e.getMessage());
		}
	}
	public int insert(Product product) {
		int result = 0;
		result = session.insert("productns.insert", product);
		//session.commit();		
		return result;
	}

	public List<Product> selectList() {
        List<Product> list = session.selectList("productns.selectList");
        System.out.println("list :" + list);
        return list;
    }

	

	/*
	 * public int selectMax() { int p_num2 = 0;
	 * 
	 * p_num2 = (int) session.selectOne("productns.selectMax");
	 * 
	 * return p_num2; }
	 */
	/*
	 * public int updateImgName(int p_num, String p_img) { int result = 0;
	 * HashMap<String, Object> hm = new HashMap<>(); hm.put("p_num", p_num);
	 * hm.put("p_img", p_img);
	 * 
	 * result = session.update("productns.updateImgName", hm); return result; }
	 */
	
	
}
