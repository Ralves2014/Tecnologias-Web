<%@ page language="java" session="true" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Room Rent</title>
        <link rel="stylesheet" type="text/css" href="<c:url value="/static/css/style.css"/>" />
        <link rel="icon" href="<c:url value="/static/images/logo_title.png"/>"/>
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
                    <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                </ul>
            </div>
        </div>
                    
                    
        <div align="center">
            <h1>${title}</h1>
            <h2>${message}, new user</h2>

            <form id="form1" method="POST" action="/register">
                username: <input type="text" name="username"><br>
                password:<input type="password" name="password"><br>
                email:<input type="text" name="email1"><br>
                e-mail confirmation: <input type="text" name="email2"><br>
                <input type="submit" value="send"><br>
            </form>
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
    </body>
</html>