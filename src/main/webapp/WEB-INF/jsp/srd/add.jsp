<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<jsp:include page="../fragment/header.jsp" />

<body>


<!-- ###############################
			Content 
################################# -->
<div class="ui one column page grid">
    <div class="column">


<!-- ###############################
			Menu 
################################# -->
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
		<a class="active item">Solicitação de Reintegrate para Deploy (SRD)</a>
    </div>
</div>


<!-- ###############################
			Steps 
################################# -->
<div class="ui five steps">
    <div class="ui active step" id="step1">Informações Gerais</div>
    <div class="ui disabled step" id="step2">Revisions</div>
    <div class="ui disabled step" id="step3">Issues</div> <!-- Motivo -->
    <div class="ui disabled step" id="step4">Confirmação</div>
    <div class="ui disabled step" id="step5">Pronto!</div>
</div>


<!-- ###############################
			Step 1
################################# -->
<div class="ui small fluid form segment" id="formStep1">
	<br />
	<div class="two fields">
		<div class="field">
			<div class="ui pointing below black label">SM</div>
            <a class="ui pointing below label" href="${linkTo[AdminController].index}" id="btnAddSM" style="float: right;">
				Minha SM não existe!
			</a>
			<div class="ui fluid selection dropdown" id="dropdownSM">
				<input type="hidden" name="sm" id="selectedSM">
				<div class="default text">Selecione...</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<!-- Sample
					<div class="item" data-value="id1">Release Tal</div>
					-->
				</div>
			</div>
		</div>
		<div class="disabled field" id="field2step1">
			<div class="ui pointing below black label">Atividade</div>
			<a class="ui pointing below label" href="${linkTo[AdminController].index}" id="btnAddActivity" style="float: right;">
				Minha atividade não existe!
			</a>
			<div class="ui fluid selection dropdown" id="dropdownActivity">
				<input type="hidden" name="atividade" id="selectedActivity">
				<div class="default text">Selecione...</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<!-- Sample
					<div class="item" data-value="id1">12345: Demanda Tal</div>
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


<!-- ###############################
			Step 2
################################# -->
<div class="ui small fluid form segment" id="formStep2" style="display:none;">
    <br />
    <div class="field">
        <table class="ui middle aligned compact basic small sortable table" id="tableRevisions">
            <thead>
                <tr>
                    <th>Revision</th>
                    <th>Author</th>
                    <th style="width: 130px;">Date</th>
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
  

<!-- ###############################
			Step 3
################################# -->
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
                <div class="header">Especifique um motivo!</div>
                <p>Você está solicitando uma modificação na implementação original que pode estar implantada em ambiente de homologação e em estágio de testes.</p>
            </div>
        </div>
        <div class="grouped inline fields">
            <div class="field" style="padding-bottom: .5em;">
                <div class="ui radio checkbox">
					<input id="choice-1" type="radio" name="noIssues">
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
                    <input id="radioAnotherReason" type="radio" name="noIssues">
                    <label for="radioAnotherReason">Outro motivo:</label>
                </div>
                <input class="fluid" type="text" id="textAnotherReason">
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


<!-- ###############################
			Step 4
################################# -->
<div class="ui small fluid form segment" id="formStep4" style="display:none;">
    <br />
    <div class="ui grid">
        <div class="four wide column"></div>
        <div class="eight wide column">
            <div class="ui secondary inverted segment">
                <div class="ui teal ribbon label">SM</div>
                <p id="pSM"></p>
                <div class="ui teal ribbon label">Atividade</div>
                <p id="pActivity"></p>
                <div class="ui teal ribbon label">Revisions</div>
				<p id="pRevisions"></p>
                <div class="ui teal ribbon label">Issues</div>
                <p id="pReason"></p>
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


<!-- ###############################
			Step 5
