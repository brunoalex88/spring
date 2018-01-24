<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-flex">
<nav class="navbar navbar-default sidebar" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
    <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">Livros<span class="caret"></span><span style="font-size:16px; margin-left: 8px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a>
          <ul class="dropdown-menu forAnimate" role="menu">
            <li><a href="<c:url value="/livros/form" />">Cadastrar</a></li>
            <li><a href="<c:url value="/livros/list" />">Listar</a></li>
          </ul>
        </li>          
        <li ><a href="#">Shopping<span style="font-size:16px; margin-left: 8px;;" class="pull-right hidden-xs showopacity glyphicon glyphicon-shopping-cart"></span></a></li>        
        <li ><a href="#">Sair<span style="font-size:16px; margin-left: 8px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
</div>