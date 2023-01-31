/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.dao;

import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.anuncio.Anuncio;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.rowmapper.AnuncioRowMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rodrigo
 */
@Repository
public class AnuncioDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Anuncio getAnuncio(final Integer aid) {
        return jdbcTemplate.queryForObject(
                "select a.aid aid, a.localizacao localizacao, a.preco preco, a.data data, a.genero genero, a.anunciante anunciante, a.tipo_alojamento tipo_alojamento,"
                        + "a.tipoanuncio tipoanuncio, a.contacto contacto, a.detalhes detalhes, a.estado estado from anuncio a where aid = ?",
                new Integer[]{aid}, new AnuncioRowMapper());
    }
    
    public void saveAnuncio(final Anuncio a) {
        String sql = "INSERT INTO anuncio VALUES ('"
                + a.getaid()+ "','"
                + a.getlocalizacao() + "','"
                + a.getpreco()+ "','"
                + a.getdata()+ "','"
                + a.getgenero()+ "','"
                + a.getanunciante()+ "','"
                + a.gettipo_alojamento()+ "','"
                + a.gettipo_anuncio()+ "','"
                + a.getcontacto()+ "','"
                + a.getdetalhes()+ "','"
                + a.getestado() + "')";
        jdbcTemplate.execute(sql);
  
        System.out.println("AnuncioDao - saved\n" + sql + "\n");
    }
    
    public List<Integer> getAidList() {
        return jdbcTemplate.queryForList("select aid FROM anuncio", Integer.class);
    }
    
    public void alterar_estado(final Anuncio a, String estado){
        String sql = "UPDATE anuncio SET estado='"+estado+"' WHERE aid='"+a.getaid()+"'";
        jdbcTemplate.execute(sql);
    }
}
