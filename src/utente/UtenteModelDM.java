package utente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import it.unisa.DriverManagerConnectionPool;
import utente.UtenteBean;
import utente.UtenteModelDM;

public class UtenteModelDM implements UtenteModel {
	private static final String TABLE_NAME = "cliente";

	public synchronized void doSave(UtenteBean utente) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + UtenteModelDM.TABLE_NAME
				+ " (NOME, COGNOME, EMAIL, PASS, DATANASCITA, CAP, CIVICO, VIA, CITTA, PROVINCIA) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, utente.getNome());
			preparedStatement.setString(2,utente.getCognome());
			preparedStatement.setString(3, utente.getEmail());
			preparedStatement.setString(4,utente.getPassword());
			preparedStatement.setDate(5, utente.getData_nascita());
			preparedStatement.setInt(6, utente.getCap());
			preparedStatement.setInt(7, utente.getCivico());
			preparedStatement.setString(8, utente.getVia());
			preparedStatement.setString(9, utente.getCitta());
			preparedStatement.setString(10, utente.getProvincia());
			preparedStatement.executeUpdate();

			//connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
	
	public synchronized String Email(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<UtenteBean> Email = new LinkedList<UtenteBean>();

		String selectSQL = "SELECT * FROM " + UtenteModelDM.TABLE_NAME;
        String found="false";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				UtenteBean bean = new UtenteBean();

				bean.setEmail(rs.getString("EMAIL"));
				Email.add(bean);
			}
			if (Email != null && Email.size() != 0) {
				Iterator<UtenteBean> it = Email.iterator();
				while (it.hasNext()) {
					UtenteBean bean = (UtenteBean) it.next();
					if(bean.getEmail().equals(email)){found="true";
					                                  break;
					                                 }
		}
			}
		}
		
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return found;
	  }
	
	public synchronized String login(String email,String password) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<UtenteBean> user = new LinkedList<UtenteBean>();

		String selectSQL = "SELECT * FROM " + UtenteModelDM.TABLE_NAME;
        String found="false";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				UtenteBean bean = new UtenteBean();
				bean.setEmail(rs.getString("email"));
				bean.setPassword(rs.getString("PASS"));
				user.add(bean);
			}
			if (user != null && user.size() != 0) {
				Iterator<UtenteBean> it = user.iterator();
				while (it.hasNext()) {
					UtenteBean bean = (UtenteBean) it.next();
					if((bean.getEmail().equals(email))&&(bean.getPassword().equals(password))){found="true";
					                                                                           break;
					                                                                          }
		}
			}
		}
		
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return found;
	  }
}
