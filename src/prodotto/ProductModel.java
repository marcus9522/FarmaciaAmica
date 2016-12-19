package prodotto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface ProductModel {
	
	public ProductBean doRetrieveByKey(String name) throws SQLException;
	public Collection<ProductBean> doRetrieveAll() throws SQLException;
	public Collection<ProductBean> leggiprodotto(String email) throws SQLException;
	public Collection<ProductBean> filtra(String order,double min,double max,String tipologia) throws SQLException;
}
