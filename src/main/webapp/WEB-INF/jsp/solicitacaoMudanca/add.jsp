<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properities -->
        <title>Deployment Monitor - Nova Solicitação</title>
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="semantic-ui-0.19.3/css/semantic.min.css">
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
                            <a class="item" href="index.html">
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
                            <div class="ui pointing below black label">
                                SM
                            </div>
                            <a class="ui pointing below label" id="btnAddSM" style="float: right;">
                                Minha SM não existe!
                            </a>
                            <div class="ui fluid selection dropdown" id="dropdownSM">
                                <input type="hidden" name="sm">
                                <div class="default text">Selecione...</div>
                                 <i class="dropdown icon"></i>
                                <div class="menu">
                                    <div class="item" data-value="id1">Release 9</div>
                                    <div class="item" data-value="id2">CRQ00000012345</div>
                                </div>
                            </div>
                        </div>
                        <div class="disabled field" id="field2step1">
                            <div class="ui pointing below black label">
                                Demanda
                            </div>
                            <a class="ui pointing below label" id="btnAddDemand" style="float: right;">
                                Minha demanda não existe!
                            </a>
                            <div class="ui fluid selection dropdown" id="dropdownDemand">
                                <input type="hidden" name="demanda">
                                <div class="default text">Selecione...</div>
                                 <i class="dropdown icon"></i>
                                <div class="menu">
                                    <div class="item" data-value="id1">12345: Uma demanda</div>
                                    <div class="item" data-value="id2">456: Um QC</div>
                                    <div class="item" data-value="id3">567890: Um INC</div>
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
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[1]" value="22357" id="22357">
                                            <label>22357</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>06 Jun, 2014 <i class="time icon"></i> 13:21</td>
                                    <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[2]" value="22358" id="22358">
                                            <label>22358</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>06 Jun, 2014 <i class="time icon"></i> 13:34</td>
                                    <td>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[3]" value="22359" id="22359">
                                            <label>22359</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>06 Jun, 2014 <i class="time icon"></i> 14:12</td>
                                    <td>Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[4]" value="22363" id="22363">
                                            <label>22363</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>07 Jun, 2014 <i class="time icon"></i> 08:02</td>
                                    <td>Quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[5]" value="22364" id="22364">
                                            <label>22364</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>07 Jun, 2014 <i class="time icon"></i> 08:04</td>
                                    <td>Tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[6]" value="22367" id="22367">
                                            <label>22367</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>07 Jun, 2014 <i class="time icon"></i> 08:55</td>
                                    <td>Ut wisi minim veniam, quis tation ullamcorper suscipit ut aliquip ex ea commodo.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="ui toggle checkbox">
                                            <input type="checkbox" name="revisions[7]" value="22377" id="22377">
                                            <label>22377</label>
                                        </div>
                                    </td>
                                    <td>viniciusknob</td>
                                    <td>08 Jun, 2014 <i class="time icon"></i> 12:33</td>
                                    <td>Wisi enim veniam, tation ullamcorper suscipit ut aliquip ex ea commodo consequat.</td>
                                </tr>
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
                                    <label for="choice-1">Esta é a primeira SRD da demanda</label>
                                </div>
                            </div>
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input id="choice-2" type="radio" name="noIssues">
                                    <label for="choice-2">Esta demanda ainda não está em testes</label>
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
                                <div class="ui teal ribbon label">Demanda</div>
                                <p>D22344: Um teste de demanda em homologação</p>
                                <div class="ui teal ribbon label">Revisions</div>
                                <p>12122, 12334, 44323, 55456</p>
                                <div class="ui teal ribbon label">Issues</div>
                                <p>Esta demanda ainda não está em testes</p>
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
                        <div class="ui primary button">Nova Solicitação
                        </div>
                        <div class="or"></div>
                        <div class="ui secondary button">Dashboard
                        </div>
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
        <div class="ui basic modal" id="modalAddDemand">
             <i class="close icon"></i>
            <div class="header">Nova Demanda</div>
            <div class="content">
                <div class="left">
                     <i class="info icon"></i>
                </div>
                <div class="right">Solicite ao reintegrador a inclusão de uma nova demanda para seleção.
                </div>
            </div>
            <div class="actions">
                <div class="ui button">Okay</div>
            </div>
        </div>

        <!-- Scripts -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="semantic-ui-0.19.3/js/semantic.min.js"></script>
        <script src="semantic-ui-0.19.3/js/tablesort.js"></script>
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
            $('#modalAddDemand')
                .modal('attach events', '#btnAddDemand', 'show')
                .modal('setting', 'transition', 'vertical flip');

             // API Semantic-UI Dropdown
            $('#dropdownSM').dropdown({
                    onChange: function() {
                        $('#formStep1').addClass('loading');
                        // aqui deve ser efetuada uma chamada ajax pesquisando pelo escopo da SM escolhida
                        // e populando o dropdown de demandas.
                        setTimeout(function() {
                            // simulacao de retorno do ajax
                            $('#dropdownDemand').dropdown();
                            $('#field2step1').removeClass('disabled');
                            $('#formStep1').removeClass('loading');
                        }, 2000);
                    }
                });

             // API Semantic-UI Step
            var regexpBtnStep = /^btn(Next|Prev)Step/,
                regexpBtnNext = /^btn(Next)Step/;
            $('.ui.secondary.menu .item').click(function() {
                var tagId = $(this).attr('id');
                if (regexpBtnStep.test(tagId)) {
                    var id = parseInt(tagId.replace(regexpBtnStep, ''));
                    $('#formStep' + id).hide(300);
                    $('#step' + id).removeClass('active').addClass('disabled');
                    var change = regexpBtnNext.test(tagId) ? id + 1 : id - 1;
                    $('#formStep' + change).show(300);
                    $('#step' + change).removeClass('disabled').addClass('active');
                }
            });
        </script>
    </body>

</html>