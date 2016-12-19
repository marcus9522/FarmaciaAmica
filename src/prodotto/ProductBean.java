package prodotto;

public class ProductBean {

	String nomeProdotto;
	double prezzo;
	String descrizione;
    String foto;

	public ProductBean() {
		nomeProdotto = "";
		prezzo = 0;
		descrizione = "";
		foto="";
	}
	

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}


	public String getNome() {
		return nomeProdotto;
	}



	public void setNome(String nome) {
		nomeProdotto = nome;
	}



	public double getPrezzo() {
		return prezzo;
	}



	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public String getDescrizione() {
		return descrizione;
	}



	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	@Override
	public String toString() {
		return nomeProdotto + " " + descrizione + " " + prezzo + " " + foto  ;
	}

}
