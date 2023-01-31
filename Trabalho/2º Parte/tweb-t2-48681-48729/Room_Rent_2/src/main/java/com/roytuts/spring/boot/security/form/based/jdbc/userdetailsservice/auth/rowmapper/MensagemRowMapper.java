/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.rowmapper;

import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.mensagem.Mensagem;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author rodrigo
 */
public class MensagemRowMapper implements RowMapper<Mensagem> {
    
    @Override
    public Mensagem mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Mensagem(rs.getInt("aid_m"), rs.getString("message"), rs.getString("emissor"), rs.getInt("aid_a"));
    }
}
