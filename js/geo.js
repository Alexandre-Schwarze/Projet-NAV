$(document).ready(function() {
	geo();
});

var first = true;
var carte;
var latitude;
var longitude;
var navigation = false;
var direction;
var directionsService = new google.maps.DirectionsService();
var latlng;
var markers = [];
var marker = new google.maps.Marker({ 
	title:'Vous etes ici',
	icon: 'https://maps.google.com/mapfiles/ms/icons/green-dot.png'
});

function calculate(dest){
	navigation = true;
	$("#suivi").attr("checked",false).checkboxradio("refresh");
	var origin = latitude + ',' + longitude;
	var destination = dest;
	direction.setMap(carte);
	if(origin && destination){
		var request = {
			origin: origin,
			destination: destination,
			travelMode: google.maps.DirectionsTravelMode.DRIVING
		}

		directionsService.route(request, function(result, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				direction.setDirections(result);
			}
		});
	}
};

function centrer() {
	latlng = new google.maps.LatLng(latitude, longitude);
	carte.setCenter(latlng);
	carte.setZoom(16);
}

function genererMap() {
	first = false;
	direction = new google.maps.DirectionsRenderer();
	latlng = new google.maps.LatLng(latitude, longitude);
	var options = {
		zoom: 16,
		scaleControl: true,
		streetViewControl: false,
		mapTypeControl: false,
		center: latlng,
		mapTypeId: google.maps.MapTypeId.PLAN
	};
	carte = new google.maps.Map(document.getElementById("carte"), options);
	load_alertes();
}

function affichercarte() {
	latlng = new google.maps.LatLng(latitude, longitude);
	marker.setPosition(latlng);
	marker.setMap(carte);

	if (document.getElementById('suivi').checked == true) {
		navigation = false;
	} else {
		navigation = true;
	}

	if (navigation != true) {
		centrer();
	}
}

function geo() {
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(
			geo_ok,
			geo_error, 
			{ enableHighAccuracy:true, maximumAge:5000}
			);
	} else {
		alert("Veuillez activer la géolocalisation de votre support !");
	}
}

function geo_ok(position) {
	latitude = position.coords.latitude;
	longitude = position.coords.longitude;
	if (first == false) {
		affichercarte();
	} else {
		first = false;
		genererMap();
	}
	load_alertes();
	setTimeout(geo,2500);
	//setInterval(geo,2500);
}

function geo_error(error) {
	alert("Veuillez activer la géolocalisation de votre support !");  
}

function load_alertes() {
	$.post("php/getAlertArea.php", {
		latitude1: latitude,
		longitude1: longitude
	}, function(result) {
		var table_alertes = readCookie("types");
		table_alertes = table_alertes.split(",");
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
		if (result != null) {
			for (var i = 0; i < result.length; i++) {
				var latlngX = new google.maps.LatLng(result[i].latitude, result[i].longitude);
				var marker1 = new google.maps.Marker({position: latlngX });
				marker1.setIcon('themes/images/' + result[i].icon);
				if (table_alertes[0] != null) {
					for (var x = 0; x < table_alertes.length; x++) {
						if (result[i].nom == table_alertes[x]) {
							markers.push(marker1);
							marker1.setMap(carte);
						}
					}
				}
			}
		} else {
			alert("Erreur de connexion !");
		}
	}, 'json');
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for (var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}