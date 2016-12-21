package acquista;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import acquista.Cart;
import it.unisa.DriverManagerConnectionPool;
import prodotto.ProductBean;
import prodotto.ProductModelDM;

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

	public synchronized Collection<ProductBean> leggi(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		String selectSQL = "Select distinct prodotti.* from acquista,prodotti where acquista.NomeProdotto=prodotti.NomeProdotto and email= ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setNome(rs.getString("NomeProdotto"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setFoto(rs.getString("FOTO"));
				products.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return products;
	}
}
