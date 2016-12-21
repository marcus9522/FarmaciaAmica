package acquista;
import prodotto.ProductBean;
import java.sql.SQLException;
import java.util.Collection;

public interface AcquistaModel {
	public void doSave(String email, Cart cart) throws SQLException;
	public Collection<ProductBean> leggi(String email) throws SQLException;
}
