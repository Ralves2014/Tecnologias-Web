/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.anuncio;


/**
 *
 * @author rodrigo
 */

public class Anuncio {
    
    private Integer aid;
    private String localizacao;
    private Integer preco;
    private String data;
    private String genero;
    private String anunciante;
    private String tipo_alojamento;
    private String tipoanuncio;
    private String contacto;
    private String detalhes;
    private String estado;
    
    public Anuncio(){
    }
    
    public Anuncio(Integer aid, String localizacao, Integer preco, String data, String genero, String anunciante, String tipo_alojamento, String tipo_anuncio, String contacto, String detalhes, String estado){
        this.aid = aid;
        this.localizacao=localizacao;
        this.preco=preco;
        this.data=data;
        this.genero=genero;
        this.anunciante=anunciante;
        this.tipo_alojamento=tipo_alojamento;
        this.tipoanuncio=tipo_anuncio;
        this.contacto = contacto;
        this.detalhes = detalhes;
        this.estado=estado;
    }
    
    public Integer getaid(){
        return aid;
    }

    public String getlocalizacao(){
        return localizacao;
    }

    public Integer getpreco(){
        return preco;
    }

    public String getdata(){
        return data;
    }

    public String getgenero(){
        return genero;
    }

    public String getanunciante(){
        return anunciante;
    }

    public String gettipo_alojamento(){
        return tipo_alojamento;
    }

    public String gettipo_anuncio(){
        return tipoanuncio;
    }

    public String getestado(){
        return estado;
    }
    
    public void set_estado(String estado){
        this.estado=estado;
    }
    
    public String getcontacto(){
        return contacto;
    }
    
    public String getdetalhes(){
        return detalhes;
    }
}
