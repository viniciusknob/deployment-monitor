<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--
    Tarefas:
        Alterar btnActivityRecord por btnActivityRecord${activity.id}
-->
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properities -->
        <title>Deployment Monitor - �rea Administrativa</title>
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="semantic-ui-0.19.3/css/semantic.min.css">
        <style>
            /***** Custom *****/
            html, body {
                font-size: 15px;
            }
            body {
                font-family:"Lato", sans-serif;
                margin: 0;
                color: #555555;
                background-color: whitesmoke;
            }
            .ui.mini.table {
                font-size: .7em;
            }
            .ui.label {
                text-transform: none;
                padding: .2em .8em;
                margin: 0;
            }
            .ui.yellow.label, .ui.yellow.labels .label {
                background-color: #fcd419;
                border-color: #fcd419;
                color: darkgoldenrod;
            }
            .ui.form.loading:after {
                z-index: 2;
            }
        </style>
    </head>

    <body>

        <!-- Conteudo -->
        <div class="ui one column page grid">
            <div class="column">

                <!-- Menu -->
                <div class="ui tiered teal menu">
                    <div class="menu">
                        <a class="active item">
                             <i class="settings icon"></i> �rea Administrativa
                        </a>
                        <div class="right menu">
                            <a class="item" href="${linkTo[DashboardController].index}">
                                 <i class="dashboard icon"></i> Dashboard
                            </a>
                            <a class="item" id="btnInfo">
                                 <i class="info icon"></i> Sobre
                            </a>
                        </div>
                        <div class="ui sub menu">
                            <a class="active item">
                                 <i class="desktop icon"></i> O que est� acontecendo...
                            </a>
                            <a class="item">
                                 <i class="briefcase icon"></i> Hist�rico
                            </a>
                        </div>
                    </div>
                </div>

                <div class="ui grid">
                    <div class="twelve wide column">
                        <!-- Tabela: Solicita��es de Mudan�a -->
                        <div id="divChangeRequest">
                            <h5 class="ui inverted top attached teal header">
                                Solicita��es de Mudan�a
                            </h5>
                            <div class="ui segment attached">
                                <table class="ui middle aligned compact small basic sortable table" id="tableSMs">
                                    <thead>
                                        <tr>
                                            <th>Data/Hora</th>
                                            <th>Nome</th>
                                            <th>A��es</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach items="${sms}" var="sm">
                      <tr>
                                              <td contenteditable="true">
                                                <fmt:formatDate value="${sm.data}" pattern="dd MMM, yyyy"/>
                                              </td>
                                              <td contenteditable="true">
                                                ${sm.nome}
                                              </td>
                                              <td>
                                                  <div class="ui mini basic button" id="btnSMRecord${sm.id}">
                                                       <i class="hdd icon"></i>
                                                      Arquivar
                                                  </div>
                                                  <div class="ui mini basic button" onclick="loadActivities(${sm.id})">
                                                       <i class="tasks icon"></i>
                                                      Escopo
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
                                Escopo
                            </h5>
                            <div class="ui segment attached">
                                <table class="ui middle aligned compact small basic sortable table" id="tableActivities">
                                    <thead>
                                        <tr>
                                            <th>Descri��o</th>
                                            <th>Branch</th>
                                            <th>A��es</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td contenteditable="true">D23483: Uma demanda em homologa��o
                                            </td>
                                            <td contenteditable="true">https://github.com/viniciusknob/deployment-monitor
                                            </td>
                                            <td>
                                                <div class="ui mini basic button" id="btnActivityRecord12">
                                                     <i class="hdd icon"></i>
                                                    Arquivar
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td contenteditable="true">INC999988: Um incidente em produ��o
                                            </td>
                                            <td contenteditable="true">https://github.com/nicolasbouvie/deployment-monitor
                                            </td>
                                            <td>
                                                <div class="ui mini basic button" id="btnActivityRecord12">
                                                     <i class="hdd icon"></i>
                                                    Arquivar
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
                            Altera��es
                        </h5>
                        <div class="ui segment attached">
                            Nenhuma altera��o para salvar!
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
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="semantic-ui-0.19.3/js/semantic.min.js"></script>
        <script src="semantic-ui-0.19.3/js/tablesort.js"></script>
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