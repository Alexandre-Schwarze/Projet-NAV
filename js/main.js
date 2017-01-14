$(document).ready(function()
{
// Partie Affichage //

var auth = $("#auth");
var header = $("#mainhead");
var trajet = $("#head1");
var alertes = $("#head2");
var divcarte = $("#carte");
var inscr = $("#inscr");
var main= $("#main");
var param = $("#param");
var populated = false;
var trajetencours = false;
var pageheight = window.screen.availHeight;
var pagewidth = window.screen.availWidth;
type_alerte = null;

/*****************************************************************************************/

//alert = function() {};

/*****************************************************************************************/


trajet.hide();
alertes.hide();
populateparams();

// RAFRAICHISSEMENT DE LA PAGE //

	if(getCookie("login") == null)
	{

		$(':mobile-pagecontainer').pagecontainer('change', '#auth', {
				transition: 'pop',
				changeHash: false,
				reverse: false,
				showLoadMsg: false
	    });
	}
	else
	{
			$(':mobile-pagecontainer').pagecontainer('change', '#main', {
			transition: 'pop',
			changeHash: false,
			reverse: false,
			showLoadMsg: false
    });

	}



//CARTE //
geo();
resize();
// Bouton Suivi //
$("#flip-1").on("change", function() {
 navigation = !navigation;
});

$("#centerbtn").click(function()
{
	centrer();
});

// Rafraichissement Alertes //
setInterval(load_alertes,60000);


// INSCRIPTION / CREATION COMPTE //
$("#btn-inscr").click(function ()
{
	$(':mobile-pagecontainer').pagecontainer('change', '#inscr', {
        transition: 'flip',
        changeHash: false,
        reverse: false,
        showLoadMsg: false
    });
});

$("#btn-rtr").click(function ()
{
	$(':mobile-pagecontainer').pagecontainer('change', '#auth', {
        transition: 'flip',
        changeHash: false,
        reverse: false,
        showLoadMsg: false
    });
    console.log("tested2");
});

$("#btn-crea").click(function ()
{
	var lenom = $("#nom").val();
	var leprenom = $("#prenom").val();
	var lemail = $("#lemail").val();
	var lemdp = $("#lemdp").val();

		console.log(lemdp);

	if(lenom && leprenom && lemdp && ValidateEmail(lemail))
	{
		$.post("php/insert_user.php",
		{
			nom : lenom,
			prenom : leprenom,
			email : lemail,
			mdp : lemdp
		},function(result)
		{
			console.log(result.message);
			if(result.message == "ok")
			{
				$("#headermsg").html("Succès");
				$("#corpmsg").html("Compte créé");
				$("#redirect").attr("href", "#auth");

				$(':mobile-pagecontainer').pagecontainer('change', '#succes-crea', {
		        transition: 'pop',
		        changeHash: false,
		        reverse: false,
		        showLoadMsg: false
	    		});
			}
			else if(result.message == "ko")
			{
				$("#headermsg").html("Erreur");
				$("#corpmsg").html("Erreur d'insertion !");
				$("#redirect").attr("href", "#inscr");
				$(':mobile-pagecontainer').pagecontainer('change', '#succes-crea', {
				transition: 'pop',
				changeHash: false,
				reverse: false,
				showLoadMsg: false
				});
			}
			else if(result.message == "ko2")
			{
				$("#headermsg").html("Erreur");
				$("#corpmsg").html("Utilisateur déjà existant !");
				$("#redirect").attr("href", "#inscr");
				$(':mobile-pagecontainer').pagecontainer('change', '#succes-crea', {
				transition: 'pop',
				changeHash: false,
				reverse: false,
				showLoadMsg: false
				});
			}

		}, 'json');
	}
	else
	{
		$("#headermsg").html("Erreur");
		$("#corpmsg").html("Un des champs est vide ou incorrect");
		$("#redirect").attr("href", "#inscr");
		$(':mobile-pagecontainer').pagecontainer('change', '#succes-crea', {
        transition: 'pop',
        changeHash: false,
        reverse: false,
        showLoadMsg: false
		});
	}
});






// PARAMETRES //
// Click de l'option paramètres du menu //
$("#parametres").click(function ()
{

	testcookie();
	trajet.hide("slow");
	alertes.hide("slow");

	$(':mobile-pagecontainer').pagecontainer('change', '#param', {
    transition: 'flip',
    changeHash: false,
    reverse: false,
    showLoadMsg: false
	});

	$("div[data-role='page']").height(window.screen.availHeight);

});

// Ajouter les types d'alertes //
function populateparams()
{
	$.post("php/recup_alertes.php",
			{
			}, function(result)
			{
				if(getCookie('types') == null)
				{
					createCookie("types", null);
				}

				var chaine = readCookie("types");
				var tab  = chaine.split(',');
				var found;

				for (var i = 0; i < result.length; i++)
				{
					found = false;
					for(var x = 0; x < tab.length; x++)
					{

						if(result[i].nom == tab[x])
						{
							found = true;
						}
					}
					if(found == true)
					{
						$("#choixalertes").append(''+
						'<input name="'+result[i].nom+'" class="types" type="checkbox" id="check-'+result[i].nom+'" checked/>'+
						'<label for="check-'+result[i].nom+'">'+
						'<img id="'+result[i].nom+'" src="themes/images/'+result[i].icon+'" class="check" border="0"/>'+
						' &nbsp;&nbsp;&nbsp;'+result[i].nom+
						'</label>');
					}
					else
					{
						$("#choixalertes").append(''+
						'<input name="'+result[i].nom+'" class="types" type="checkbox" id="check-'+result[i].nom+'"/>'+
						'<label for="check-'+result[i].nom+'">'+
						'<img id="'+result[i].nom+'" src="themes/images/'+result[i].icon+'" class="check" border="0"/>'+
						' &nbsp;&nbsp;&nbsp;'+result[i].nom+
						'</label>');
					}
				}

			$('[data-role="page"]').trigger('create');
			}, 'json');
}

// Click du bouton 'Tout sélectionner' //
$("#checkall").change(function ()
{
	$("input:checkbox").prop('checked', $(this).prop("checked")).checkboxradio('refresh');
});


// Click du bouton valider paramètres //
$("#valid-param").click(function ()
{
	testcookie();
	var cookietypes;
	var types = [];
	var checkboxes = $("input :checkbox");
	var i = 0;
	$('.types').each(function(){
		if(this.checked)
		{
			types[i] = this.name;
			i++;
		}
    });

	if(types[0] != null)
	{
		createCookie("types", types);
	}

	$(':mobile-pagecontainer').pagecontainer('change', '#main', {
    transition: 'flip',
    changeHash: false,
    reverse: false,
    showLoadMsg: false
	});
});




// TRAJET //
$("#trajet").click(function ()
{
	testcookie();
	if(trajetencours == true)
	{
		$("#btn-annuler").css('display',"block");
	}

	if(trajet.css('display') == "block")
		{
			trajet.hide("slow");
		}
		else
		{
			trajet.show("slow");
		}
	alertes.hide("slow");
});

$("#btn-trajet").click(function ()
{
	var destination = $("#end").val();
	calculate(destination);
	testcookie();
	trajet.hide("slow");
	trajetencours = true;
});

$("#btn-annuler").click(function ()
{
	supressTrajet();
});

function supressTrajet()
{
	direction.setMap(null);
	trajetencours = false;
	$("#btn-annuler").css('display',"none");
	trajet.hide("slow");
}



// ALERTES //
$("#btn-alert").click(function ()
{
	testcookie();
	var choisie;
	$("input[type=radio]").each(function(){
		if(this.checked)
		{
			choisie = this.id;
		}
	});

	if(choisie != null)
	{
		$.post("php/insert_alertArea_final.php",
			{
				login : readCookie("login"),
				longi : longitude,
				lati : latitude,
				type : choisie
			}, function(result)
			{

				if(result.message == "ok")
				{
					alertes.hide("slow");
					load_alertes();
				}
				else
				{
					$("#errortext").html("");
					$("#errortext").html("Erreur de création de l'alerte </br> Veuillez réessayer s'il vous plaît");
				}
			}, 'json');
	}
});


$("#alertes").click(function ()
{
	testcookie();
	trajet.hide("slow");

	if(alertes.css('display') == "block")
	{
		alertes.hide("slow");
	}
	else
	{
		if(!populated)
		{

			var totalwidth = window.screen.availWidth;
			$.post("php/recup_alertes.php",
			{
			}, function(result)
			{
				var iconwidth = (totalwidth/result.length);

				var rep = '<fieldset id="icons" data-role="controlgroup" data-type="horizontal"> <legend id="legend"><h4>Choisir une alerte à placer ici: </h4></legend>';

				for (var i = 0; i < result.length; i++)
				{

					rep += '<input id="'+result[i].iDtype_alerte+'" type="radio" name="radiobutton" style="border: 5%;" />'+
					'<label for="'+result[i].iDtype_alerte+'">'+
					'<img src="themes/images/'+result[i].icon+'" class="check"  border="0"/>'+
					'</label>';
				}
				rep += '</fieldset>';
				$("#formtest").html(rep);
				populated = true;
				$('[data-role="page"]').trigger('create');

			}, 'json');
		}

		alertes.show("slow");
		resize();
	}

});



// AUTHENTIFICATION //
$("#btn-auth").click(function ()
{
	authentification();
});
	function authentification()
	{
		$.post("php/con_user_db.php",
		{
			email : $("#login").val(),
			mdp : $("#mdp").val()

		},function(result)
		{
			if(result.message == "ok")
			{
				var login = $("#login").val();
				var name = login.split('@', 1);
				createCookie("login",login, 1);

				$(':mobile-pagecontainer').pagecontainer('change', '#main', {
		        transition: 'flip',
		        changeHash: false,
		        reverse: false,
		        showLoadMsg: false
	    		});
			}
			else if (result.message == "ko")
			{
				$("#errormsg").html("");
				$("#errormsg").append("Mauvais couple identifiant/mot de passe");
				$(':mobile-pagecontainer').pagecontainer('change', '#erreur-auth',
					{
		        transition: 'pop',
		        changeHash: false,
		        reverse: false,
		        showLoadMsg: false
	    		});
			}
			else if(result.message.search("SQLSTATE") > 0 )
			{
				alert("test");
				$("#errormsg").html("");
				$("#errormsg").append("Désolé, nous avons un problème avec la base de données ! Il sera résolu dans les plus brefs délais ...");
				$(':mobile-pagecontainer').pagecontainer('change', '#erreur-auth',
					{
		        transition: 'pop',
		        changeHash: false,
		        reverse: false,
		        showLoadMsg: false
	    		});
			}

		}, 'json');
	}


// Design //

function resize()
{
	var header = $("#mainhead").height();
	var windowh = $(window).height();
	var sizemap = windowh - header;
	$("div[data-role='page']").height(window.screen.availHeight);
	$("#carte").height(sizemap);
}


// Fonctions cookies //
function createCookie(name,login,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+login+expires+"; path=/";
}

function readCookie(name) {
	var nameEQ = name + "=";
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function testcookie()
{
	if(getCookie("login") == null)
	{
		$(':mobile-pagecontainer').pagecontainer('change', '#auth', {
				transition: 'pop',
				changeHash: false,
				reverse: false,
				showLoadMsg: false
	    });
	    resize();
	}
}



function getCookie(name) {
    var dc = document.cookie;
    var prefix = name + "=";
    var begin = dc.indexOf("; " + prefix);
    if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
    }
    else
    {
        begin += 2;
        var end = document.cookie.indexOf(";", begin);
        if (end == -1) {
        end = dc.length;
        }
    }
    return decodeURI(dc.substring(begin + prefix.length, end));
}

// Outils //

function ValidateEmail(mail)
{
 if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(mail))
  {
    return (true)
  }
    return (false)
}


});