################################# -->
<div class="ui center aligned small fluid form segment" id="formStep5" style="display:none;">
	<div class="ui green icon center aligned header" style="font-size: 32px;">
		<i class="circular checkmark icon"></i> Pronto!
		<div class="sub header" style="font-size: 22px;">Sua solicitação foi enviada com sucesso</div>
	</div>
	<br />
	<div class="ui huge buttons">
		<a class="ui primary button" href="${linkTo[SrdController].add}">Nova Solicitação</a>
		<div class="or"></div>
		<a class="ui secondary button" href="${linkTo[DashboardController].index}">Dashboard</a>
	</div>
</div>


<!-- ###############################
			End Content 
################################# -->
	</div>
</div>


<!-- ###############################
			Modal 
################################# -->
<div class="ui basic modal" id="modalInfo">
	<i class="close icon"></i>
    <div class="header">Informação</div>
    <div class="content">
        <div class="left">
			<i class="info icon"></i>
        </div>
        <div class="right">Calma! Isso ainda não está pronto.</div>
    </div>
    <div class="actions">
        <div class="ui button">Okay</div>
    </div>
</div>


<!-- ###############################
			Scripts
################################# -->
<jsp:include page="../fragment/script.jsp" />
<script>


// API Semantic-UI Modal
$('#modalInfo')
    .modal('attach events', '#btnInfo', 'show')
    .modal('setting', 'transition', 'vertical flip');


/* #################################
			Steps
 ################################# */
//API Semantic-UI Step
var regexpBtnStep = /^btn(Next|Prev)Step/,
    regexpBtnNext = /^btn(Next)Step/,
changeStep = function(tagId) {
	if (regexpBtnStep.test(tagId)) {
		var id = parseInt(tagId.replace(regexpBtnStep, ''));
        $('#formStep' + id).hide(300);
        $('#step' + id).removeClass('active').addClass('disabled');
        var change = regexpBtnNext.test(tagId) ? id + 1 : id - 1;
        $('#formStep' + change).show(300);
        $('#step' + change).removeClass('disabled').addClass('active');
    }
};

$('.ui.secondary.menu .item').click(function() {
	var tagId = $(this).attr('id');
	if (tagId != 'btnNextStep4')
		changeStep(tagId);
	switch (tagId) {
		case 'btnNextStep1':
			getRevisions();
			break;
		case 'btnNextStep3':
			buildConfirmation();
			break;
		case 'btnNextStep4':
			$('#formStep4').addClass('loading');
			$.post('${linkTo[SrdController].save}', {
				"srd.atividade.id":	$("#selectedActivity").val(),
				"srd.revisions":	checkboxRevisionsCheckedCache.join(','),
				"srd.motivo":		getReason()
			}, function(confirmation) { // true or false
            	$('#formStep4').removeClass('loading');
				if (confirmation) {
					changeStep(tagId);
				} else {
					// TODO Mostrar mensagem e solicitar o reenvio da informação
				}
	        });
			break;
	}
});


/* #################################
			Step 1
 ################################# */
$('#formStep1').addClass('loading');
//API jQuery Get
$.get('${linkTo[SolicitacaoMudancaController].list}', function(SMs) {
	if (SMs.length) {
		SMs.forEach(function(sm) {
			$("#dropdownSM .menu").append('<div class="item" data-value="'+sm.id+'">'+sm.nome+'</div>');
    	});
		// API Semantic-UI Dropdown
		$('#dropdownSM').dropdown({
		    onChange: function() {
		        $('#formStep1').addClass('loading');
		        $('#field2step1').addClass('disabled');
		        var idSM = $("#selectedSM").val();
				$("#dropdownActivity .menu .item").remove();
				// API jQuery Get
				$.get('${linkTo[AtividadeController].list}', {"sm.id":idSM}, function(activities) {
					if (activities.length) {
						activities.forEach(function(activity) {
							$("#dropdownActivity .menu").append('<div class="item" data-value="'+activity.id+'">'+activity.descricao+'</div>');
						});
						$('#dropdownActivity').dropdown();
		                $('#field2step1').removeClass('disabled');
					} else {
						alert("Nenhuma atividade cadastrada para essa SM.");
					}
		        }, 'json')
		        .done(function() {
		            $('#formStep1').removeClass('loading');
		        });
		    }
		});
   	} else {
   		alert("Nenhuma SM cadastrada!");
   	}
}, 'json')
.done(function() {
	$('#formStep1').removeClass('loading');
});


