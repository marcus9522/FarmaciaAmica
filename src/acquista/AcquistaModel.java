package acquista;

import java.sql.SQLException;

public interface AcquistaModel {
	public void doSave(String email, Cart cart) throws SQLException;
}
