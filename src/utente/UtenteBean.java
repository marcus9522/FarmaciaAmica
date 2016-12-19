package utente;

import java.sql.Date;

public class UtenteBean {
private String nome,cognome,email,password,via,provincia,citta;
private Date data_nascita;
private int cap,civico;

public UtenteBean(){}

public UtenteBean(String nome, String cognome, String email, String password, String via, String provincia,
		Date data_nascita, int cap, int civico) {
	super();
	this.nome = nome;
	this.cognome = cognome;
	this.email = email;
	this.password = password;
	this.via = via;
	this.provincia = provincia;
	this.data_nascita = data_nascita;
	this.cap = cap;
	this.civico = civico;
}

public String getNome() {
	return nome;
}

public void setNome(String nome) {
	this.nome = nome;
}

public String getCognome() {
	return cognome;
}

public void setCognome(String cognome) {
	this.cognome = cognome;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getVia() {
	return via;
}

public void setVia(String via) {
	this.via = via;
}

public String getProvincia() {
	return provincia;
}

public void setProvincia(String provincia) {
	this.provincia = provincia;
}

public Date getData_nascita() {
	return data_nascita;
}

public void setData_nascita(Date data_nascita) {
	this.data_nascita = data_nascita;
}

public int getCap() {
	return cap;
}

public void setCap(int cap) {
	this.cap = cap;
}

public int getCivico() {
	return civico;
}

public void setCivico(int civico) {
	this.civico = civico;
}

public String getCitta() {
	return citta;
}

public void setCitta(String citta) {
	this.citta = citta;
}




}
