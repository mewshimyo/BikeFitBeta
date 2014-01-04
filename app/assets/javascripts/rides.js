var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!

var yyyy = today.getFullYear();
if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} today = yyyy+'-'+mm+'-'+dd;

function checkTime() {
	var time = $("#time").val();
	if (time != ""){
		if (time != "0") {
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
}

function checkDist() {
	var distance = $("#distance").val();
	if (distance != ""){
		if (distance != "0") {
			return true;
		}
		else {
			return false;
		}
	}
	else {
		return false;
	}
}

function checkDate() {
	if ($("#date").val() != "") {
		$("#dateWarn").hide();
		return true;
	}
	else {
		$("#dateWarn").show();
		return false;
	}
}

function checkReq() {
	if (checkDist()||checkTime()) {
		$("span#distWarn").hide();
		return true;
	}
	else {
		$("span#distWarn").show();
		return false;
	}
}
$(document).ready(function() {
	$("#hhmm").hide();
	$("#submit").hide(); //Don't allow submission until conditions are met!
	$("#date").val(today); // Set the default value of the box 
	$("#time").on('change', function() { // converts minutes into HH:MM format
		if (checkTime()) {
			$("#hhmm").show();
			var baseMinutes = $(this).val();
			var minutes = (baseMinutes%60);
			var hours = (baseMinutes-minutes)/60;
			$("#hhmm").text("= " +hours + " hours, "+minutes+" minutes");
		}
		else {
			$("#hhmm").hide();
		}
	});

	$("input.required").on('change', function() {
		$("#submit").hide();
		if (checkDate() && checkReq()) {
			$("#submit").show();			
		}

	});

});

