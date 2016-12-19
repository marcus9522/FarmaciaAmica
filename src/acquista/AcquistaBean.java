package acquista;

public class AcquistaBean {
	private String email, nomeprodotto;

	public AcquistaBean() {
	}

	public AcquistaBean(String email, String nomeprodotto) {
		super();
		this.email = email;
		this.nomeprodotto = nomeprodotto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNomeprodotto() {
		return nomeprodotto;
	}

	public void setNomeprodotto(String nomeprodotto) {
		this.nomeprodotto = nomeprodotto;
	}

}
