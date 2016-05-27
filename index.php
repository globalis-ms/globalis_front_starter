<!doctype html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Front starter</title>
    <link href="public/css/main.css" rel="stylesheet">
</head>
<body>

    <!-- Demo purpose only, remove this -->
    <main class="container">
        <h1>Install GLOBALIS Front starter <i class="glyphicon glyphicon-heart"></i></h1>
        <p>On <b>Truite</b>, execute:</p>
        <pre><code>git clone /usr/local/apache/htdocs/nicolas/_public/front_starter your_project
cd your_project
rm -Rf .git
git init

npm run init
npm run watch</code></pre>
        <p>Read <code>readme.md</code> to get started.</p>
    </main>


    <!-- Scripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    <script>if (!window.jQuery) { document.write('<script src="bower_components/jquery/dist/jquery.min.js"><\/script>'); }</script>
    <script src="bower_components/bootstrap-sass/assets/javascripts/bootstrap.min.js"></script>
    <script src="public/js/main.js"></script>
</body>
</html>
