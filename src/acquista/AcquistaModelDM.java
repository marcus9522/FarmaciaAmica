package acquista;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import acquista.Cart;
import it.unisa.DriverManagerConnectionPool;
import prodotto.ProductBean;

public class AcquistaModelDM implements AcquistaModel {
	private static final String TABLE_NAME = "cliente";
	private static final String TABLE_NAME2 = "acquista";
	private static final String TABLE_NAME3 = "prodotti";

	public synchronized void doSave(String email, Cart cart) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String insertSQL = "INSERT INTO " + AcquistaModelDM.TABLE_NAME2 + " (EMAIL, NOMEPRODOTTO) VALUES (?, ?)";
		try {
			connection = DriverManagerConnectionPool.getConnection();

			List<ProductBean> prodcart = cart.getProducts();
			for (ProductBean beancart : prodcart) {
				preparedStatement = connection.prepareStatement(insertSQL);
				preparedStatement.setString(1, email);
				preparedStatement.setString(2, beancart.getNome());
				preparedStatement.executeUpdate();
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}

}
