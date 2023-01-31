<%@ page language="java" session="true"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
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
        
        <div id="content">
            <div id="principal_searchs">
                <p id="destaque_s">Destaques Procuras</p>
                <div class="w3-content w3-display-container">
                    <div class="photo_slides_searchs" id="photo1_searchs"></div>
                    <div class="photo_slides_searchs" id="photo2_searchs"></div>
                    <div class="photo_slides_searchs" id="photo3_searchs"></div>
                    <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle">
                      <span class="w3-badge demo2 w3-border w3-transparent w3-hover-white"></span>
                      <span class="w3-badge demo2 w3-border w3-transparent w3-hover-white"></span>
                      <span class="w3-badge demo2 w3-border w3-transparent w3-hover-white"></span>
                    </div>
                </div>
                <div id="info_img_searchs"></div>
                <div id="more_searchs">
                    <a href="${pageContext.request.contextPath}/anuncio_detalhes_searches">Mais Informações</a>
                </div>
            </div>

            <div id="principal_offers">
                <p id="destaque_o">Destaques Ofertas</p>
                <div class="w3-content w3-display-container">
                    <div class="photo_slides_offers" id="photo1_offers"></div>
                    <div class="photo_slides_offers" id="photo2_offers"></div>
                    <div class="photo_slides_offers" id="photo3_offers"></div>
                    <div class="w3-center w3-container w3-section w3-large w3-text-white w3-display-bottommiddle">
                      <span class="w3-badge demo w3-border w3-transparent w3-hover-white"></span>
                      <span class="w3-badge demo w3-border w3-transparent w3-hover-white"></span>
                      <span class="w3-badge demo w3-border w3-transparent w3-hover-white"></span>
                    </div>
                </div>
                <div id="info_img_offers"></div>
                <div id="more_offers">
                    <a href="${pageContext.request.contextPath}/anuncio_detalhes_offers">Mais Informações</a>
                </div>
            </div>
        </div>

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
            
            // Offers
            
            var img1_offers  = new Image(650,300);
            var img2_offers  = new Image(650,300);
            var img3_offers  = new Image(650,300);
            var id1_o, id2_o, id3_o;
            
            let slide_show_offers= 0;
            show_offers();

            function clear_info_offers() {
                let div = document.getElementById("info_img_offers");
                div.innerHTML="";
            }
            
            function show_offers() {
                clear_info_offers(info_img_offers);
                var i;
                var x = document.getElementsByClassName("photo_slides_offers");
                var dots = document.getElementsByClassName("demo");

                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";  
                }
                slide_show_offers++;

                if (slide_show_offers > x.length)
                    slide_show_offers=1;
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" w3-white", "");
                }

                x[slide_show_offers-1].style.display = "block";  
                dots[slide_show_offers-1].className += " w3-white";
                show_info_offers(slide_show_offers);
                setTimeout(show_offers,5000);
            }
            
            function show_info_offers(n) {
                $.post("/roomsearchoferta",function(data){
                    console.log(data);
                    document.getElementById("info_img_offers").innerHTML += "Divulgo as seguintes caracterí­sticas:" + "<br>";
                    document.getElementById("info_img_offers").innerHTML += "Anúncio: " + data[data.length-3+n-1].aid + "<br>";
                    document.getElementById("info_img_offers").innerHTML += "Tipo de alojamento -> " + data[data.length-3+n-1].tipo_alojamento + "<br>";
                    document.getElementById("info_img_offers").innerHTML += "Preço -> " + data[data.length-3+n-1].preco + " euros" + "<br>";
                    document.getElementById("info_img_offers").innerHTML += "Zona -> " + data[data.length-3+n-1].localizacao;

                    localStorage.setItem("id_offers",data[data.length-3+n-1].aid);
                });
            }

            $(document).ready(function (){
                $.post("/roomsearchoferta",function(data){
                    var count=1;
                    for(let i = data.length-3; i < data.length; i++){
                        
                        if(data[i].tipo_alojamento == "Casa" || data[i].tipo_alojamento == "casa" || data[i].tipo_alojamento == "T0" || data[i].tipo_alojamento == "T1" ||
                        data[i].tipo_alojamento == "T2" || data[i].tipo_alojamento == "T3" || data[i].tipo_alojamento == "T4" || data[i].tipo_alojamento == "t0" || data[i].tipo_alojamento == "t1" ||
                        data[i].tipo_alojamento == "t2" || data[i].tipo_alojamento == "t3" || data[i].tipo_alojamento == "t4"){
                            if (count==1){
                                img1_offers.src="/static/images/home.jpg";
                                id1_o=data[i].aid;
                            }else if (count==2){
                                img2_offers.src="/static/images/home.jpg";
                                id2_o=data[i].aid;
                            }else if (count==3){
                                img3_offers.src="/static/images/home.jpg";
                                id3_o=data[i].aid;
                            }
                        }
                        else if (data[i].tipo_alojamento === "Quarto" || data[i].tipo_alojamento === "quarto"){
                            if (count==1){
                                img1_offers.src="/static/images/bedroom.jpg";
                                id1_o=data[i].aid;
                            }else if (count==2){
                                img2_offers.src="/static/images/bedroom.jpg";
                                id2_o=data[i].aid;
                            }else if (count==3){
                                img3_offers.src="/static/images/bedroom.jpg";
                                id3_o=data[i].aid;
                            }
                        }
                        else{
                            if (count==1){
                                img1_offers.src="/static/images/undefined.jpg";
                                id1_o=data[i].aid;
                            }else if (count==2){
                                img2_offers.src="/static/images/undefined.jpg";
                                id2_o=data[i].aid;
                            }else if (count==3){
                                img3_offers.src="/static/images/undefined.jpg";
                                id3_o=data[i].aid;
                            }
                        }
                        count++;
                    }
                    document.getElementById("photo1_offers").appendChild(img1_offers);
                    document.getElementById("photo2_offers").appendChild(img2_offers);
                    document.getElementById("photo3_offers").appendChild(img3_offers);
                });
            });

            // Searchs

            var img1_searchs  = new Image(650,300);
            var img2_searchs  = new Image(650,300);
            var img3_searchs  = new Image(650,300);
            var id1_s, id2_s, id3_s;
            
            let slide_show_searchs= 0;
            show_searchs();
            
            function clear_info_searchs() {
                let div = document.getElementById("info_img_searchs");
                div.innerHTML="";
            }

            function show_searchs() {
                clear_info_searchs();
                var i;
                var x = document.getElementsByClassName("photo_slides_searchs");
                var dots = document.getElementsByClassName("demo2");

                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";  
                }
                slide_show_searchs++;
                
                if (slide_show_searchs > x.length)
                    slide_show_searchs=1;
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" w3-white", "");
                }

                x[slide_show_searchs-1].style.display = "block";  
                dots[slide_show_searchs-1].className += " w3-white";
                show_info_searchs(slide_show_searchs);
                setTimeout(show_searchs,5000);
            }

            function show_info_searchs(n) {
                $.post("/roomsearchprocura",function(data){
                    document.getElementById("info_img_searchs").innerHTML += "Procura-se as seguintes características:" + "<br>";
                    document.getElementById("info_img_searchs").innerHTML += "Anúncio: " + data[data.length-3+n-1].aid + "<br>";
                    document.getElementById("info_img_searchs").innerHTML += "Tipo de alojamento -> " + data[data.length-3+n-1].tipo_alojamento + "<br>";
                    document.getElementById("info_img_searchs").innerHTML += "Preço -> " + data[data.length-3+n-1].preco + " euros" + "<br>";
                    document.getElementById("info_img_searchs").innerHTML += "Zona -> " + data[data.length-3+n-1].localizacao + "<br>";

                    localStorage.setItem("id_searchs",data[data.length-3+n-1].aid);
                });
            }

            $(document).ready(function (){
                $.post("/roomsearchprocura",function(data){
                    var count=1;
                    for(let i = data.length-3; i < data.length; i++){

                        if(data[i].tipo_alojamento == "Casa" || data[i].tipo_alojamento == "casa" || data[i].tipo_alojamento == "T0" || data[i].tipo_alojamento == "T1" ||
                        data[i].tipo_alojamento == "T2" || data[i].tipo_alojamento == "T3" || data[i].tipo_alojamento == "T4" || data[i].tipo_alojamento == "t0" || data[i].tipo_alojamento == "t1" ||
                        data[i].tipo_alojamento == "t2" || data[i].tipo_alojamento == "t3" || data[i].tipo_alojamento == "t4"){
                            if (count==1){
                                img1_searchs.src="/static/images/home.jpg";
                                id1_s=data[i].aid;
                            }else if (count==2){
                                img2_searchs.src="/static/images/home.jpg";
                                id2_s=data[i].aid;
                            }else if (count==3){
                                img3_searchs.src="/static/images/home.jpg";
                                id3_s=data[i].aid;
                            }
                        }
                        else if (data[i].tipo_alojamento === "Quarto" || data[i].tipo_alojamento === "quarto"){
                            if (count==1){
                                img1_searchs.src="/static/images/bedroom.jpg";
                                id1_s=data[i].aid;
                            }else if (count==2){
                                img2_searchs.src="/static/images/bedroom.jpg";
                                id2_s=data[i].aid;
                            }else if (count==3){
                                img3_searchs.src="/static/images/bedroom.jpg";
                                id3_s=data[i].aid;
                            }
                        }
                        else{
                            if (count==1){
                                img1_searchs.src="/static/images/undefined.jpg";
                                id1_s=data[i].aid;
                            }else if (count==2){
                                img2_searchs.src="/static/images/undefined.jpg";
                                id2_s=data[i].aid;
                            }else if (count==3){
                                img3_searchs.src="/static/images/undefined.jpg";
                                id3_s=data[i].aid;
                            }
                        }
                        count++;
                    }
                    document.getElementById("photo1_searchs").appendChild(img1_searchs);
                    document.getElementById("photo2_searchs").appendChild(img2_searchs);
                    document.getElementById("photo3_searchs").appendChild(img3_searchs);
                });
            });
        </script>
    </body>
</html>