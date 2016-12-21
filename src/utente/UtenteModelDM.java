package utente;

import java.sql.Connection;
import java.sql.Date;
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
	
	 
	 public synchronized UtenteBean LeggiUtente(String email) throws SQLException{
			Connection connection = null;
			PreparedStatement preparedStatement = null;
	        UtenteBean bean = new UtenteBean();
			String selectSQL = "SELECT * FROM " + UtenteModelDM.TABLE_NAME + " WHERE EMAIL = ? ";
			try {
				connection = DriverManagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, email);
				ResultSet rs = preparedStatement.executeQuery();
				while(rs.next()){
					bean.setEmail(rs.getString("email"));
					bean.setNome(rs.getString("nome"));
					bean.setCognome(rs.getString("cognome"));
					bean.setPassword(rs.getString("pass"));
					bean.setCap(Integer.valueOf(rs.getString("cap")));
					bean.setVia(rs.getString("via"));
					bean.setCivico(Integer.valueOf(rs.getString("civico")));
					bean.setCitta(rs.getString("citta"));
					bean.setProvincia(rs.getString("provincia"));
					bean.setData_nascita(Date.valueOf(rs.getString("DataNascita")));
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
	 
	 public void doUpdate(UtenteBean utente) throws SQLException{
			Connection connection = null;
			PreparedStatement preparedStatement = null;

			String updateSQL = " UPDATE " + UtenteModelDM.TABLE_NAME + " SET PASS = ?, NOME = ?, COGNOME = ?, DATANASCITA = ?, CAP = ?, VIA = ?, CIVICO = ?, CITTA = ?, PROVINCIA = ?" + " WHERE EMAIL = ?";
			try {
				connection = DriverManagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(updateSQL);
				preparedStatement.setString(1, utente.getPassword());
				preparedStatement.setString(2, utente.getNome());
				preparedStatement.setString(3, utente.getCognome());
				preparedStatement.setDate(4, utente.getData_nascita());
				preparedStatement.setInt(5, utente.getCap());
				preparedStatement.setString(6, utente.getVia());
				preparedStatement.setInt(7, utente.getCivico());
				preparedStatement.setString(8, utente.getCitta());
				preparedStatement.setString(9, utente.getProvincia());
				preparedStatement.setString(10, utente.getEmail());

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
			
			public synchronized boolean doDelete(String email) throws SQLException {
				Connection connection = null;
				PreparedStatement preparedStatement = null;

				int result = 0;

				String deleteSQL = "DELETE FROM " + UtenteModelDM.TABLE_NAME + " WHERE EMAIL = ?";

				try {
					connection = DriverManagerConnectionPool.getConnection();
					preparedStatement = connection.prepareStatement(deleteSQL);
					preparedStatement.setString(1, email);

					result = preparedStatement.executeUpdate();

				} finally {
					try {
						if (preparedStatement != null)
							preparedStatement.close();
					} finally {
						DriverManagerConnectionPool.releaseConnection(connection);
					}
				}
				return (result != 0);
			}
		}
	