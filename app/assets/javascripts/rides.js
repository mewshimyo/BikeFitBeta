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
		$("#dateWarn").fadeOut();
		return true;
	}
	else {
		$("#dateWarn").fadeIn();
		return false;
	}
}

function checkReq() {
	if (checkDist()||checkTime()) {
		$("span#distWarn").fadeOut();
		return true;
	}
	else {
		$("span#distWarn").fadeIn();
		return false;
	}
}
$(document).ready(function() {
	$("#hhmm").hide();
	$("#submit").hide(); //Don't allow submission until conditions are met!
	$("#date").val(today); // Set the default value of the box 
	$("#time").on('change', function() { // converts minutes into HH:MM format
		if (checkTime()) {
			$("#hhmm").fadeIn();
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
		if (checkDate() && checkReq()) {
			$("#submit").animate({'margin-left': "0px"}, {queue: false});
			$("#submit").fadeIn();				
		}
		else {
			$("#submit").animate({'margin-left': "88px"}, {queue: false});
			$("#submit").fadeOut();

		}

	});

});

