package TKKHDao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entity.KhachHang;
import entity.TKKH;
@Repository

public class tkkhDAO {
	@Autowired
	private SessionFactory factory;

	public boolean addCustomer(TKKH user, KhachHang customer) {
		boolean check = true;
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(user);
			session.save(customer);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			check = false;
		} finally {
			session.close();
		}
		return check;
	}

}
