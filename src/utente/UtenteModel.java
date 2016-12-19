package utente;

import java.sql.SQLException;

public interface UtenteModel {

		public void doSave (UtenteBean utente) throws SQLException ;
		
		public String Email(String email) throws SQLException ;
		
		public String login(String email,String password) throws SQLException;
		

}
