<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<!--
    Tarefas:
        Alterar btnActivityRecord por btnActivityRecord${activity.id}
-->
<html>

    <jsp:include page="../fragment/header.jsp" />

    <body>

        <!-- Conteudo -->
        <div class="ui one column page grid">
            <div class="column">

                <!-- Menu -->
                <div class="ui tiered teal menu">
                    <div class="menu">
                        <a class="active item">
                             <i class="settings icon"></i> <fmt:message key="menu.admin"/>
                        </a>
                        <div class="right menu">
                            <a class="item" href="${linkTo[DashboardController].index}">
                                 <i class="dashboard icon"></i> <fmt:message key="menu.dashboard"/>
                            </a>
                            <a class="item" id="btnInfo">
                                 <i class="info icon"></i> <fmt:message key="menu.about"/>
                            </a>
                        </div>
                        <div class="ui sub menu">
                            <a class="active item">
                                 <i class="desktop icon"></i> <fmt:message key="submenu.current"/>
                            </a>
                            <a class="item">
                                 <i class="briefcase icon"></i> <fmt:message key="submenu.history"/>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="ui grid">
                    <div class="twelve wide column">
                        <!-- Tabela: Solicitacoes de Mudanca -->
                        <div id="divChangeRequest">
                            <h5 class="ui inverted top attached teal header">
                                <fmt:message key="header.sms"/>
                            </h5>
                            <div class="ui segment attached">
                                <table class="ui middle aligned compact small basic sortable table" id="tableSMs">
                                    <thead>
                                        <tr>
                                            <th><fmt:message key="table.head.dateHour"/></th>
                                            <th><fmt:message key="table.head.name"/></th>
                                            <th><fmt:message key="table.head.actions"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${sms}" var="sm">
	                      					<tr>
	                                        	<td contenteditable="true">
	                                                <fmt:formatDate value="${sm.data}" pattern="dd MMM, yyyy"/>
	                                            </td>
	                                            <td contenteditable="true">${sm.nome}</td>
	                                            <td>
	                                                 <div class="ui mini basic button" id="btnSMRecord${sm.id}">
	                                                      <i class="hdd icon"></i>
	                                                      <fmt:message key="btn.archive"/>
	                                                  </div>
	                                                  <div class="ui mini basic button" onclick="loadActivities(${sm.id})">
	                                                      <i class="tasks icon"></i>
	                                                      <fmt:message key="btn.scope"/>
	                                                  </div>
	                                             </td>
	                                          </tr>
                    					</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <br class="clear:both;" />
        
                        <!-- Tabela: Escopo da SMs, Atividades -->
                        <div id="divActivities" style="display:none;">
                            <h5 class="ui inverted top attached green header">
                                <fmt:message key="header.scope"/>
                            </h5>
                            <div class="ui segment attached">
                                <table class="ui middle aligned compact small basic sortable table" id="tableActivities">
                                    <thead>
                                        <tr>
                                            <th><fmt:message key="table.head.description"/></th>
                                            <th><fmt:message key="table.head.branch"/></th>
                                            <th><fmt:message key="table.head.actions"/></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td contenteditable="true">D23483: Uma demanda em homologacao
                                            </td>
                                            <td contenteditable="true">https://github.com/viniciusknob/deployment-monitor
                                            </td>
                                            <td>
                                                <div class="ui mini basic button" id="btnActivityRecord12">
                                                    <i class="hdd icon"></i>
                                                    <fmt:message key="btn.archive"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td contenteditable="true">INC999988: Um incidente em producao
                                            </td>
                                            <td contenteditable="true">https://github.com/nicolasbouvie/deployment-monitor
                                            </td>
                                            <td>
                                                <div class="ui mini basic button" id="btnActivityRecord12">
                                                    <i class="hdd icon"></i>
                                                    <fmt:message key="btn.archive"/>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <h5 class="ui inverted top attached red header">
                            Alteracoes
                        </h5>
                        <div class="ui segment attached">
                            Nenhuma alteracao para salvar!
                        </div>
                        <div class="ui inverted bottom attached black header">
                            <div class="ui two fluid buttons">
                                <div class="mini ui negative button">
                                    Cancelar
                                </div>
                                <div class="mini ui positive button">
                                    Salvar
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
        <!-- Scripts -->
        <jsp:include page="../fragment/script.jsp" />
        <script>
            $('#tableSMs').tablesort();
            var loadActivities = function(idSM) {
              $('#divActivities').hide(300);
              $("#tableActivities tbody tr").remove();
                $.ajax({
                    url: "${pageContext.request.contextPath}/api/sm/" + idSM,
                    contentType: 'application/json'
                }).then(function(data) {
                  if (data.solicitacaoMudanca.atividades) {
                        $.each(data.solicitacaoMudanca.atividades, function() {
                            var tr = '<tr>' +
                                        '<td contenteditable="true">'+this.descricao+'</td>' +
                                        '<td contenteditable="true">'+this.branch+'</td>' +
                                        '<td>' +
                                            '<div class="ui mini basic button" id="btnActivityRecord'+this.id+'">' +
                                                '<i class="hdd icon"></i>' +
                                                'Arquivar' +
                                            '</div>' +
                                        '</td>' +
                                    '</tr>';
                            $("#tableActivities tbody").append(tr);
                        });
                        $('#tableActivities').tablesort();
                        $('#divActivities').show(300);
                  } else {
                    alert("Nenhuma atividade cadastrada para essa SM.");//TODO
                  }
                });
            };
            $('td[contenteditable="true"]').blur(function(){
                alert(this.innerText);
            });
        </script>
        
    </body>

</html>