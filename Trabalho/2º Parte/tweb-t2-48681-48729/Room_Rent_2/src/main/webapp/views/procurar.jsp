<%@ page language="java" session="true"
    contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="">
  <head>
    
    <title>Room Rent</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>" />
    <link rel="icon" href="<c:url value="/static/images/logo_title.png"/>"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
  </head>
  <body>
    <div id="intro_listar">
      <hgroup>
          <h1><img src="/static/images/logo.png" alt="logo"></h1>
          <h2>your dreams in a few clicks...</h2>
      </hgroup>

      <div id="nav_procurar">
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

    <form action="/roomsearch" method="post">
      <div id="pesquisa">
        <h3>Pesquisa:</h3>
        <input id="pesquisar" type="search" name="tipo" placeholder="Pesquisa aqui...">
        <input id="img_pesquisa" type="image" name="submit" src="/static/images/pesquisa.png" alt="Submeter"> 
      </div>
    </form>

    <div id="results"></div>

    <div id="button_back_next">
      <div id="icon1"></div>
      <div id="icon2"></div>
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

    var current_page=0, end, pagination=4;
   
    window.onload = function () {
      document.getElementById("pesquisar").focus();
    }

    function button_back(data, page_number, limit) {
      if (page_number==end) {
        document.getElementById("icon2").innerHTML="";
      }
      document.getElementById("icon1").innerHTML="";
      let btn = document.createElement("button");
      btn.innerHTML = "Back";
      btn.onclick = function () {
        if (page_number>1) {
          current_page=page_number-1;
          list_anuncios(data,current_page,limit);
        }
      };
      document.getElementById("icon1").appendChild(btn);
    }

    function button_next(data,page_number,limit) {
      if (page_number==1) {
        document.getElementById("icon1").innerHTML="";
      }
      document.getElementById("icon2").innerHTML="";
      let btn = document.createElement("button");
      btn.innerHTML = "Next";
      btn.onclick = function () {
        if (page_number<=end) {
          current_page=page_number+1;
          list_anuncios(data,current_page,limit);
        }
      };
      document.getElementById("icon2").appendChild(btn);
    }

    function list_anuncios(data, page_number, limit) {
      document.getElementById("results").innerHTML="";

      let total_number_pages = Math.ceil(data.length/limit);
      end=total_number_pages;
      let count = (page_number*limit)-limit;
      let last = count+limit;
      let n = 0;

      for (let i = count; i < last; i++) {
        if (i<data.length) {
            document.getElementById("results").innerHTML += "<b>Tipo de alojamento: </b>" + data[i].tipo_alojamento +  "          ";
            document.getElementById("results").innerHTML += "<b>Género: </b>" + data[i].genero + "<br>";
            document.getElementById("results").innerHTML += "<b>Preço: </b>" + data[i].preco + " euros" + "          ";
            document.getElementById("results").innerHTML += "<b>Zona: </b>" + data[i].localizacao + "<br>";
            document.getElementById("results").innerHTML += "<b>Anúncio </b>" + data[i].aid + "<br>";

            let btn = document.createElement("button");
            btn.innerHTML = "Mais Informações";
            btn.setAttribute("id","btn_pos_"+n);
            document.getElementById("results").appendChild(btn);

            localStorage.setItem("id_"+n, data[i].aid);
            console.log(btn.getAttribute("id"));
            n+=1;
          
          
            $("#btn_pos_0").click(function(){
                localStorage.setItem("id_anuncio",localStorage.getItem("id_0"));
                window.open("${pageContext.request.contextPath}/anuncio_detalhes");
                console.log("0");
            }); 

            $("#btn_pos_1").click(function(){
                localStorage.setItem("id_anuncio",localStorage.getItem("id_1"));
                window.open("${pageContext.request.contextPath}/anuncio_detalhes");
                console.log("1");
            }); 

            $("#btn_pos_2").click(function(){
                localStorage.setItem("id_anuncio",localStorage.getItem("id_2"));
                window.open("${pageContext.request.contextPath}/anuncio_detalhes");
                console.log("2");
            }); 

            $("#btn_pos_3").click(function(){
                localStorage.setItem("id_anuncio",localStorage.getItem("id_3"));
                window.open("${pageContext.request.contextPath}/anuncio_detalhes");
                console.log("3");
            }); 
          
          
          
        }
        if (i!=last-1 && i<data.length-1) {
            document.getElementById("results").innerHTML += "<hr>"
        }
      }
      if (page_number==end&&page_number==1) {
            document.getElementById("icon1").innerHTML="";
            document.getElementById("icon2").innerHTML="";
      }
      else if (page_number==end) {
            button_back(data, page_number, pagination);
      }
      else if (page_number==1) {
            button_next(data, page_number, pagination);
      }
      else{
            button_back(data, page_number, pagination);
            button_next(data, page_number, pagination);
      } 
    }

    $(document).ready(function () {
      $("form").on("submit", function(event) {
        event.preventDefault();
        var formValues= $(this).serialize();
        var actionUrl = $(this).attr("action");
       
        var str_input = document.getElementById("pesquisar").value.split(" ");

        var t = str_input[0];
        var d = "";

        for(let i=1; i<str_input.length;i++){
          if (d.length!=0)
            d = d.concat(" ");
          d = d.concat(str_input[i]);
        }
                  
        $.post(actionUrl + t, function (data){
          current_page=1;
          console.log(actionUrl + t);
          
          var new_data = [];

          if (str_input.length==1){
            new_data=data;
            console.log(new_data);
            list_anuncios(new_data,current_page,pagination); 
          }
          else{
            for(let i=0; i<data.length;i++){
              if(data[i].localizacao.includes(d) || data[i].anunciante.includes(d) )
                new_data.push(data[i]);
            }
            list_anuncios(new_data,current_page,pagination);
          }
        });
      });
    });
  </script>
  </body>
</html>
