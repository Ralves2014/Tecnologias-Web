<%@ page language="java" session="true"
    contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <title>Room Rent</title>
        <link rel="stylesheet" href="<c:url value="https://www.w3schools.com/w3css/4/w3.css"/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>" />
        <link rel="icon" href="<c:url value="/static/images/logo_title.png"/>"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>
  <body>
    <div id="intro">
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
            <p>
                Bem-vindo
                , ${pageContext.request.userPrincipal.name} | <a
                        href="<c:url value='logout'/>">Logout</a>
            </p>
          </c:if>
      </div>
    </div>

    <div id="photo_details"></div>
    <div id="res"></div>
    
    
    <div id="write">
        <div id="write_mensages">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h5><b>Contactar</b></h5>
                <form id="contactar" action="/contactar" method="post">
                  <input type="hidden" id="aid_escondido" name="aid_a">
                  <b>Remetente: </b><input type="text" name="emissor" id="rem"><br>
                  <b id="mensagem_area">Mensagem: </b>
                  <textarea id="caixa_T_contactar" name="message" cols="50" rows="2"></textarea>
                  <input id="submit_contactar" type="submit" value="Enviar Mensagem">
                </form>
            </c:if>
        </div>
    </div>
    <div id="mensages"></div>
    
    
    <div id="rod">
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

      var photo = new Image(850,400);
      
      function valida(){
        var remetente = document.getElementById("rem").value;
        var mensagem = document.getElementById("caixa_T_contactar").value;

        if (remetente.length <1 && mensagem.length <1)
          return false;
        else
          return true;
      }
      
      $(document).ready(function () {
        $.post("/anuncio?"+ "&aid="+ localStorage.getItem("id_offers"), function (data){
            console.log(data);
          let element = document.createElement("div");
          element.id="anuncio_detalhado";

          let element2 = document.createElement("div");
          element2.id="details";

          let element3 = document.createElement("div");
          element3.id="all_mensages";

          document.getElementById("res").appendChild(element);
          document.getElementById("photo_details").appendChild(element2);
          document.getElementById("mensages").appendChild(element3);
          
          
          if(data.tipo_alojamento == "Casa" || data.tipo_alojamento == "casa" || data.tipo_alojamento == "T0" || data.tipo_alojamento == "T1" ||
          data.tipo_alojamento == "T2" || data.tipo_alojamento == "T3" || data.tipo_alojamento == "T4" || data.tipo_alojamento == "t0" || data.tipo_alojamento == "t1" ||
          data.tipo_alojamento == "t2" || data.tipo_alojamento == "t3" || data.tipo_alojamento == "t4"){
            photo.src="/static/images/home.jpg";
          }
          else if (data.tipo_alojamento === "Quarto" || data.tipo_alojamento === "quarto"){
            photo.src="/static/images/bedroom.jpg";
          }
          else{
            photo.src="/static/images/undefined.jpg";
          }

          document.getElementById("anuncio_detalhado").innerHTML += "<h4>" + "<b>Anúncio </b>" + "<b>" + data.aid + "</b>" + "<b> Detalhes </b>" + "</h4>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Anunciante: </b>" + data.anunciante + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Contacto: </b>" + data.contacto + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Anuncio publicado em: </b>" + data.data + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Detalhes: </b>" + data.detalhes + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Estado: </b>" + data.estado + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Género: </b>" + data.genero + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Preço: </b>" + data.preco + " euros" + "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Tipo de alojamento: </b>" + data.tipo_alojamento +  "<br>";
          document.getElementById("anuncio_detalhado").innerHTML += "<b>Zona: </b>" + data.localizacao + "<br>";
          document.getElementById("details").appendChild(photo);
        });
        
        
        document.getElementById("aid_escondido").value = localStorage.getItem("id_offers");
          
        $("#contactar").on("submit", function(event) {
          event.preventDefault();
          var formValues= $(this).serialize();
          var actionUrl = $(this).attr("action");
          
          if (valida()){
            $.post(actionUrl, formValues, function (data){
            });
            alert("Mensagem enviada!");
          }
          else
            alert("Mensagem não enviada, campos remetente ou mensagem por preencher.");
        });
        
        $.post("/mensagens?" + "&aid_a=" + localStorage.getItem("id_offers"), function (data){
            console.log(data);
          if (data.length==0) {
            document.getElementById("all_mensages").innerHTML += "Não há mensagens enviadas para este anúncio.";
          }
          else{
            document.getElementById("all_mensages").innerHTML += "<h5><b>Últimas Mensagens Enviadas</b></h5>";
            for (let i = data.length-1; i >= 0; i--) {
              document.getElementById("all_mensages").innerHTML += "<b>" +data[i].emissor + ":  </b>" + data[i].mensagem + "<br>";                  
            }
          }
        });
      });
    </script>
  </body>
</html>
