<%@ page language="java" session="true"
    contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="">
  <head>
    <title>Room Rent</title>
    <link rel="stylesheet" type="text/css" href="<c:url value ="/static/css/style.css"/>"/>
    <link rel="icon" href="<c:url value="/static/images/logo_title.png"/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  </head>
  <body>
      
    <div id="intro_listar">
      <hgroup>
          <h1><img src="/static/images/logo.png" alt="logo"></h1>
          <h2>your dreams in a few clicks...</h2>
      </hgroup>

      <div id="nav">
        <ul>
            <li><a href="${pageContext.request.contextPath}/index">Inicio</a></li>
            <li><a href="${pageContext.request.contextPath}/listar">Listar</a></li>
            <li><a href="${pageContext.request.contextPath}/anuncios">Anúncios</a></li>
            <li><a href="${pageContext.request.contextPath}/procurar">Procurar</a></li>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
            </c:if>
          </ul>
          <c:if test="${pageContext.request.userPrincipal.name != null}">
              <p id="username_nav">
                Bem-vindo
                , ${pageContext.request.userPrincipal.name} | <a
                        href="<c:url value='logout'/>">Logout</a>
            </p>
          </c:if>
      </div>
    </div>
            
           

    <div id="anuncio_oferta">
        <form id="form_oferta" name="form_oferta" action="/registaroferta" method="post">
          <h3>Anúncio de Oferta</h3>
          <p>
              <b>Tipo Alojamento:</b>
              <input type="radio" name="tipo_alojamento" id="quarto_o" value="quarto">Quarto
              <input type="radio" name="tipo_alojamento" id="T0_o" value="T0">T0   
              <input type="radio" name="tipo_alojamento" id="T1_o" value="T1">T1    
              <input type="radio" name="tipo_alojamento" id="T2_o" value="T2">T2    
              <input type="radio" name="tipo_alojamento" id="T3_o" value="T3">T3    
              <input type="radio" name="tipo_alojamento" id="T4_o" value="T4">T4    
          </p>
          <p>
              <b>Arrandatário:</b>
              <input type="radio" name="genero" id="masculino_o" value="masculino">Masculino
              <input type="radio" name="genero" id="feminino_o" value="feminino">Feminino
              <input type="radio" name="genero" id="indiferente_o" value="Indiferente">Indiferente
          </p>
          <p>
              <b>Preço:</b>
              <input type="text" id="preco_o" name="preco">
          </p>
          <p>
              <b>Zona:</b>
              <select name="localizacao">
                  <option>Algarve</option>
                  <option>Aveiro</option>
                  <option>Beja</option>
                  <option>Braga</option>
                  <option>Bragança</option>
                  <option>Castelo Branco</option>
                  <option>Coimbra</option>
                  <option>Evora</option>
                  <option>Guarda</option>
                  <option>Leiria</option>
                  <option>Lisboa</option>
                  <option>Portalegre</option>
                  <option>Porto</option>
                  <option>Santarem</option>
                  <option>Setubal</option>
                  <option>Viana do Castelo</option>
                  <option>Vila Real</option>
                  <option>Viseu</option>
              </select>
          </p>
          <p>
              <b>Nome do Anunciante:</b>
              <input type="text" id="nome_o" name="anunciante">
          </p>
          <p>
                <b>Contacto: </b>
                <input type="text" id="contacto_o" name="contacto">
          </p>
          <p id="d_o"><b>Detalhes:</b></p>
          <textarea id="caixa_texto" name="detalhes" rows="4" cols="40"></textarea>
          <input id="submeter_anuncio" type="Submit" value="Submeter">
        </form>  
    </div>
    <div id="anuncio_procura">
        <form id="form_procura" name="form_procura" action="/registarprocura" method="post" >
            <h3>Anúncio de Procura</h3>
            <p>
                <b>Tipo Alojamento:</b>
                <input type="radio" name="tipo_alojamento" id="quarto_p" value="quarto">Quarto
                <input type="radio" name="tipo_alojamento" id="T0_p" value="T0">T0   
                <input type="radio" name="tipo_alojamento" id="T1_p" value="T1">T1    
                <input type="radio" name="tipo_alojamento" id="T2_p" value="T2">T2    
                <input type="radio" name="tipo_alojamento" id="T3_p" value="T3">T3    
                <input type="radio" name="tipo_alojamento" id="T4_p" value="T4">T4    
            </p>
            <p>
                <b>Arrandatário:</b>
                <input type="radio" name="genero" id="masculino_p" value="masculino">Masculino
                <input type="radio" name="genero" id="feminino_p" value="feminino">Feminino
                <input type="radio" name="genero" id="indiferente_p" value="Indiferente">Indiferente
            </p>
            <p>
                <b>Preço:</b>
                <input type="text" id="preco_p" name="preco">
            </p>
            <p>
                <b>Zona:</b>
                <select name="localizacao">
                    <option>Algarve</option>
                    <option>Aveiro</option>
                    <option>Beja</option>
                    <option>Braga</option>
                    <option>Bragança</option>
                    <option>Castelo Branco</option>
                    <option>Coimbra</option>
                    <option>Evora</option>
                    <option>Guarda</option>
                    <option>Leiria</option>
                    <option>Lisboa</option>
                    <option>Portalegre</option>
                    <option>Porto</option>
                    <option>Santarem</option>
                    <option>Setubal</option>
                    <option>Viana do Castelo</option>
                    <option>Vila Real</option>
                    <option>Viseu</option>
                </select>
            </p>
            <p>
                <b>Nome do Anunciante:</b>
                <input type="text" id="nome_p" name="anunciante">
            </p>
            <p>
                <b>Contacto: </b>
                <input type="text" id="contacto_p" name="contacto">
            </p>
            <p id="d_p"><b>Detalhes:</b></p>
            <textarea id="caixa_texto" name="detalhes" rows="4" cols="40"></textarea>
            <input id="submeter_anuncio" type="Submit" value="Submeter">
        </form>  
    </div>

    <div id="rod_listar">
        <div id="authors">
            <p>Diogo Carreiro nº48729 & Rodrigo Alves nº48681</p>
        </div>

        <div id="sponsors">
            <p>Patrocinadores:</p>
            <a target="_blank" href="https://www.uevora.pt/">
                <img id="ue" alt="universidade_evora" src="/static/images/ue.png">
            </a>
            <a target="_blank" href="https://www.mercedes-benz.pt/">
                <img id="mercedes" alt="mercedes" src="/static/images/mercedes.png">
            </a>
            <a target="_blank" href="https://www.creditoagricola.pt/">
                <img id="ca" alt="credito_agricola" src="/static/images/ca.png">
            </a>
            <a target="_blank" href="https://www.redbull.com/pt-pt/">
                <img id="redbull" alt="redbull" src="/static/images/redbull.png">
            </a>
        </div>

        <div id="social_networks">
            <p>Redes Sociais:</p>
            <a target="_blank" href="https://www.facebook.com/">
                <img id="facebook" alt="facebook" src="/static/images/facebook.png">
            </a>
            <a target="_blank" href="https://twitter.com/?lang=pt">
                <img id="twitter" alt="twitter" src="/static/images/twitter.png">
            </a>
            <a target="_blank" href="https://pt.linkedin.com/">
                <img id="linkedIn" alt="linkedIn" src="/static/images/linkedIn.png">
            </a>
            <a target="_blank" href="https://www.instagram.com/">
                <img id="instagram" alt="instagram" src="/static/images/instagram.png">
            </a>
        </div>
    </div>
    <script>
        
        function validate_oferta() {
            var quarto = document.getElementById("quarto_o");
            var T0 = document.getElementById("T0_o");
            var T1 = document.getElementById("T1_o");
            var T2 = document.getElementById("T2_o");
            var T3 = document.getElementById("T3_o");
            var T4 = document.getElementById("T4_o");
            
            if (!quarto.checked && !T0.checked && !T1.checked && !T2.checked && !T3.checked && !T4.checked) {
                alert("Atributo tipo_alojamento em falta!");
                return false;
            }

            var masculino = document.getElementById("masculino_o");
            var feminino = document.getElementById("feminino_o");
            var indiferente = document.getElementById("indiferente_o");

            if (!masculino.checked && !feminino.checked && !indiferente.checked) {
                alert("Atributo genero em falta!");
                return false;
            }

            var preco = document.getElementById("preco_o").value;

            if (preco.length < 1) {
                alert("Atributo preco em falta!");
                return false;
            }

            var nome = document.getElementById("nome_o").value;

            if (nome.length < 1) {
                alert("Atributo nome em falta!");
                return false;
            }
            
            var contacto = document.getElementById("contacto_o").value;

            if (contacto.length < 1) {
                alert("Atributo contacto em falta!");
                return false;
            }
            
            return true;
        }

        function validate_procura() {
            var quarto = document.getElementById("quarto_p");
            var T0 = document.getElementById("T0_p");
            var T1 = document.getElementById("T1_p");
            var T2 = document.getElementById("T2_p");
            var T3 = document.getElementById("T3_p");
            var T4 = document.getElementById("T4_p");
            
            if (!quarto.checked && !T0.checked && !T1.checked && !T2.checked && !T3.checked && !T4.checked) {
                alert("Atributo tipo_alojamento em falta!");
                return false;
            }

            var masculino = document.getElementById("masculino_p");
            var feminino = document.getElementById("feminino_p");
            var indiferente = document.getElementById("indiferente_p");

            if (!masculino.checked && !feminino.checked && !indiferente.checked) {
                alert("Atributo genero em falta!");
                return false;
            }
            
            var preco = document.getElementById("preco_p").value;
         
            if (preco.length < 1) {
                alert("Atributo preco em falta!");
                return false;
            }

            var nome = document.getElementById("nome_p").value;

            if (nome.length < 1) {
                alert("Atributo nome em falta!");
                return false;
            }
            
            var contacto = document.getElementById("contacto_p").value;

            if (contacto.length < 1) {
                alert("Atributo contacto em falta!");
                return false;
            }
            return true;
        }
        
        $(document).ready(function () {
            $("#form_procura").on("submit", function(event) {
                event.preventDefault();
                if (validate_procura()) {
                    var formValues= $(this).serialize();
                    var actionUrl = $(this).attr("action");
                    
                    console.log(actionUrl);
                    console.log(formValues);
                  
                    $.post(actionUrl, formValues, function (data){
                        
                        var obj = JSON.parse(data);
                        let amount = obj.preco;
                        $.get("http://alunos.di.uevora.pt/tweb/t2/mbref4payment",{amount: amount}, function(data_m){
                            console.log(data_m);
                            alert("Valor a pagar:" + data_m.mb_amount + "\n" +
                                    "Entidade: " + data_m.mb_entity + "\n" + 
                                    "Referência: " + data_m.mb_reference + ".");
                        });
                        alert("Anúncio de procura inserido!");
                    }); 
                    
                    
                    
                } 
            });
            
            $("#form_oferta").on("submit", function(event) {
                event.preventDefault();
                if (validate_oferta()) {
                    var formValues= $(this).serialize();
                    var actionUrl = $(this).attr("action");
                    
                    $.post(actionUrl, formValues, function (data){
                        
                        var obj = JSON.parse(data);
                        let amount = obj.preco;
                        $.get("http://alunos.di.uevora.pt/tweb/t2/mbref4payment",{amount: amount}, function(data_m){
                            console.log(data_m);
                            alert("Valor a pagar:" + data_m.mb_amount + "\n" +
                                    "Entidade: " + data_m.mb_entity + "\n" + 
                                    "Referência: " + data_m.mb_reference + ".");
                        });
                        alert("Anúncio de oferta inserido!");
                    });
                }
            });
        });
    </script>
  </body>
</html>
