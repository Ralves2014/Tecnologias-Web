<%@ page language="java" session="true"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html >
  <head>
    <title>Room Rent</title>
        <title>Room Rent</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<c:url value="https://www.w3schools.com/w3css/4/w3.css"/>"/>
        <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>" />
        <link rel="icon" href="<c:url value="/static/images/logo_title.png"/>"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </head>
  <body>
    <div id="intro">
      <hgroup>
          <h1><img src="static/images/logo.png" alt="logo"></h1>
          <h2>your dreams in a few clicks...</h2>
      </hgroup>

      <div id="nav_admin">
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
          
    <h2 id="titulo_a">Anúncios Ativos</h2>
    <div id="results_a"></div>

    <div id="button_back_next_a">
      <div id="icon1_a"></div>
      <div id="icon2_a"></div>
    </div>

    <h2 id="titulo_i">Anúncios Inativos</h2>
    <div id="results_i"></div>

    <div id="button_back_next_i">
      <div id="icon1_i"></div>
      <div id="icon2_i"></div>
    </div>
    
    

    <form id="alterar_estado" action="/controloanuncio" method="post">
      <h2>Mudar Estado</h2>
      <label for="aid">Insira o número do anúncio: </label>
      <input type="text" id="aid" name="aid"><br>
      <label for="estado">Alterar para: </label>
      <input type="radio" name="estado" id="ativo" value="ativo"> Ativo
      <input type="radio" name="estado" id="inativo" value="inativo"> Inativo<br>
      <label id="Des_alterar_estado" for="estado">Descrição </label>
      <textarea id="text_estado_alterado" name="descricao" cols="40" rows="2"></textarea><br>
      <input type="Submit" id="submit_alterar" value="Alterar Estado">
    </form>
    
    

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
  </body>
  <script>
  
    var current_page=0, end, pagination=4;

    //Anúncios Ativos
    
    function button_back_ativos(data, page_number, limit) {
      if (page_number==end) {
          document.getElementById("icon2_a").innerHTML="";
      }
      document.getElementById("icon1_a").innerHTML="";
      let btn = document.createElement("button");
      btn.innerHTML = "Back";
      btn.onclick = function () {
          if (page_number>1) {
          current_page=page_number-1;
          list_anuncios_ativos(data,current_page,limit);
          }
      };
      document.getElementById("icon1_a").appendChild(btn);
    }

    function button_next_ativos(data,page_number,limit) {
      if (page_number==1) {
          document.getElementById("icon1_a").innerHTML="";
      }
      document.getElementById("icon2_a").innerHTML="";
      let btn = document.createElement("button");
      btn.innerHTML = "Next";
      btn.onclick = function () {
          if (page_number<=end) {
          current_page=page_number+1;
          list_anuncios_ativos(data,current_page,limit);
          }
      };
      document.getElementById("icon2_a").appendChild(btn);
    }
    
   function list_anuncios_ativos(data, page_number, limit) {
        document.getElementById("results_a").innerHTML="";
        let total = data.length;

        let total_number_pages = Math.ceil(total/limit);
        end=total_number_pages;
        let count = (page_number*limit)-limit;
        let last = count+limit;

        if (total==0) {
          document.getElementById("results_i").innerHTML+= "Não há anúncios ativos<br>";
        }
        
        for (let i = count; i < last; i++) {
            var aid_anuncio = data[i].aid;
        
            if (i<total) {
              $.post("/anuncio?" + "&aid=" + aid_anuncio,function(data_info){
                document.getElementById("results_a").innerHTML+= "ID: " + data_info.aid + "<br>";
                document.getElementById("results_a").innerHTML+= "Zona: " + data_info.localizacao + "<br>";
                document.getElementById("results_a").innerHTML+= "Anunciante: " + data_info.anunciante + "<br>" + "<hr>";
              });
            }
        }
    
        if (page_number==end && page_number==1) {
            document.getElementById("icon1_a").innerHTML="";
            document.getElementById("icon2_a").innerHTML="";
        }
        else if (page_number==end && total!=0) {
            button_back_ativos(data, page_number, pagination);
        }
        else if (page_number==1 && total!=0) {
            button_next_ativos(data, page_number, pagination);
        }
        else{
          if (total!=0) {
            button_back_ativos(data, page_number, pagination);
            button_next_ativos(data, page_number, pagination);
          } 
        } 
    }

    //Anúncios Inativos

    function button_back_inativos(data, page_number, limit) {
      if (page_number==end) {
          document.getElementById("icon2_i").innerHTML="";
      }
      document.getElementById("icon1_i").innerHTML="";
      let btn = document.createElement("button");
      btn.innerHTML = "Back";
      btn.onclick = function () {
          if (page_number>1) {
          current_page=page_number-1;
          list_anuncios_inativos(data,current_page,limit);
          }
      };
      document.getElementById("icon1_i").appendChild(btn);
    }

    function button_next_inativos(data,page_number,limit) {
      if (page_number==1) {
          document.getElementById("icon1_i").innerHTML="";
      }
      document.getElementById("icon2_i").innerHTML="";
      let btn = document.createElement("button");
      btn.innerHTML = "Next";
      btn.onclick = function () {
          if (page_number<=end) {
          current_page=page_number+1;
          list_anuncios_inativos(data,current_page,limit);
          }
      };
      document.getElementById("icon2_i").appendChild(btn);
    }


    function list_anuncios_inativos(data, page_number, limit) {
        document.getElementById("results_i").innerHTML="";

        let total = data.length;

        let total_number_pages = Math.ceil(total/limit);
        end=total_number_pages;
        let count = (page_number*limit)-limit;
        let last = count+limit;
        if (total==0) {
          document.getElementById("results_i").innerHTML+= "Não há anúncios inativos<br>";
        }
        for (let i = count; i < last; i++) {
         
            if (i<total) {
              $.post("/anuncio?" + "&aid=" + data[i].aid,function(data_info){
                document.getElementById("results_i").innerHTML+= "ID: " + data_info.aid + "<br>";
                document.getElementById("results_i").innerHTML+= "Zona: " + data_info.localizacao + "<br>";
                document.getElementById("results_i").innerHTML+= "Anunciante: " + data_info.anunciante + "<br>" + "<hr>";
              });
            }
        }
    
        if (page_number==end && page_number==1) {
            document.getElementById("icon1").innerHTML="";
            document.getElementById("icon2").innerHTML="";
        }
        else if (page_number==end && total!=0) {
            button_back_inativos(data, page_number, pagination);
        }
        else if (page_number==1 && total!=0) {
            button_next_inativos(data, page_number, pagination);
        }
        else{
            if (total!=0) {
              button_back_inativos(data, page_number, pagination);
              button_next_inativos(data, page_number, pagination);
            }
        } 
    }

    //Verificar mudança de estado

    function verify_state() {
      var aid = document.getElementById("aid").value;
      console.log(aid);
      var ativo = document.getElementById("ativo");
      var inativo = document.getElementById("inativo");
      var descricao = document.getElementById("text_estado_alterado").value;
    
      if (aid.length<1) {
        alert("Atributo aid em falta!");
        return false;
      }

      if (!ativo.checked && !inativo.checked) {
        alert("Atributo estado em falta!");
        return false;
      }

      if (descricao.length<1) {
        alert("Atributo descricao em falta!");
        return false;
      }
      return true;
    }

    $(document).ready(function(){  
      $.post("/listaanuncios",function(data){
          current_page=1;
          const data_ativos = [];
          const data_inativos = [];
          
          for(let i=0; i<data.length;i++){
              console.log(data[i].estado);
              if(data[i].estado == "ativo")
                  data_ativos.push(data[i]);
              else
                  data_inativos.push(data[i]);
          }
          list_anuncios_ativos(data_ativos,current_page,pagination);
          list_anuncios_inativos(data_inativos,current_page,pagination);
        });

        $("#alterar_estado").on("submit", function(event) {
            event.preventDefault();
            var formValues= $(this).serialize();
            console.log(formValues);
            if (verify_state()) {
                $.post("/controloanuncio",formValues, function (data) {
                });
                alert("Estado do anúncio alterado com sucesso");
            }  
        }); 
    });
  </script>
</html>