/* #################################
			Step 2
################################# */
// Resolução de conflitos entre APIs Semantic-ui Checkbox e Tablesort
var checkboxRevisionsCheckedCache = [],
checkboxOnChange = function() {
	// APIs Semantic-ui Checkbox
    $('#formStep2 .ui.checkbox').checkbox({
		onChange: function() {
			// em cada mudança de estado de um checkbox um novo cache de selecionados eh armazenado
			checkboxRevisionsCheckedCache = [];
			$.each($('#tableRevisions input[type="checkbox"]:checked'), function() {
				checkboxRevisionsCheckedCache.push(this.value);
			});
		}
	});
},
getRevisions = function(tagId) {
    $('#formStep2').addClass('loading');
    var idActivity = $("#selectedActivity").val();
	$("#tableRevisions tbody tr").remove();
	// API jQuery Get
	$.get('${linkTo[AtividadeController].getRevisions}', {"atividade.id":idActivity}, function(revisions) {
		if (revisions.length) {
			revisions.forEach(function(revision) {
				var tr = '' +
				'<tr>' +
                	'<td>' + 
	                    '<div class="ui toggle checkbox">' + 
	                        '<input type="checkbox" name="revisions" value="' + revision.id + '" id="r' + revision.id + '">' + 
	                        '<label>' + revision.id + '</label>' + 
	                    '</div>' + 
	                '</td>' + 
	                '<td>' + revision.autor + '</td>' + 
	                '<td>' + revision.data.replace(/\s/,' <i class="time icon"></i> ') + '</td>' + 
	                '<td>' + revision.descricao + '</td>' + 
				'</tr>';
				$("#tableRevisions tbody").append(tr);
			});
			checkboxOnChange();
		} else {
			alert("Nenhuma revisions encontrada!");
		}
    }, 'json')
    .done(function() {
        $('#formStep2').removeClass('loading');
    });
};
// API Tablesort
$('#tableRevisions').tablesort().on('tablesort:complete', function(event, tablesort) {
    // em cada sort efetuado o cache eh consultado e os checkboxes sao alterados para o ultimo estado valido
    checkboxRevisionsCheckedCache.forEach(function(revision) {
        $('#r' + revision).prop('checked', true);
    });
    // eh necessario para que o checkbox recupere a sua acao padrao
    checkboxOnChange();
});


/* #################################
			Step 3
################################# */
//API Semantic-UI Checkbox
$('#noIssue').checkbox({
    onChange: function() {
        $('#fieldMotivo,#fieldIssues').toggle(400);
    }
});


/* #################################
			Step 4
################################# */
var getReason = function() {
	if ($('#noIssue input').is(':checked')) {
		var checked = $('#fieldMotivo input[name="noIssues"]:checked');
		if (checked.attr('id') == 'radioAnotherReason')
			return $('#textAnotherReason').val();
		else 
			return checked.next('label').text();
	} 
	else return $('#fieldIssues input').val();
},
buildConfirmation = function() {
	$('#pSM').text($("#dropdownSM .menu").find('div[data-value="'+$("#selectedSM").val()+'"]').text());
	$('#pActivity').text($("#dropdownActivity .menu").find('div[data-value="'+$("#selectedActivity").val()+'"]').text());
	$('#pRevisions').text(checkboxRevisionsCheckedCache.join(', '));
	$('#pReason').text(getReason());
};


</script>
        
</body>

</html>