package prodotto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import it.unisa.DriverManagerConnectionPool;

public class ProductModelDM implements ProductModel {

	private static final String TABLE_NAME = "prodotti";

	@Override
	public synchronized ProductBean doRetrieveByKey(String nome) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME + " WHERE NomeProdotto = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nome);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setNome(rs.getString("NomeProdotto"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setFoto(rs.getString("FOTO"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return bean;
	}


	@Override
	public synchronized Collection<ProductBean> doRetrieveAll() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME;
		

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setNome(rs.getString("NomeProdotto"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setFoto(rs.getString("FOTO"));
				products.add(bean);
			}
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return products;
	  }
	
	
	public synchronized Collection<ProductBean> filtra(String order,double min,double max,String tipologia) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
        boolean first=true;
		Collection<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductModelDM.TABLE_NAME;
		if (min != 0) {
			if(first==true){selectSQL += " WHERE ";
                            first=false;			 
			                }
			else selectSQL+= " AND ";
			selectSQL += " prezzo>= " + min;
		}
		if (max != 0) {
			if(first==true){selectSQL += " WHERE ";
                            first=false;			 
			                }
			else selectSQL+= " AND ";
			selectSQL += " prezzo<= " + max;
		}
		if (tipologia != " ") {
			if(first==true){selectSQL += " WHERE ";
                            first=false;			 
			                }
			else selectSQL+= " AND ";
			selectSQL += " tipologia = " + tipologia;
		}
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setNome(rs.getString("NomeProdotto"));
				bean.setDescrizione(rs.getString("DESCRIZIONE"));
				bean.setPrezzo(rs.getDouble("PREZZO"));
				bean.setFoto(rs.getString("FOTO"));
				products.add(bean);
			}
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return products;
	  }


	@Override
	public Collection<ProductBean> leggiprodotto(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		Collection<ProductBean> prodotti = new LinkedList<ProductBean>();
		String selectSQL = "select * from prodotti,acquista where prodotti.NomeProdotto = acquista.NomeProdotto and acquista.Email = ?";
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
				prodotti.add(bean);
			}
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return prodotti;
		}
	
	
	
	
	}
