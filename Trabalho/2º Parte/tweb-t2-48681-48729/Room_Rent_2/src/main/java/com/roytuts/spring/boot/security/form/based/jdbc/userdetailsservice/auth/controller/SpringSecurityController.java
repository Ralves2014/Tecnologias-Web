package com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.controller;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.anuncio.Anuncio;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.dao.AnuncioDao;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.dao.MensagemDao;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.dao.UserDao;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.mensagem.Mensagem;
import com.roytuts.spring.boot.security.form.based.jdbc.userdetailsservice.auth.model.User;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@Controller
public class SpringSecurityController {

    @Autowired
    private UserDao userDao;
    @Autowired
    private AnuncioDao anuncioDao;
    @Autowired
    private MensagemDao mensagemDao;
    
    Integer count = 109;
    Integer count_m = 1;

    @GetMapping("/index")
    public String defaultPage(Model model, HttpServletRequest req) {
        String username = req.getRemoteUser();
        model.addAttribute("username", username);
        model.addAttribute("msg", "Welcome to Spring Security");
        return "index";
    }
    
    @GetMapping("/procurar")
    public String procurar(Model model) {
        model.addAttribute("msg", "Welcome to Search Page");
        return "procurar";
    }
    
    @GetMapping("/anuncios")
    public String anuncios(Model model) {
        model.addAttribute("msg", "Welcome to Advertisements Page");
        return "anuncios";
    }
    
    @GetMapping("/listar")
    public String listar(Model model) {
        model.addAttribute("msg", "Welcome to List Page");
        return "listar";
    }
    
    @GetMapping("/anuncio_detalhes_offers")
    public String anuncio_detalhes_offers(Model model) {
        model.addAttribute("msg", "Welcome to Details Offers Advertisements Page");
        return "anuncio_detalhes_offers";
    }
    
    @GetMapping("/anuncio_detalhes_searches")
    public String anuncio_detalhes_searches(Model model) {
        model.addAttribute("msg", "Welcome to Details Searches Advertisements Page");
        return "anuncio_detalhes_searches";
    }
    
    @GetMapping("/anuncio_detalhes")
    public String anuncio_detalhes(Model model) {
        model.addAttribute("msg", "Welcome to Details Advertisements Page");
        return "anuncio_detalhes";
    }
    

    @GetMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {
        if (error != null) {
            model.addAttribute("error", "Credenciais inválidas, tente novamente.");
        }
        if (logout != null) {
            model.addAttribute("msg", "Foi desconectado com sucesso.");
        }
        return "login";
    }

    @GetMapping("/logout")
    public String logoutPage(Model model, HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login?logout";
    }

    @GetMapping("/admin")
    public String adminPage(Model model) {
        model.addAttribute("title", "Administrator Control Panel");
        model.addAttribute("message", "This page demonstrates how to use Spring security");
        return "administracao";
    }
    
    @GetMapping("/newuser")
    public String newuser(Model model) {
        model.addAttribute("title", "New User");
        model.addAttribute("message", "fill new user's details");
        
        return "newuser";
    }
    
    @PostMapping("/register")
    public String register(@RequestParam String username,
            @RequestParam String password,
            @RequestParam String email1,
            @RequestParam String email2,
            Model model) {

        if (!email1.equals(email2)) {
            model.addAttribute("title", "Email error");
            model.addAttribute("message", "Error");
        } else {
            model.addAttribute("title", "registration page");
            model.addAttribute("message", "registration is OK");

            String encodedPassword= new BCryptPasswordEncoder().encode(password);
            User u = new User(username, encodedPassword, email1, "ROLE_USER"); 
            userDao.saveUser(u);  // escrever na BD
            System.out.println("GRAVAR na BD: " + u.toString());
            model.addAttribute("user", u);   // deixar à disposição da view ?
        }

        return "register";
    }
    
    
    @PostMapping("/registarprocura")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public String registarprocura(@RequestParam String localizacao, @RequestParam Integer preco,
            @RequestParam String genero, @RequestParam String anunciante, @RequestParam String tipo_alojamento,
            @RequestParam String contacto, @RequestParam String detalhes){
        count++;
        Integer aid = count;
        LocalDateTime data = LocalDateTime.now();  
        Anuncio a = new Anuncio(aid, localizacao, preco, data.toString(), genero, anunciante, tipo_alojamento, "procura", contacto, detalhes,"inativo");
        anuncioDao.saveAnuncio(a);
        System.out.println("GRAVAR na BD: " + a.toString());
        System.out.println("");
        
        JSONObject str = new JSONObject();
        str.put("preco",preco);
        
        return str.toString();
    }
    
