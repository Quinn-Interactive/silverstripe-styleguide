<!DOCTYPE html>
<!--[if !IE]><!-->
<html lang="$ContentLocale" class="no-js">
<!--<![endif]-->
<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->
<head>
	<% base_tag %>
	<title>$SiteConfig.Title &raquo; Style Guide</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	$MetaTags(false)
	<link rel="shortcut icon" href="$ThemeDir/images/favicon.ico" />
    <%-- toggle no-js to js in html tag. must live in head --%>
    <script>
        document.documentElement.className = document.documentElement.className.replace("no-js","js");
    </script>


</head>
<body>
	<div class="">
		$Layout
	</div>
</body>
</html>
