<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
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
                             <i class="dashboard icon"></i> Dashboard
                        </a>
                        <div class="right menu">
                            <a class="item" href="${linkTo[SolicitacaoReintegrateController].add}">
                                 <i class="text file outline icon"></i> Nova Solicitação
                            </a>
                            <a class="item" id="btnInfo">
                                 <i class="info icon"></i> Sobre
                            </a>
                        </div>
                    </div>
                    <div class="ui sub menu">
                         <a class="active item">Tudo</a>
                         <c:forEach items="${sms}" var="sm">
                             <a class="item" href="${linkTo[DashboardController].filter(sm.id)}">${sm.nome}</a>
                         </c:forEach>
                    </div>
                </div>
              
                <!-- Estatisticas gerais -->
                <div class="ui four column grid">
                    <div class="column">
                         <h2 class="ui inverted red block header">
                            <i class="circular warning icon"></i>
                            <div class="content">
                                15
                                <div class="sub header">
                                    <span style="font-size:10px;">Pendente de Reintegrate</span>
                                </div>
                            </div>
                        </h2>
                    </div>
                    <div class="column">
                         <h2 class="ui inverted purple block header">
                            <i class="circular right icon"></i>
                            <div class="content">
                                3
                                <div class="sub header">
                                    <span style="font-size:10px;">Pendente de Deploy</span>
                                </div>
                            </div>
                        </h2>
                    </div>
                    <div class="column">
                         <h2 class="ui inverted teal block header">
                            <i class="circular cloud upload icon"></i>
                            <div class="content">
                                11
                                <div class="sub header">
                                    <span style="font-size:10px;">Deploy em andamento</span>
                                </div>
                            </div>
                        </h2>
                    </div>
                    <div class="column">
                         <h2 class="ui inverted green block header">
                            <i class="circular checkmark icon"></i>
                            <div class="content">
                                7
                                <div class="sub header">
                                    <span style="font-size:10px;">Implantado</span>
                                </div>
                            </div>
                        </h2>
                    </div>
                </div>

                <!-- Tabelas de Dados -->
                <div class="ui two column grid">
                    <div class="column">
                        <h5 class="ui top attached header">
                            Últimas Solicitações
                        </h5>
                        <div class="ui segment attached">
                            <table class="ui middle aligned compact basic mini sortable table" id="tableLatestSolicitations">
                                <thead>
                                    <tr>
                                        <th>Data/Hora</th>
                                        <th>Solicitação</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="text-align: center;">
                                             <span>12 Junho, 2014</span>
                                            <br>
                                             <i class="time icon"></i><span> 15:01</span>
                                        </td>
                                        <td>
                                            <b>D77676: Lorem ipsum dolor sit amet</b>
                                            <br>
                                            <span>Revisions: 22321, 76545, 90876, 53434</span>
                                        </td>
                                        <td>
                                             <div class="ui red small label">Pendente</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                             <span>12 Junho, 2014</span>
                                            <br>
                                             <i class="time icon"></i><span> 13:35</span>
                                        </td>
                                        <td>
                                             <b>D12345: Uma demanda em homologação</b>
                                            <br>
                                             <span>Revisions: 12345, 54555, 43422, 87878</span>
                                        </td>
                                        <td>
                                             <div class="ui red small label">Pendente</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                             <span>12 Junho, 2014</span>
                                            <br>
                                             <i class="time icon"></i><span> 14:11</span>
                                        </td>
                                        <td>
                                             <b>INC00000023456: Um incidente em produção</b>
                                            <br>
                                             <span>Revisions: 12345</span>
                                        </td>
                                        <td>
                                             <div class="ui yellow small label">Executando</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                             <span>12 Junho, 2014</span>
                                            <br>
                                             <i class="time icon"></i><span> 11:13</span>
                                        </td>
                                        <td>
                                             <b>QC403: Um bug coletado internamente</b>
                                            <br>
                                             <span>Revisions: 99765, 43434</span>
                                        </td>
                                        <td>
                                             <div class="ui green small label">Finalizado</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                             <span>12 Junho, 2014</span>
                                            <br>
                                             <i class="time icon"></i><span> 10:57</span>
                                        </td>
                                        <td>
                                            <b>D44443: Demanda de Teste</b>
                                            <br>
                                            <span>Revisions: 11224, 56432</span>
                                        </td>
                                        <td>
                                             <div class="ui green small label">Finalizado</div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center;">
                                             <span>12 Junho, 2014</span>
                                            <br>
                                             <i class="time icon"></i><span> 10:44</span>
                                        </td>
                                        <td>
                                            <b>D77676: Lorem ipsum dolor sit amet</b>
                                            <br>
                                            <span>Revisions: 11224, 56432</span>
                                        </td>
                                        <td>
                                             <div class="ui green small label">Finalizado</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                      
                    <!-- Tabela de Atividades -->
                    <div class="column">
                        <h5 class="ui top attached header">
                            Atividades
                        </h5>
                        <div class="ui segment attached">
                            <table class="ui middle aligned compact basic mini sortable table" id="tableActivities">
                                <thead>
                                    <tr>
                                        <th>Descrição</th>
                                        <th>Branch</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>D22323: Uma demanda de teste</td>
                                        <td>https://github.com/viniciusknob/deployment-monitor</td>
                                    </tr>
                                    <tr>
                                        <td>QC323: Um bug encontrado</td>
                                        <td>https://github.com/nicolasbouvie/deployment-monitor</td>
                                    </tr>
                                    <tr>
                                        <td>INC123459: Um incidente em produção</td>
                                        <td>https://github.com/gelias/dojo-vraptor4</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
        <!-- Modais -->
        <div class="ui basic modal" id="modalInfo">
             <i class="close icon"></i>
            <div class="header">Informação</div>
            <div class="content">
                <div class="left">
                     <i class="info icon"></i>
                </div>
                <div class="right">
                    <h3 class="ui header">Solicitação de Reintegrate para Deploy (SRD)</h3>
                    <p>Antigo "Descritor de Reintegrate". Uma SRD é mais simples e também mais rápida de criar.</p>
                    <h3 class="ui header">Pacote</h3>
                    <p>Conjunto de SRDs de uma mesma aplicação que serão implantadas juntas.</p>
                    <h3 class="ui header">Status</h3>
                    <p>Estado da SRD, pode assumir:</p>
                    <ol class="ui list">
                        <li>Pendente de Reintegrate</li>
                        <li>Reintegrado/Pendente de Deploy</li>
                        <li>Deploy em Andamento</li>
                        <li>Implantado/Finalizado</li>
                    </ol>
                </div>
            </div>
            <div class="actions">
                <div class="ui button">Okay</div>
            </div>
        </div>
      
        <!-- Scripts -->
        <jsp:include page="../fragment/script.jsp" />
        <script>
            $('#modalInfo')
                .modal('attach events', '#btnInfo', 'show')
                .modal('setting', 'transition', 'vertical flip');
            $('#tableLatestSolicitations,#tableActivities').tablesort();
        </script>
        
  </body>
</html>