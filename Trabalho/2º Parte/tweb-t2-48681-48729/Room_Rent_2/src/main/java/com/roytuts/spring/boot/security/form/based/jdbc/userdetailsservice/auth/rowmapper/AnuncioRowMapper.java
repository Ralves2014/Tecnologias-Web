/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.rowmapper;

import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.anuncio.Anuncio;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author rodrigo
 */
public class AnuncioRowMapper implements RowMapper<Anuncio> {
    
    @Override
    public Anuncio mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Anuncio(rs.getInt("aid"), rs.getString("localizacao"), rs.getInt("preco"),
                rs.getString("data"), rs.getString("genero"), rs.getString("anunciante"), rs.getString("tipo_alojamento"),
                rs.getString("tipoanuncio"), rs.getString("contacto"), rs.getString("detalhes"), rs.getString("estado"));
    }    
}
