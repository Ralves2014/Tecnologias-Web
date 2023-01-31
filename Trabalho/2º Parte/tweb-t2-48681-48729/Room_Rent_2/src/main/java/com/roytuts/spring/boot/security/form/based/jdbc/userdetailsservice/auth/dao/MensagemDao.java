/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.dao;

import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.mensagem.Mensagem;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.rowmapper.MensagemRowMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author rodrigo
 */
@Repository
public class MensagemDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public Mensagem getMensagem(final Integer aid_m) {
        return jdbcTemplate.queryForObject(
                "select m.aid_m aid_m, m.message message, m.emissor emissor, m.aid_a aid_a from mensagem m where aid_m = ?",
                new Integer[]{aid_m}, new MensagemRowMapper());
    }
    
     public void saveMensagem(final Mensagem m) {
        String sql = "INSERT INTO mensagem VALUES ('"
                + m.getAidM()+ "','"
                + m.getmensagem() + "','"
                + m.getemissor()+ "','"
                + m.getAidA()+ "')";
        jdbcTemplate.execute(sql);
  
        System.out.println("MensagemDao - saved\n" + sql + "\n");
    }
    public List<Integer> getAidMList() {
        return jdbcTemplate.queryForList("select aid_m FROM mensagem", Integer.class);
    }
}
