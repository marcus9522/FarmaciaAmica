package prodotto;

public class ProductBean {

	private String nomeProdotto,descrizione,foto,categoria;
	private double prezzo;

	public ProductBean() {
		nomeProdotto = "";
		prezzo = 0;
		descrizione = "";
		foto="";
		categoria = "";
	}
	


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
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
