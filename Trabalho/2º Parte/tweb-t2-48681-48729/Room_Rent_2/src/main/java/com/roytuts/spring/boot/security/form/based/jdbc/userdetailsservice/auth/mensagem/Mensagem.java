/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.mensagem;

/**
 *
 * @author rodrigo
 */
public class Mensagem {
    
    private Integer aid_m;
    private String message;
    private String emissor;
    private Integer aid_a;
    
    public Mensagem() {
    }

    public Mensagem(Integer aid_m, String message, String emissor, Integer aid_a) {
        this.aid_m = aid_m;
        this.message = message;
        this.emissor = emissor;
        this.aid_a = aid_a;
    }
    
    public Integer getAidM(){
        return this.aid_m;
    }
    
    public String getmensagem(){
        return this.message;
    } 
    
    public String getemissor(){
        return this.emissor;
    } 
    
    public Integer getAidA(){
        return this.aid_a;
    }
}
