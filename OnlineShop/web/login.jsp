<%@page import="modelo.Usuario"%>
<%@page import="persistencia.PersistenceInterface"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<% boolean iniciado = false;
   PersistenceInterface persistencia = (PersistenceInterface) application.getAttribute("persistence");
   if (session.getAttribute("auth") != null && (Boolean) session.getAttribute("auth") == true && session.getAttribute("usuario") != null){ 
       Usuario user = persistencia.getUser((String)session.getAttribute("usuario"));
       if (user != null){
            iniciado = true;
       }else{
            response.sendRedirect("/logout");
       }
} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Login</title>

<script type="text/javascript" src="/scripts/jquery-1.6.1.js"></script>
<script type="text/javascript" src="/scripts/vanadium.js"></script>

<link rel="stylesheet" type="text/css" href="/css/screen_yellow.css" media="screen, tv, projection" />
<link rel="stylesheet" type="text/css" href="/css/validacion.css" media="screen, tv, projection" />
</head>

<body>
<!-- Contenedor principal-->
<div id="siteBox">

	<!--Cabecera-->
    <%@include file="/WEB-INF/include/header.jsp" %>
  
  <!-- Contenido de la pagina -->
  <div id="content">
  
  <!-- Menu Izquiero -->
  <%@include file="/WEB-INF/include/menu.jsp" %>
    
    <!-- Contenido de la columna derecha -->
    <div id="contentRight">
        <%@include file="/WEB-INF/include/resultados.jsp" %>
        <% if (iniciado == true){ %>
        <p>
            <span class="header">Sesión ya iniciada</span>
            <br />
            Ya tiene sesión iniciada con un usuario. Debe <a href="/logout">cerrar la sesión</a> con este usuario si desea iniciar sesión con otro usuario.
        </p>                
        <% }else{ %>
        
          
    <p>
        <span class="header">Iniciar sesión</span>

        <form action="/login" name="login" method="post">
        
        Email<br />
	<input name="email" type="text" maxlength="60" class=":email :required :only_on_blur" /><br /><br />
        
        Contraseña<br />
        <input name="pass" type="password" size="25"  maxlength="20" class=":password :required :only_on_blur"/><br /><br />
        
        <input name="login" type="submit" value="Iniciar Sesión" />
        </form>

    </p>
        
    <p>
        <a name="register"></a>
        <span class="header">Registro</span><br />
        <form action="/register" method="post" name="register">

        Nombre<br />
        <input name="name" type="text" size="50" maxlength="100" class=":alpha :required :only_on_blur"/><br /><br />
        
        Dirección<br />
        Ejemplo: Calle, 1 28002-Madrid<br />
        <input name="dir" type="text" size="70" maxlength="200" class=":dir :required :only_on_blur"/><br /><br />
        
        Email<br />
        <input name="email" type="text" size="30" maxlength="60" class=":email :required :only_on_blur"/><br /><br />
        
        Contraseña<br />
        <input id="pass" name="pass" type="password" size="25" maxlength="20" class=":password :required :only_on_blur"/><br /><br />
        
        Reescriba la contraseña por seguridad<br />
        <input name="repeatPass" type="password" size="25" maxlength="20" class=":same_as;pass :required :only_on_blur"/><br /><br />
        
        <input name="register" type="submit" value="Enviar datos" />
        
        </form>
    </p>
        
        <% } %>
        
        

      
      <!-- Crea las esquinas redondeadas abajo -->
      <img src="/images/template/corner_sub_bl.gif" alt="bottom corner" class="vBottom"/>
    
    </div>
</div>

<!-- Pie de pagina -->
<%@include file="/WEB-INF/include/footer.jsp" %>

</div>

</body>
</html>

<%! String menuInicio = ""; %>
<%! String menuProductos = ""; %>
<%! String menuLogin = "class=\"active\""; %>
<%! String menuPreferencias = ""; %>
<%! String menuAbout = ""; %>