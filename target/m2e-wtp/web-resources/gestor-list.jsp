<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">
<head>
	<title>Gerenciamento de Gestores</title>
	<meta charset="utf-8" />
	<link rel="stylesheet" type="text/css" href="estilo.css">
	<style type="text/css">
		h1{
		font: 4em Impact, Arial Black, sans-serif;
		color: #black;
		padding-bottom: 10px;
		}
		.table-round-corner {
		    margin-top: 15px;
		    width: 60%;
		    text-align: center;
		    overflow:hidden;
		    border-collapse:separate;
		    border: solid #ccc 1px;
		}

		table td {
		    color: black;
		    background-color: white;
		    padding: 5px;
		    border: 1px #ddd;
		}
		
		table th{
		    color: white;
		    background-color: #303F9F;
		    font-weight: normal;
		    text-align: center;
		    padding: 5px;
		    font-size: 20px;
		}

		input[type="button"]{
            font: 1em Avenir;
            color: #FFF;
            background: #303F9F;
            border-collapse: collapse;
            border-radius: 10px;
        }
		
	</style>
</head>
<body>
	<center>
		<h1>Gerenciamento de Gestores</h1>
        <h2>
        	<a href="new"><input type="button" class="botao" value="Adicionar novo Gestor"></a>
        	&nbsp;&nbsp;&nbsp;
        	
        </h2>
	</center>
    <div align="center">
        <table class="table-round-corner" cellspacing="0">
            <caption><h2>Lista de Gestores</h2></caption>
            <tr>
                <th class="topo">ID</th>
                <th class="topo">Nome</th>
                <th class="topo">Matrícula</th>
                <th class="topo">Setor</th>
                <th class="topo">Data de Nascimento</th>
                <th class="topo">Ações</th>
            </tr>
            <c:forEach var="gestor" items="${listGestor}">
                <tr>
                    <td><c:out value="${gestor.id}" /></td>
                    <td><c:out value="${gestor.name}" /></td>
                    <td><c:out value="${gestor.matricula}" /></td>
                    <td><c:out value="${gestor.setor}" /></td>
                    <td><c:out value="${gestor.datan}" /></td>
                    <td>
                    	<a href="edit?id=<c:out value='${gestor.id}' />">Editar</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete?id=<c:out value='${gestor.id}' />">Excluir</a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>	
</body>
</html>