    @PostMapping("/registaroferta")
    @ResponseBody
    @ResponseStatus(HttpStatus.OK)
    public String registaroferta(@RequestParam String localizacao, @RequestParam Integer preco,
            @RequestParam String genero, @RequestParam String anunciante, @RequestParam String tipo_alojamento,
            @RequestParam String contacto, @RequestParam String detalhes){
        count++;
        Integer aid = count;
        LocalDateTime data = LocalDateTime.now();  
        Anuncio a = new Anuncio(aid, localizacao, preco, data.toString(), genero, anunciante, tipo_alojamento, "oferta", contacto, detalhes,"inativo");
        anuncioDao.saveAnuncio(a);
        System.out.println("GRAVAR na BD: " + a.toString());
        System.out.println("");
        
        JSONObject str = new JSONObject();
        str.put("preco",preco);
        
        return str.toString();
    }
    
    @PostMapping("/roomsearchoferta")
    public ResponseEntity<List<Anuncio>> roomsearchoferta(){
        List<Integer> anuncios = anuncioDao.getAidList();
        List<Anuncio> result = new ArrayList<>();
        
        for (int i = 0; i < anuncios.size(); i++) {
            Integer aid = anuncios.get(i);
            Anuncio a = anuncioDao.getAnuncio(aid);
            if(a.gettipo_anuncio().equals("oferta") && a.getestado().equals("ativo"))
                result.add(a);
        }
        
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
    @PostMapping("/roomsearchprocura")
    public ResponseEntity<List<Anuncio>> roomsearchprocura(){
        List<Integer> anuncios = anuncioDao.getAidList();
        List<Anuncio> result = new ArrayList<>();
        
        for (int i = 0; i < anuncios.size(); i++) {
            Integer aid = anuncios.get(i);
            Anuncio a = anuncioDao.getAnuncio(aid);
            if(a.gettipo_anuncio().equals("procura") && a.getestado().equals("ativo"))
                result.add(a);
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
    @PostMapping("/anuncio")
    public ResponseEntity<Anuncio> anuncio(@PathParam("aid") Integer aid){
        Anuncio a = anuncioDao.getAnuncio(aid);
        return new ResponseEntity<>(a, HttpStatus.OK);
    }
    
    @PostMapping("/gereanuncios")
    public ResponseEntity<List<Anuncio>> gereanuncios(){
        List<Integer> anuncios = anuncioDao.getAidList();
        List<Anuncio> result = new ArrayList<>();
        
        for (int i = 0; i < anuncios.size(); i++) {
            Integer aid = anuncios.get(i);
            Anuncio a = anuncioDao.getAnuncio(aid);
            if(a.getestado().equals("ativo"))
                result.add(a);
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
    @PostMapping("/listaanuncios")
    public ResponseEntity<List<Anuncio>> listaanuncios(){
        List<Integer> anuncios = anuncioDao.getAidList();
        List<Anuncio> result = new ArrayList<>();
        
        for (int i = 0; i < anuncios.size(); i++) {
            Integer aid = anuncios.get(i);
            Anuncio a = anuncioDao.getAnuncio(aid);
            result.add(a);
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
    @PostMapping("/controloanuncio")
    public void controloanuncio(@RequestParam Integer aid, @RequestParam String estado,
            @RequestParam String descricao){
        
        Anuncio a = anuncioDao.getAnuncio(aid);
        anuncioDao.alterar_estado(a,estado);
        System.out.println("GRAVAR na BD: " + a.toString());
        System.out.println("");
    }
    
    @PostMapping("/mensagens")
    public ResponseEntity<List<Mensagem>> mensagens(@RequestParam Integer aid_a){
        List<Integer> mes = mensagemDao.getAidMList();
        List<Mensagem> result = new ArrayList<>();
        
        for (int i = 0; i < mes.size(); i++) {
            Integer id=mes.get(i);
            Mensagem m = mensagemDao.getMensagem(id);
            System.out.println(m.getAidA());
            if (m.getAidA()== aid_a) {
                result.add(m);
            }
        }
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
    
    @PostMapping("/contactar")
    public void contactar(@RequestParam String message, @RequestParam String emissor, @RequestParam Integer aid_a){
        count_m++;
        Integer aid_m = count_m;
        Mensagem m = new Mensagem(aid_m, message, emissor, aid_a);
        mensagemDao.saveMensagem(m);
        System.out.println("GRAVAR na BD: " + m.toString());
        System.out.println("");
    }
}
