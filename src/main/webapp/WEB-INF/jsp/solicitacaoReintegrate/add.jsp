<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properities -->
        <title>Deployment Monitor - Nova Solicitação</title>
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/semantic-ui-0.19.3/css/semantic.min.css">
        <style>
            /*******************************
                        Global
            *******************************/
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

        <!-- Content -->
        <div class="ui one column page grid">
            <div class="column">

                <!-- Menu -->
                <div class="ui tiered teal menu">
                    <div class="menu">
                        <a class="active item">
                             <i class="text file outline icon"></i> Nova Solicitação
                        </a>
                        <div class="right menu">
                            <a class="item" href="${linkTo[DashboardController].index}">
                                 <i class="dashboard icon"></i> Dashboard
                            </a>
                            <a class="item" id="btnInfo">
                                 <i class="info icon"></i> Sobre
                            </a>
                        </div>
                    </div>
                    <div class="ui sub menu">
                         <a class="active item">Solicitação de Reintegrate para Deploy</a>
                    </div>
                </div>

                <!-- Steps -->
                <div class="ui five steps">
                    <div class="ui active step" id="step1">Informações Gerais</div>
                    <div class="ui disabled step" id="step2">Revisions</div>
                    <div class="ui disabled step" id="step3">Issues</div>
                    <div class="ui disabled step" id="step4">Confirmação</div>
                    <div class="ui disabled step" id="step5">Pronto!</div>
                </div>

                <!-- Step 1 -->
                <div class="ui small fluid form segment" id="formStep1">
                    <br />
                    <div class="two fields">
                        <div class="field">
                            <div class="ui pointing below black label">SM
                            </div>
                            <a class="ui pointing below label" id="btnAddSM" style="float: right;">
                                Minha SM não existe!
                            </a>
                            <div class="ui fluid selection dropdown" id="dropdownSM">
                                <input type="hidden" name="sm" id="selectedSM">
                                <div class="default text">Selecione...</div>
                                 <i class="dropdown icon"></i>
                                <div class="menu">
                                    <c:forEach items="${listSM}" var="sm">
                                        <div class="item" data-value="${sm.id}">${sm.nome}</div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="disabled field" id="field2step1">
                            <div class="ui pointing below black label">Atividade
                            </div>
                            <a class="ui pointing below label" id="btnAddActivity" style="float: right;">
                                Minha atividade não existe!
                            </a>
                            <div class="ui fluid selection dropdown" id="dropdownActivity">
                                <input type="hidden" name="atividade" id="nrAtividade">
                                <div class="default text">Selecione...</div>
                                 <i class="dropdown icon"></i>
                                <div class="menu">
                                    <!-- Exemplo
                                    <div class="item" data-value="id1">12345: Uma demanda</div>
                                    <div class="item" data-value="id2">456: Um QC</div>
                                    <div class="item" data-value="id3">567890: Um INC</div>
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="ui secondary large menu">
                        <div class="right menu">
                             <a class="active item" id="btnNextStep1">
                                Próximo <i class="long arrow right icon"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Step 2 -->
                <div class="ui small fluid form segment" id="formStep2" style="display:none;">
                    <br />
                    <div class="field">
                        <table class="ui middle aligned compact basic small sortable table" id="tableRevisions">
                            <thead>
                                <tr>
                                    <th>Revision</th>
                                    <th>Author</th>
                                    <th>Date</th>
                                    <th>Message</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Exemplo
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[0]" value="22356" id="22356">
                                            <label>22356</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>06 Jun, 2014 <i class="time icon"></i> 13:06</td>
                                    <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</td>
                                </tr>
                                -->
                            </tbody>
                        </table>
                    </div>
                    <br />
                    <div class="ui secondary large menu">
                        <a class="active item" id="btnPrevStep2">
                             <i class="long arrow left icon"></i> Voltar
                        </a>
                        <div class="right menu">
                             <a class="active item" id="btnNextStep2">
                                Próximo <i class="long arrow right icon"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Step 3 -->
                <div class="ui small fluid form segment" id="formStep3" style="display:none;">
                    <br />
                    <div class="field" id="fieldIssues">
                        <label>Issues</label>
                        <input type="text">
                    </div>
                    <div class="inline field">
                        <div class="ui checkbox" id="noIssue">
                            <input type="checkbox">
                            <label>Não possui issue</label>
                        </div>
                    </div>
                    <div style="display: none;" id="fieldMotivo">
                        <div class="ui icon message">
                             <i class="circular exclamation icon"></i>
                            <div class="content">
                                <div class="header">Descreva um motivo!
                                </div>
                                <p>Você está solicitando uma modificação na implementação original que pode estar implantada em ambiente de homologação e em estágio de testes.</p>
                            </div>
                        </div>
                        <div class="grouped inline fields">
                            <div class="field" style="padding-bottom: .5em;">
                                <div class="ui radio checkbox">
                                    <input id="choice-1" type="radio" name="noIssues" checked="">
                                    <label for="choice-1">Esta é a primeira SRD da atividade</label>
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input id="choice-2" type="radio" name="noIssues">
                                    <label for="choice-2">Esta atividade ainda não está em testes</label>
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input id="choice-3" type="radio" name="noIssues">
                                    <label for="choice-3">Outro motivo:</label>
                                </div>
                                <input class="fluid" type="text">
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="ui secondary large menu">
                        <a class="active item" id="btnPrevStep3">
                             <i class="long arrow left icon"></i> Voltar
                        </a>
                        <div class="right menu">
                            <a class="active item" id="btnNextStep3">
                                Próximo <i class="long arrow right icon"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Step 4 -->
                <div class="ui small fluid form segment" id="formStep4" style="display:none;">
                    <br />
                    <div class="ui grid">
                        <div class="four wide column"></div>
                        <div class="eight wide column">
                            <div class="ui secondary inverted segment">
                                <div class="ui teal ribbon label">SM</div>
                                <p>Release 9</p>
                                <div class="ui teal ribbon label">Atividade</div>
                                <p>D22344: Um teste de demanda em homologação</p>
                                <div class="ui teal ribbon label">Revisions</div>
                                <p>12122, 12334, 44323, 55456</p>
                                <div class="ui teal ribbon label">Issues</div>
                                <p>Esta atividade ainda não está em testes</p>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="ui secondary large menu">
                        <a class="active item" id="btnPrevStep4">
                             <i class="long arrow left icon"></i> Voltar
                        </a>
                        <div class="right menu">
                            <a class="active item" id="btnNextStep4">
                                 <i class="checkmark icon"></i> Confirmar
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Step 5 -->
                <div class="ui center aligned small fluid form segment" id="formStep5" style="display:none;">
                    <div class="ui green icon center aligned header" style="font-size: 32px;">
                         <i class="circular checkmark icon"></i> Pronto!
                        <div class="sub header" style="font-size: 22px;">Sua solicitação foi enviada com sucesso</div>
                    </div>
                    <br />
                    <div class="ui huge buttons">
                        <a class="ui primary button" href="${linkTo[SolicitacaoReintegrateController].add}">Nova Solicitação</a>
                        <div class="or"></div>
                        <a class="ui secondary button" href="${linkTo[DashboardController].index}">Dashboard</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="ui basic modal" id="modalInfo">
             <i class="close icon"></i>
            <div class="header">Informação</div>
            <div class="content">
                <div class="left">
                     <i class="info icon"></i>
                </div>
                <div class="right">Calma! Isso ainda não está pronto.
                </div>
            </div>
            <div class="actions">
                <div class="ui button">Okay</div>
            </div>
        </div>
        <div class="ui basic modal" id="modalAddSM">
            <i class="close icon"></i>
            <div class="header">Nova SM</div>
            <div class="content">
                <div class="left">
                     <i class="info icon"></i>
                </div>
                <div class="right">Solicite ao reintegrador a inclusão de uma nova SM para seleção.
                </div>
            </div>
            <div class="actions">
                <div class="ui button">Okay</div>
            </div>
        </div>
        <div class="ui basic modal" id="modalAddActivity">
             <i class="close icon"></i>
            <div class="header">Nova Atividade</div>
            <div class="content">
                <div class="left">
                     <i class="info icon"></i>
                </div>
                <div class="right">Solicite ao reintegrador a inclusão de uma nova atividade para seleção.
                </div>
            </div>
            <div class="actions">
                <div class="ui button">Okay</div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/semantic-ui-0.19.3/js/semantic.min.js"></script>
        <script src="${pageContext.request.contextPath}/semantic-ui-0.19.3/js/tablesort.js"></script>
        <script>
            // APIs Semantic-ui Checkbox e Tablesort - Resolução de conflitos
            var checkboxRevisionsCheckedCache = [],
                checkboxOnChange = function() {
                    $('#formStep2 .ui.checkbox').checkbox({
                            onChange: function() {
                                // em cada mudança de estado de um checkbox um novo cache de selecionados eh armazenado
                                checkboxRevisionsCheckedCache = [];
                                $.each($('#tableRevisions input[type="checkbox"]:checked'), function() {
                                    checkboxRevisionsCheckedCache.push(this.value);
                                });
                            }
                        });
                };
            checkboxOnChange();
            $('#tableRevisions').tablesort().on('tablesort:complete', function(event, tablesort) {
                // em cada sort efetuado o cache eh consultado e os checkboxes sao alterados para o ultimo estado valido
                checkboxRevisionsCheckedCache.forEach(function(revision) {
                    $('#' + revision).prop('checked', true);
                });
                // eh necessario para que o checkbox recupere a sua acao padrao
                checkboxOnChange();
            });

             // API Semantic-UI Checkbox
            $('#noIssue').checkbox({
                onChange: function() {
                    $('#fieldMotivo,#fieldIssues').toggle(400);
                }
            });

             // API Semantic-UI Modal
            $('#modalInfo')
                .modal('attach events', '#btnInfo', 'show')
                .modal('setting', 'transition', 'vertical flip');
            $('#modalAddSM')
                .modal('attach events', '#btnAddSM', 'show')
                .modal('setting', 'transition', 'vertical flip');
            $('#modalAddActivity')
                .modal('attach events', '#btnAddActivity', 'show')
                .modal('setting', 'transition', 'vertical flip');

             // API Semantic-UI Dropdown
            $('#dropdownSM').dropdown({
                onChange: function() {
                    $('#formStep1').addClass('loading');
                    var id = $("#selectedSM").val();
                    $.get("${pageContext.request.contextPath}/sm/filter/" + id, function(data) {
                        $.each(data.atividades, function() {
                            $("#dropdownActivity .menu").append('<div class="item" data-value="' + this.id + '">' + this.descricao + '</div>');
                        });
                        $('#dropdownActivity').dropdown();
                        $('#field2step1').removeClass('disabled');
                        $('#formStep1').removeClass('loading');
                    }, "json");
                }
            });

            // API Semantic-UI Step
            var regexpBtnStep = /^btn(Next|Prev)Step/,
                regexpBtnNext = /^btn(Next)Step/;
            var changeStep = function(tagId) {
                    if (regexpBtnStep.test(tagId)) {
                        var id = parseInt(tagId.replace(regexpBtnStep, ''));
                        $('#formStep' + id).hide(300);
                        $('#step' + id).removeClass('active').addClass('disabled');
                        var change = regexpBtnNext.test(tagId) ? id + 1 : id - 1;
                        $('#formStep' + change).show(300);
                        $('#step' + change).removeClass('disabled').addClass('active');
                    }
                },
                getRevisions = function(tagId) {
                    $('#formStep1').addClass('loading');
                    var id = $("#nrActivity").val();
                    $.get("${pageContext.request.contextPath}/atividade/filter/" + id, function(data) {
                        $.each(data.revisions, function() {
                            var tr = '<tr>' + 
                                        '<td>' + 
                                            '<div class="ui toggle checkbox">' + 
                                                '<input type="checkbox" name="revisions" value="' + this.numero + '" id="r' + this.numero + '">' + 
                                                '<label>' + this.numero + '</label>' + 
                                            '</div>' + 
                                        '</td>' + 
                                        '<td>' + this.autor + '</td>' + 
                                        '<td>' + this.data + ' <i class="time icon"></i> ' + this.data + '</td>' + 
                                        '<td>' + this.descricao + '</td>' + 
                                     '</tr>';
                            $("#tableRevisions tbody").append(tr);
                        });
                        $('#formStep1').removeClass('loading');
                        changeStep(tagId);
                    }, "json");
                };

            $('.ui.secondary.menu .item').click(function() {
                var tagId = $(this).attr('id');
                if (tagId == 'btnNextStep1') {
                    getRevisions(tagId);
                } else {
                    changeStep(tagId);
                }
            });
        </script>
    </body>

</html>