<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="pt-br">
<head>
	<title>Gerenciamento de Gestores</title>
	<meta charset="utf-8" />
	<style type="text/css">
		h1{
		font: 4em Impact, Arial Black, sans-serif;
		color: black;
		padding-bottom: 10px;
		}
		table {
		    overflow:hidden;
		    border-collapse:collapse;
		    border: solid #ccc 1px;
		}

		table td {
		    color: #aaa;
		    background-color: white;
		    padding: 5px;
		    
		}
		
		table th{
		    color: white;
		    background-color: #303F9F;
		    font-weight: normal;
		    text-align: center;
		    font-size: 20px;
		}

        input[type="button"], input[type="submit"]{
            font: 1em Avenir;
            color: #FFF;
            background: #303F9F;
            border-collapse: collapse;
            border-radius: 10px;
        }

        input[type="submit"]{
            background: #c62828;
            width: 100px;
            height: 35px;
        }
		
	</style>
</head>
<body>
	<center>
		<h1>Gerenciamento de Gestores</h1>
        <h2>


        	&nbsp;&nbsp;&nbsp;
        	<a href="list"><input type="button" class="botao" value="Listar todos os Gestores"></a>
        	
        </h2>
	</center>
    <div align="center">
		<c:if test="${gestor != null}">
			<form action="update" method="post">
        </c:if>
        <c:if test="${gestor == null}">
			<form action="insert" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${gestor != null}">
            			Editar Gestor
            		</c:if>
            		<c:if test="${gestor == null}">
            			Adicionar novo Gestor
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${gestor != null}">
        			<input type="hidden" name="id" value="<c:out value='${gestor.id}' />" />
        		</c:if>            
            <tr>
                <th>Nome: </th>
                <td>
                	<input type="text" name="name" size="45" required
                			value="<c:out value='${gestor.name}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Matrícula: </th>
                <td>
                	<input type="text" name="matricula" size="45" required
                			value="<c:out value='${gestor.matricula}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Data de Nascimento: </th>
                <td>
                	<input type="date" name="datan" size="15" required
                			value="<c:out value='${gestor.datan}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Setor: </th>
                <td>
                	<!-- <input type="text" name="setor" size="15"
                			value="<c:out value='${gestor.setor}' />"
                	/> -->
                	<select name="setor" required>
                	  <option value="">Selecione uma opção</option>
					  <option value="A">Administrativo</option>
					  <option value="T">Tecnologia</option>
					  <option value="R">Recursos humanos</option>
					  <option value="H">Help Desk</option>
					</select>
                </td>
            </tr>
        </table>
        <h2><input type="submit" value="Salvar" /></h2>

        </form>
    </div>	
</body>
</html>
