jQuery ->
	$('body').prepend()

	$.ajax
		url: '#{window.location.protocol}//connect.facebook.net/pt_BR/all.js'
		dataType: 'script'
		cache: true

window.fbAsyncInit = ->
	FB.init(appID: '628283833950163', cookie: true)

	$('#sign_in').click (e) ->
		e.preventDefault()
		FB.login (response) ->
			window.location = '/auth/facebook/callback' if response.authResponse

	$('#sign_out').click (e) ->
		FB.getLoginStatus (response) ->
			FB.logout() if response.authResponse
		true