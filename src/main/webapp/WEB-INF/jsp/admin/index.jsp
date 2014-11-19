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
                            <a class="item" id="btnNewSM">
                                 <i class="file outline icon"></i> <fmt:message key="submenu.newSM"/>
                            </a>
                            <a class="item">
                                 <i class="briefcase icon"></i> <fmt:message key="submenu.history"/>
                            </a>
                        </div>
                    </div>
                </div>

            	<!-- Manutencao de SMs -->
            	<form action="${linkTo[AdminController].saveSM}" method="POST" class="ui form raised teal fluid small segment" id="formNewSM" style="display:none;">
            		<input type="hidden" name="sm.id" />
                    <div class="two fields">
                        <div class="field">
                            <label>Nome</label>
                            <input name="sm.nome" placeholder="Nome" type="text">
                        </div>
                        <div class="field">
                            <label>Data</label>
                            <input name="sm.data" placeholder="Ex.: 01/01/2014" type="text">
                        </div>
                    </div>
                    <div style="float:right;">
                        <a class="ui button negative mini" href="${linkTo[AdminController].index}">
                            Cancelar
                        </a>
                        <button class="ui button positive mini" type="submit">
                            Salvar
                        </button>
                    </div>
                    <br />
            	</form>
            	
                <!-- Tabela: Solicitacoes de Mudanca -->
                <div>
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
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                
                <br />
                
                <!-- Manutencao de Atividades -->
                <form action="${linkTo[AdminController].saveActivity}" method="POST" class="ui form raised teal fluid small segment" id="formNewActivity" style="display:none;">
                    <p><i class="warning icon"></i> Você está criando uma nova atividade para <b id="bNameSM"></b></p>
                    <input type="hidden" name="atividade.sm.id" />
                    <input type="hidden" name="atividade.id" />
                    <div class="two fields">
                        <div class="field">
                            <label>Descrição</label>
                            <input name="atividade.descricao" placeholder="Descrição" type="text">
                        </div>
                        <div class="field">
                            <label>Branch</label>
                            <input name="atividade.branch" placeholder="URL do repositório" type="text">
                        </div>
                    </div>
                    <div style="float:right;">
                        <a class="ui button negative mini" href="${linkTo[AdminController].index}">
                            Cancelar
                        </a>
                        <button class="ui button positive mini" type="submit">
                            Salvar
                        </button>
                    </div>
                    <br />
            	</form>

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
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                        
            </div>
        </div>
        
        <!-- Scripts -->
        <jsp:include page="../fragment/script.jsp" />
        <script>
            var listSMs = [],
            
            editSM = function(id) {
            	listSMs.forEach(function(sm) {
            		if (sm.id == id) {
            			$('#formNewSM input[name="sm.id"]').val(sm.id);
                    	$('#formNewSM input[name="sm.nome"]').val(sm.nome);
                    	$('#formNewSM input[name="sm.data"]').val(new Date(sm.data).toLocaleDateString());
                    	$('#formNewSM').show(300);
            		}
            	});
            },
            
            removeSM = function(idSM) {
            	$.post('${linkTo[SolicitacaoMudancaController].remove}', {id:idSM}, function() {
					$('#tableSMs tr[id="trSM'+idSM+'"]').remove();
            	});
            },
            
            buildActivities = function(idSM) {
				$('#divActivities').hide();
				$("#tableActivities tbody tr").remove();
				listSMs.forEach(function(sm) {
					if (sm.id == idSM) {
						$.get('${linkTo[AtividadeController].list}', {"sm.id":idSM}, function(data) {
							if (data) {
								sm.atividades = data;
								data.forEach(function(activity) {
									var tr = '' +
										'<tr id="trActivity'+activity.id+'">' +
											'<td>'+activity.descricao+'</td>' +
											'<td>'+activity.branch+'</td>' +
											'<td>' +
												'<button class="ui mini basic button" onclick="editActivity('+sm.id+','+activity.id+')">' +
		                                        	'<i class="edit icon"></i>' +
		                                        	'<fmt:message key="btn.edit"/>' +
		                                    	'</button>' +
										        '<button class="ui mini basic button" onclick="removeActivity('+activity.id+')">' +
										            '<i class="remove sign icon"></i>' +
										            '<fmt:message key="btn.remove"/>' +
										        '</button>' +
											'</td>' +
										'</tr>';
									$("#tableActivities tbody").append(tr);
								});
							} else {
								alert("Nenhuma atividade cadastrada para essa SM.");
							}
			            }, 'json')
			            .done(function() {
			            	$('#tableActivities').tablesort();
							$('#divActivities').show(300);
			            });
					}
				});
			},
			
			newActivity = function(idSM) {
				listSMs.forEach(function(sm) {
					if (sm.id == idSM) {
						$('#bNameSM').text(sm.nome);
		            	$('#formNewActivity input[name="atividade.sm.id"]').val(sm.id);
						$('#formNewActivity input[name="atividade.id"]').val('');
		            	$('#formNewActivity input[name="atividade.branch"]').val('');
		            	$('#formNewActivity input[name="atividade.descricao"]').val('');
		            	$('#formNewActivity').show(300);
					}
				});
			},
			
			editActivity = function(idSM,idActivity) {
				listSMs.forEach(function(sm) {
					if (sm.id == idSM) {
						sm.atividades.forEach(function(activity) {
							if (activity.id == idActivity) {
								$('#bNameSM').text(sm.nome);
				            	$('#formNewActivity input[name="atividade.sm.id"]').val(sm.id);
								$('#formNewActivity input[name="atividade.id"]').val(activity.id);
				            	$('#formNewActivity input[name="atividade.branch"]').val(activity.branch);
				            	$('#formNewActivity input[name="atividade.descricao"]').val(activity.descricao);
				            	$('#formNewActivity').show(300);
							}
						});
					}
				});
            },
            
            removeActivity = function(idActivity) {
            	$.post('${linkTo[AtividadeController].remove}', {id:idActivity}, function() {
					$('#tableActivities tr[id="trActivity'+idActivity+'"]').remove();
            	});
            };
            
            $.get('${linkTo[SolicitacaoMudancaController].list}', function(data) {
            	if (!data) return;
            	listSMs = data;
            	data.forEach(function(sm) {
	            	var tr = '' +
		            	'<tr id="trSM'+sm.id+'">' +
			            	'<td>'+new Date(sm.data).toLocaleDateString()+'</td>' +
			                '<td>'+sm.nome+'</td>' +
			                '<td>' +
			                    '<button class="ui mini basic button" onclick="newActivity('+sm.id+')">' +
			                        '<i class="add sign box icon"></i>' +
			                        '<fmt:message key="btn.newActivity"/>' +
			                 	'</button>' +
			                    '<div class="ui mini basic button" onclick="buildActivities('+sm.id+')">' +
			                        '<i class="tasks icon"></i>' +
			                        '<fmt:message key="btn.scope"/>' +
			                    '</div>' +
			                	'<button class="ui mini basic button" onclick="editSM('+sm.id+')">' +
			                    	'<i class="edit icon"></i>' +
			                    	'<fmt:message key="btn.edit"/>' +
			                	'</button>' +
			                    '<div class="ui mini basic button" onclick="removeSM('+sm.id+')">' +
			                        '<i class="remove sign icon"></i>' +
			                        '<fmt:message key="btn.remove"/>' +
			                    '</div>' +
			                '</td>' +
		        		'</tr>';
	            	$("#tableSMs tbody").append(tr);
            	});
            }, 'json')
            .done(function() {
        		$('#tableSMs').tablesort();
        	});
            
            $('#btnNewSM').click(function() {
            	$('#formNewSM input[name="sm.id"]').val('');
            	$('#formNewSM input[name="sm.nome"]').val('');
            	$('#formNewSM input[name="sm.data"]').val('');
            	$('#formNewSM').show(300);
            });
        </script>
        
    </body>

</html>